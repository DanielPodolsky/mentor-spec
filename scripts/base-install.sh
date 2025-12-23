#!/bin/bash

# MentorSpec Base Installation Script
# AI-Mentored Development for Juniors
#
# Usage: curl -sSL https://raw.githubusercontent.com/DanielPodolsky/mentor-spec/main/scripts/base-install.sh | bash

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Config
REPO_URL="https://github.com/DanielPodolsky/mentor-spec.git"
INSTALL_DIR="$HOME/mentor-spec"

# Helpers
info() { echo -e "${BLUE}[INFO]${NC} $1"; }
success() { echo -e "${GREEN}[OK]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }

# Header
echo ""
echo -e "${GREEN}╔═══════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║            MentorSpec Installation                    ║${NC}"
echo -e "${GREEN}║      AI-Mentored Development for Juniors              ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════════════════╝${NC}"
echo ""

# ============================================================================
# Check for existing installation
# ============================================================================

if [ -d "$INSTALL_DIR" ]; then
    warn "MentorSpec already installed at $INSTALL_DIR"
    echo ""
    read -p "Update existing installation? (y/N): " update
    if [ "$update" = "y" ] || [ "$update" = "Y" ]; then
        info "Updating MentorSpec..."
        cd "$INSTALL_DIR"
        if [ -d ".git" ]; then
            git pull origin main
            success "MentorSpec updated!"
        else
            warn "Not a git repo. Reinstalling..."
            cd ..
            rm -rf "$INSTALL_DIR"
        fi
    else
        info "Keeping existing installation."
        echo ""
        info "To use MentorSpec in a project:"
        echo "  cd your-project"
        echo "  ~/mentor-spec/scripts/project-install.sh"
        echo ""
        exit 0
    fi
fi

# ============================================================================
# Install MentorSpec
# ============================================================================

if [ ! -d "$INSTALL_DIR" ]; then
    info "Installing MentorSpec to $INSTALL_DIR..."

    # Try git clone first
    if command -v git &> /dev/null; then
        git clone "$REPO_URL" "$INSTALL_DIR"
        success "Cloned via git"
    else
        # Fallback to curl + unzip
        warn "git not found, downloading zip..."
        ZIP_URL="https://github.com/DanielPodolsky/mentor-spec/archive/refs/heads/main.zip"
        curl -sSL "$ZIP_URL" -o /tmp/mentor-spec.zip
        unzip -q /tmp/mentor-spec.zip -d /tmp
        mv /tmp/mentor-spec-main "$INSTALL_DIR"
        rm /tmp/mentor-spec.zip
        success "Downloaded and extracted"
    fi
fi

# ============================================================================
# Make scripts executable
# ============================================================================

info "Setting permissions..."
chmod +x "$INSTALL_DIR/scripts/"*.sh
success "Scripts are executable"

# ============================================================================
# Complete
# ============================================================================

echo ""
echo -e "${GREEN}╔═══════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║          Installation Complete!                       ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════════════════╝${NC}"
echo ""

success "MentorSpec installed to ~/mentor-spec/"
echo ""

info "Next steps:"
echo ""
echo "  1. Go to your project:"
echo "     cd your-project"
echo ""
echo "  2. Install MentorSpec into that project:"
echo "     ~/mentor-spec/scripts/project-install.sh"
echo ""
echo "  3. Open Claude Code and run:"
echo "     /mentor-spec:init"
echo ""

info "Remember: MentorSpec makes AI your MENTOR, not your coder."
info "You write the code. You build the skills. You own your career."
echo ""
