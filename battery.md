- disable wakeup devices 
```bash
#!/bin/bash
for dev in PEG0 XHCI TDM0 TDM1 TRP1 TRP2 RP01 RP08 RP09; do
    echo $dev > /proc/acpi/wakeup
done
```

- install tlp

- install thinkfan 
```bash
# /etc/modprobe.d/thinkfan.conf 
options thinkpad_acpi fan_control=1
```

- grub options
```bash
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash thinkpad_acpi.fan_control=1 iwlwifi.power_save=1 pcie_aspm=force mem_sleep_default=deep"
```
