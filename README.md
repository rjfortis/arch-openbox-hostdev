# Arch Openbox Host Dev Setup

This repository provides a simple, modular setup to prepare an **Arch Linux** system with **Openbox** for development and container-based workflows.

The setup is split into small scripts and orchestrated by a single `setup.sh` file.

---

## Requirements

- Arch Linux
- Internet connection
- A non-root user with `sudo` privileges

---

## Installation

Clone the repository:

```bash
git clone https://github.com/rjfortis/arch-openbox-hostdev.git
cd arch-openbox-hostdev
chmod +x setup.sh
./setup.sh
```

## What `setup.sh` does

The `setup.sh` script runs the following files **in order**:

1. `init.sh` – Base system initialization
2. `docker.sh` – Docker installation and configuration
3. `nix.sh` – Nix package manager installation
4. `nix-profile.sh` – Development tools installed via `nix profile`

If any step fails, the setup stops immediately.

---

## Notes

* After Docker installation, **log out and log back in** (or run `newgrp docker`) to apply group changes.
* You may need to restart your terminal after the setup completes.

---

## Usage

This setup is intended for:

* Development environments
* Docker-based workflows
* Isolated tooling via Nix
* Lightweight Openbox desktops

Feel free to modify the scripts to fit your workflow.

