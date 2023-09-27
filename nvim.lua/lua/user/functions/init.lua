
function profile_start()
  vim.cmd([[
  profile start nvim-profile.log
  profile func *
  profile file *
]])
  print "started profiling file: nvim-profile.log";
end
function profile_end()
  vim.cmd([[
  profile pause
  noautocmd qall!
]])
  print "end profiling file: nvim-profile.log";
end

vim.api.nvim_create_user_command('ProfileStart', profile_start, { nargs = 0 });
vim.api.nvim_create_user_command("ProfileEnd", profile_end, { nargs = 0 });
