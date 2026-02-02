# Arch Openbox Host Dev Setup

## Remote Arch Installation (Base System)

This project includes an **`arch.sh`** script to install the Arch Linux base system remotely over SSH.
This step is intended to be executed **from the Arch ISO environment** as the very first step.

### 1. Boot the target PC with Arch ISO

You should see the prompt:

```bash
root@archiso
```

### 2. Set a root password (required for SSH)

```bash
passwd
```

### 3. Get the IP address of the target PC

```bash
ip a
```

Take note of the IP address.

### 4. From a second PC (assistant machine), connect via SSH

```bash
ssh root@<IP_ADDRESS>
```

### 5. Clone the repository and run the installer

```bash
git clone https://github.com/rjfortis/arch-openbox-hostdev.git
cd arch-openbox-hostdev
chmod +x arch.sh
./arch.sh
```

> ⚠️ The system will **reboot automatically** once the base installation finishes.

---

## Setup (Post-install)

After the system boots into the newly installed Arch environment, log in as your user and run:

```bash
git clone https://github.com/rjfortis/arch-openbox-hostdev.git
cd arch-openbox-hostdev
chmod +x setup.sh
./setup.sh
```

This will install:

* Openbox desktop
* Development tools
* Docker
* Nix / Nix profile tools
* Tailscale
* Lazyvim
* Additional system utilities

---

## Why this structure is good

* `arch.sh` → **one-time, destructive, base install**
* `setup.sh` → **safe, repeatable, post-install setup**
* Clean separation of responsibilities
* Perfect for remote installs and reprovisioning

## Optional: Git & SSH setup

```bash
chmod +x git-ssh.sh
./git-ssh.sh
```

## Post-install: Tailscale

After the system is installed and `tailscaled` is running, you must authenticate the machine:

```bash
sudo tailscale up
```

This will:

* Open a browser for authentication **or**
* Print a login URL if no browser is available

Once authenticated, the machine will appear in your Tailscale network.

> ℹ️ You only need to do this **once per machine**.

---

### Optional checks

```bash
tailscale status
tailscale ip
```
