# B+ Ark Server Controller

Manage multiple **ARK: Survival Ascended** dedicated servers from one controller.

B+ Ark Server Controller is available as a native **Windows desktop application** and as a **Linux / Unraid Docker web controller**. Both editions use one shared ARK installation to reduce disk usage while keeping every server profile's configuration, ports, maps, saves, logs, backups, schedules, and enabled-mod settings separate.

## Platforms

- **Windows:** native desktop controller with an optional private-network browser view.
- **Linux / Unraid:** Docker-based web controller designed for Unraid and compatible Docker hosts.

The controller never starts ARK automatically when it opens. Servers start only when you choose **Start server**, **Start all**, or a configured schedule runs.

## Included features

- Create, rename, duplicate, and manage multiple ARK server profiles
- Shared ARK installation and shared downloaded-mod library to reduce disk usage
- Separate per-server INI files, maps, saves, logs, ports, schedules, and mod activation/order
- Install ARK files, start, stop, restart, save, verify, and monitor servers
- Sequential **Start all**, **Restart all**, and **Stop all** operations
- Live server log viewer and RCON command console
- Map management, including modded-map support
- Local mod-folder import, numeric Project ID mod entry, load order, passive mode, and development mode
- Visual editors for `Game.ini` and `GameUserSettings.ini`, with setting-group sharing between servers
- Crash detection and automatic restart options
- Scheduler for restarts, shutdown warnings, messages, and DestroyWildDinos
- Server folder shortcuts for configuration, logs, SaveGames, mods, and plugins
- Theme selection and application updates through GitHub releases

## Free and Pro

The controller has a free tier for core server hosting and management. **B+ Ark Server Controller Pro costs A$25 per year** and unlocks advanced automation and management tools.

| Feature | Free | Pro |
| --- | :---: | :---: |
| Create and run multiple server profiles | Yes | Yes |
| Local mod-folder import and numeric Project ID entry | Yes | Yes |
| CurseForge mod browser, metadata, and modded-map downloads | — | Yes |
| ARK installation updates and automatic update scheduling | — | Yes |
| Map backups and player-profile backups | — | Yes |
| Plugin management and the bundled inventory-backup integration | — | Yes |
| Dynamic Config hosting and editing | — | Yes |
| Update rollback / restore points | — | Yes |
| Windows remote browser access over a private network or VPN | — | Yes |

Existing files are never removed when a Pro feature is unavailable; the feature is simply locked until a valid licence is active.

## Installation

### Windows

1. Download `BPlus-Ark-Server-Controller-setup.exe` from the latest release.
2. Run the installer and open **B+ Ark Server Controller**.
3. Choose where to store the ARK server files.
4. Install the shared ARK files from **Server Profiles**.
5. Add servers and configure their ports, map, INIs, and mods.

### Linux / Unraid

1. Install the Docker controller from the published container/package or use the supplied Unraid Compose template.
2. Map persistent controller and ARK appdata folders before starting the controller.
3. Open the controller in a browser, install the shared ARK files, then create and configure server profiles.

See the platform-specific documentation in [`ASA-Windows-Server`](ASA-Windows-Server) and [`ASA-Unraid-Server`](ASA-Unraid-Server) for detailed setup instructions.

## Requirements

- Windows 10/11, or a Linux host with Docker (Unraid supported)
- Sufficient SSD/NVMe disk space for ARK: Survival Ascended, mods, and server data
- Internet access for SteamCMD, ARK updates, and optional CurseForge metadata
- Administrator access may be required for Windows Firewall rules or restricted installation paths

## Support

Need help, want to report a problem, or have a feature request? Join the [B+ Ark Server Controller Discord](https://discord.gg/6qDKS5Z5S5).

## Disclaimer

B+ Ark Server Controller is an unofficial community tool. It is not affiliated with Studio Wildcard, Snail Games, Epic Games, Valve, CurseForge, or ARK: Survival Ascended.
