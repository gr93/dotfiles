#!/bin/bash
set -e

# === Config ===
BASE_DIR="$HOME/local"
LOG_DIR="$BASE_DIR/.pkg_logs"
TMP_DIR="$(mktemp -d)"
mkdir -p "$BASE_DIR" "$LOG_DIR"

usage() {
    echo "Usage: $0 [install|upgrade|delete] <package>[@version]"
    exit 1
}

[[ $# -ne 2 ]] && usage

ACTION="$1"
PKG_ARG="$2"

# Parse package name and version (if any)
PKG_NAME="${PKG_ARG%@*}"
PKG_VER="${PKG_ARG#*@}"
[[ "$PKG_NAME" == "$PKG_VER" ]] && PKG_VER=""

LOGFILE="$LOG_DIR/$PKG_NAME.files"

install_pkg() {
    echo "[*] Downloading $PKG_NAME ${PKG_VER:+version $PKG_VER}..."
    if [[ -n "$PKG_VER" ]]; then
        yumdownloader --resolve --destdir="$TMP_DIR" "$PKG_NAME-$PKG_VER"
    else
        yumdownloader --resolve --destdir="$TMP_DIR" "$PKG_NAME"
    fi

    echo "[*] Extracting into $BASE_DIR..."
    > "$LOGFILE"
    cd "$BASE_DIR"

    for rpm in "$TMP_DIR"/*.rpm; do
        echo " -> $(basename "$rpm")"
        rpm2cpio "$rpm" | cpio -idm --quiet
        rpm2cpio "$rpm" | cpio -t --quiet | sed "s|^|$BASE_DIR/|" >> "$LOGFILE"
    done

    echo "[✓] Installed $PKG_NAME locally."
}

delete_pkg() {
    if [[ ! -f "$LOGFILE" ]]; then
        echo "[!] No install record for '$PKG_NAME' found."
        exit 1
    fi

    echo "[*] Removing files for $PKG_NAME..."
    xargs -r rm -rf < "$LOGFILE"

    echo "[*] Cleaning up empty directories..."
    tac "$LOGFILE" | while read -r filepath; do
        dir="$(dirname "$filepath")"
        [[ -d "$dir" ]] && find "$dir" -type d -empty -delete
    done

    rm -f "$LOGFILE"
    echo "[✓] Deleted $PKG_NAME and cleaned up directories."
}

upgrade_pkg() {
    echo "[*] Upgrading $PKG_NAME..."
    delete_pkg || true
    install_pkg
    echo "[✓] Upgrade complete."
}

case "$ACTION" in
    install) install_pkg ;;
    delete) delete_pkg ;;
    upgrade) upgrade_pkg ;;
    *) usage ;;
esac

