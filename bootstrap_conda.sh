#!/usr/bin/env bash

set -euo pipefail

# === CONFIG ===
CONDA_DIR="$HOME/miniconda3"
CONDA_ENV_NAME="tools"
PACKAGE_LIST_FILE="conda_packages.txt"
INSTALLER_URL=""
SHELL_RC="$HOME/.bashrc"  # Change if you use zsh

# Detect shell rc file
if [[ "$SHELL" =~ zsh ]]; then
    SHELL_RC="$HOME/.zshrc"
fi

# === FUNCTIONS ===

detect_os_arch() {
    OS="$(uname -s)"
    ARCH="$(uname -m)"
    case "$OS" in
        Linux)
            case "$ARCH" in
                x86_64) INSTALLER_URL="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh" ;;
                aarch64) INSTALLER_URL="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh" ;;
                *) echo "Unsupported architecture: $ARCH"; exit 1 ;;
            esac
            ;;
        Darwin)
            case "$ARCH" in
                x86_64) INSTALLER_URL="https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh" ;;
                arm64) INSTALLER_URL="https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh" ;;
                *) echo "Unsupported architecture: $ARCH"; exit 1 ;;
            esac
            ;;
        *) echo "Unsupported OS: $OS"; exit 1 ;;
    esac
}

install_miniconda() {
    if [[ -d "$CONDA_DIR" ]]; then
        echo "Miniconda already installed in $CONDA_DIR"
    else
        echo "Downloading Miniconda installer..."
        curl -fsSL "$INSTALLER_URL" -o miniconda.sh
        bash miniconda.sh -b -p "$CONDA_DIR"
        rm miniconda.sh
    fi

    if ! grep -q 'conda.sh' "$SHELL_RC"; then
        echo "Adding conda init to $SHELL_RC"
        echo "source \"$CONDA_DIR/etc/profile.d/conda.sh\"" >> "$SHELL_RC"
    fi

    source "$CONDA_DIR/etc/profile.d/conda.sh"
}

create_conda_env() {
    if conda env list | grep -q "$CONDA_ENV_NAME"; then
        echo "Conda env '$CONDA_ENV_NAME' already exists."
    else
        echo "Creating conda environment '$CONDA_ENV_NAME'..."
        conda create -y -n "$CONDA_ENV_NAME"
    fi
    conda activate "$CONDA_ENV_NAME"
}

install_packages() {
    echo "Installing packages from $PACKAGE_LIST_FILE..."
    while IFS= read -r pkg || [[ -n "$pkg" ]]; do
        [[ -z "$pkg" || "$pkg" == \#* ]] && continue  # skip empty and comment lines
        echo "Installing: $pkg"
        conda install -y -c conda-forge "$pkg"
    done < "$PACKAGE_LIST_FILE"
}

# === MAIN ===

detect_os_arch
install_miniconda
create_conda_env
install_packages

echo "✅ Setup complete. Conda environment '$CONDA_ENV_NAME' is ready."

