# Remote Install Requirements (Checklist)

Before running `arch.sh` remotely, make sure **all of the following are true**:

### Target PC (Arch ISO)

* [ ] Booted using the **official Arch Linux ISO**
* [ ] You are at the `root@archiso` prompt
* [ ] Internet access is working

  ```bash
  ping -c 3 archlinux.org
  ```
* [ ] Root password has been set (required for SSH)

  ```bash
  passwd
  ```
* [ ] SSH service is running

  ```bash
  systemctl status sshd
  ```
* [ ] You know the target PC’s IP address

  ```bash
  ip a
  ```

### Assistant PC (Your workstation)

* [ ] Has SSH client installed
* [ ] Can reach the target PC over the network
* [ ] Stable network connection

### Safety Checks ⚠️

* [ ] **Correct target machine** (disk will be wiped)
* [ ] You understand that `arch.sh` performs a **destructive install**
* [ ] No important data exists on the target disk

---

## Recommended (but optional)

* [ ] Wired Ethernet instead of Wi-Fi
* [ ] UEFI system with Secure Boot disabled
* [ ] Power source connected (laptops)

