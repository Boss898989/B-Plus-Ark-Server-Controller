#!/usr/bin/env bash
# B+ Ark Server Controller — Linux / Unraid installer and updater.
# Safe to run again: it updates the controller image and preserves all ARK data.

set -euo pipefail

REPOSITORY_RAW="https://raw.githubusercontent.com/Boss898989/B-Plus-Ark-Server-Controller/main"
INSTALL_DIR="${BPLUS_INSTALL_DIR:-/mnt/user/appdata/bplus-ark-server-controller}"
APPDATA_PATH="${BPLUS_APPDATA_PATH:-/mnt/user/appdata/asa-server}"
WEB_PORT="${BPLUS_WEB_PORT:-8088}"
COMPOSE_URL="$REPOSITORY_RAW/linux/docker-compose.yml"

fail() { printf '\nError: %s\n' "$1" >&2; exit 1; }

command -v docker >/dev/null 2>&1 || fail "Docker is required. Install Docker first."
docker compose version >/dev/null 2>&1 || fail "Docker Compose v2 is required."
command -v curl >/dev/null 2>&1 || fail "curl is required."

mkdir -p "$INSTALL_DIR" "$APPDATA_PATH"

printf 'Downloading the B+ Ark Server Controller stack...\n'
curl -fsSL "$COMPOSE_URL" -o "$INSTALL_DIR/docker-compose.yml" \
  || fail "Could not download the controller stack from GitHub."

ENV_FILE="$INSTALL_DIR/.env"
if [ ! -f "$ENV_FILE" ]; then
  printf 'APPDATA_PATH=%s\nWEB_PORT=%s\nBPLUS_CONTROLLER_IMAGE=ghcr.io/boss898989/bplus-ark-server-controller-unraid:1.3\nBPLUS_GAME_IMAGE=ghcr.io/boss898989/bplus-asa-linux-server:1.3\n' \
    "$APPDATA_PATH" "$WEB_PORT" > "$ENV_FILE"
else
  # Preserve custom image tags and paths, while ensuring the essential values exist.
  grep -q '^APPDATA_PATH=' "$ENV_FILE" || printf '\nAPPDATA_PATH=%s\n' "$APPDATA_PATH" >> "$ENV_FILE"
  grep -q '^WEB_PORT=' "$ENV_FILE" || printf 'WEB_PORT=%s\n' "$WEB_PORT" >> "$ENV_FILE"
fi

printf 'Pulling the latest controller image...\n'
(
  cd "$INSTALL_DIR"
  docker compose pull web-ui
  docker compose up -d web-ui
)

HOST_IP="$(hostname -I 2>/dev/null | awk '{print $1}')"
printf '\nB+ Ark Server Controller is running.\n'
printf 'Open: http://%s:%s\n' "${HOST_IP:-<your-server-IP>}" "$WEB_PORT"
printf 'ARK servers are not started by this installer.\n'
printf 'Re-run this command later to update the controller; saved data remains in %s.\n' "$APPDATA_PATH"
