local home = os.getenv("HOME")
-- hash workspace directory name for workspace uniqueness
local function workspace_hash(root_dir)
  local hash = vim.fn.sha256(root_dir):sub(1, 8)
  return vim.fn.fnamemodify(root_dir, ":t") .. "-" .. hash
end
-- java lsp
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        -- disable jdtls config from lspconfig
        jdtls = function()
          return true
        end,
      },
    },
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = function()
      local root_dir = vim.fs.dirname(
        vim.fs.find({ "gradlew", ".gradlew", ".git", "mvnw", ".mvnw", "pom.xml", "build.gradle" }, { upward = true })[1]
      )
      local capabilities = LazyVim.has("cmp-nvim-lsp") and require("cmp_nvim_lsp").default_capabilities() or nil
      -- calculate workspace dir
      local workspace_dir = vim.fn.stdpath("data") .. "/site/java/workspace-root/" .. workspace_hash(root_dir)
      -- get the mason install path
      local install_path = vim.fn.expand("$MASON/packages/jdtls")
      -- local install_path = require("mason-registry").get_package("jdtls"):get_install_path()
      -- local debug_install_path = require("mason-registry").get_package("java-debug-adapter"):get_install_path()
      local config = {
        cmd = {
          install_path .. "/bin/jdtls",
          "--Dosgi.bundles.defaultStartLevel=4",
          "--Dexlipse.product=org.eclipse.jdt.ls.core.product",
          -- "--Dlog.level=ALL",
          -- "--Dlog.protocol=true",
          "--add-modules=ALL-SYSTEM",
          "--add-opens",
          "java.base/java.util=ALL_UNNAMED",
          "--add-opens",
          "java.base/java.lang=ALL_UNNAMED",
          "--Xms526m",
          "--Xmx2g",
          "--jvm-arg=-javaagent:" .. install_path .. "/lombok.jar",
          "-data",
          workspace_dir,
        },

        settings = {
          java = {
            java_executable = "/usr/bin/java",
            format = {
              settings = {
                -- Use Google Java style guidelines for formatting
                -- To use, make sure to download the file from https://github.com/google/styleguide/blob/gh-pages/eclipse-java-google-style.xml
                -- and place it in the ~/.local/share/eclipse directory
                url = home .. "/.config/nvim/formatters/eclipse-java-google-style.xml",
                profile = "GoogleStyle",
              },
            },
            signatureHelp = { enabled = true },
            eclipse = { downloadSources = false },
            maven = { downloadSources = false },
            implementationsCodeLens = false,
            referencesCodeLens = false,
            references = { includeDecompiledSources = false },
            contentProvider = { preferred = "fernflower" },
            -- Specify any completion options
            completion = {
              favoriteStaticMembers = {
                "org.hamcrest.MatcherAssert.assertThat",
                "org.hamcrest.Matchers.*",
                "org.hamcrest.CoreMatchers.*",
                "org.junit.jupiter.api.Assertions.*",
                "java.util.Objects.requireNonNull",
                "java.util.Objects.requireNonNullElse",
                "org.mockito.Mockito.*",
              },
              importOrder = {
                "java",
                "javax",
                "com",
                "co",
                "org",
              },
              -- filteredTypes = {
              --   "com.sun.*",
              --   "io.micrometer.shaded.*",
              --   "java.awt.*",
              --   "jdk.*",
              --   "sun.*",
              -- },
            },
            -- Specify any options for organizing imports
            -- sources = {
            --   organizeImports = {
            --     starThreshold = 9999,
            --     staticStarThreshold = 9999,
            --   },
            -- },
            -- How code generation should act
            codeGeneration = {
              toString = {
                template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
              },
              hashCodeEquals = {
                useJava7Objects = true,
              },
              useBlocks = true,
            },

            -- If you are developing in projects with different Java versions, you need
            -- to tell eclipse.jdt.ls to use the location of the JDK for your Java version
            -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
            -- And search for `interface RuntimeOption`
            -- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
            configuration = {
              -- runtimes = {
              --   {
              --     name = "JavaJDK-17",
              --     path = home .. "/.sdkman/candidates/java/current",
              --   },
              -- },
            },
          },
        },
        flags = {
          allow_incremental_sync = true,
        },
        capabilities = capabilities,
        root_dir = root_dir,
      }
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          local clients = vim.lsp.get_clients({ bufnr = 0 })
          for _, c in ipairs(clients) do
            if c.name == "jdtls" then
              return
            end
          end
          require("jdtls").start_or_attach(config)
        end,
      })
    end,
  },
}
