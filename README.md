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




Sí, totalmente 👍
Esto es **oro para la documentación**, porque reduce fricción todos los días.

Te dejo una versión **pulida, clara y copy-paste friendly** para el README, con un flujo lógico y pequeñas mejoras.

---

## SSH connection (Recommended)

This section shows a simple and clean way to access the remote PC using SSH.

### 1. Copy your SSH key to the remote machine

From your local machine:

```bash
ssh-copy-id user@<IP_ADDRESS>
```

After this, you should be able to log in **without a password**.

---

### 2. Create or edit your SSH config

```bash
nano ~/.ssh/config
```

Add an entry like this:

```sshconfig
Host pc-name
  HostName <IP_ADDRESS>
  User username
  IdentityFile ~/.ssh/id_ed25519

  # Port forwarding (optional)
  LocalForward 8000 localhost:8000
  LocalForward 3000 localhost:3000
```

Save and exit.

---

### 3. Connect using the alias

Now you can simply run:

```bash
ssh pc-name
```

---

### Notes

* `pc-name` can be anything (e.g. `arch-dev`, `home-server`, `vm-arch`)
* `LocalForward` is useful for:

  * Web apps (Rails, Laravel, Node, etc.)
  * Dashboards
  * Dev servers running on the remote PC
* You can add or remove forwarded ports as needed

---

### Optional: Quick test

```bash
ssh pc-name
hostname
```

If it connects instantly without asking for a password, everything is set ✅

