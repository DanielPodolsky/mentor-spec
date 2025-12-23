#!/bin/bash

# MentorSpec Project Installation Script
# AI-Mentored Development for Juniors

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Paths
BASE_DIR="$HOME/mentor-spec"
PROJECT_DIR=$(pwd)
PROJECT_NAME=$(basename "$PROJECT_DIR")

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

# Check base exists
if [ ! -d "$BASE_DIR" ]; then
    error "MentorSpec base not found at $BASE_DIR. Run the base installer first."
fi

info "Installing MentorSpec into: $PROJECT_DIR"
echo ""

# ============================================================================
# STEP 1: Handle existing installation
# ============================================================================

if [ -d "$PROJECT_DIR/mentorspec" ]; then
    warn "MentorSpec already installed in this project."
    read -p "Reinstall? (y/N): " confirm
    if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
        info "Cancelled."
        exit 0
    fi
    echo ""
fi

# ============================================================================
# STEP 2: Create directory structure
# ============================================================================

info "Creating directories..."

mkdir -p "$PROJECT_DIR/mentorspec/product"
mkdir -p "$PROJECT_DIR/mentorspec/specs/active"
mkdir -p "$PROJECT_DIR/mentorspec/specs/completed"
mkdir -p "$PROJECT_DIR/mentorspec/career/stories"
mkdir -p "$PROJECT_DIR/.claude/commands/mentor-spec"

success "Directories created"

# ============================================================================
# STEP 3: Handle CLAUDE.md (Smart Merge)
# ============================================================================

CLAUDE_MD="$PROJECT_DIR/.claude/CLAUDE.md"
TEMPLATE="$BASE_DIR/core/CLAUDE.md.template"

info "Configuring CLAUDE.md..."

if [ -f "$CLAUDE_MD" ]; then
    # Check if MentorSpec already installed
    if grep -q "MENTORSPEC:" "$CLAUDE_MD" 2>/dev/null; then
        warn "MentorSpec section already exists in CLAUDE.md"
        read -p "Replace existing MentorSpec section? (y/N): " replace
        if [ "$replace" = "y" ] || [ "$replace" = "Y" ]; then
            # Remove existing MentorSpec section
            sed -i.bak '/# ═.*MENTORSPEC/,/# ═.*END MENTORSPEC/d' "$CLAUDE_MD"
            # Append fresh template
            echo "" >> "$CLAUDE_MD"
            cat "$TEMPLATE" >> "$CLAUDE_MD"
            success "MentorSpec section replaced"
        else
            info "Keeping existing MentorSpec section"
        fi
    else
        # Existing CLAUDE.md without MentorSpec - Smart merge
        info "Found existing CLAUDE.md - merging..."

        # Backup original
        cp "$CLAUDE_MD" "$PROJECT_DIR/.claude/CLAUDE.md.pre-mentorspec"
        success "Backed up to CLAUDE.md.pre-mentorspec"

        # Append MentorSpec section
        echo "" >> "$CLAUDE_MD"
        echo "" >> "$CLAUDE_MD"
        cat "$TEMPLATE" >> "$CLAUDE_MD"
        success "MentorSpec section merged into CLAUDE.md"
    fi
else
    # No existing CLAUDE.md - create fresh
    mkdir -p "$PROJECT_DIR/.claude"
    cp "$TEMPLATE" "$CLAUDE_MD"
    success "Created CLAUDE.md with THE STRICTNESS"
fi

# ============================================================================
# STEP 4: Copy commands
# ============================================================================

info "Installing commands..."

cp "$BASE_DIR/core/commands/"*.md "$PROJECT_DIR/.claude/commands/mentor-spec/" 2>/dev/null || true
success "Commands installed"

# ============================================================================
# STEP 5: Copy guides
# ============================================================================

info "Copying guides..."

mkdir -p "$PROJECT_DIR/mentorspec/guides"
cp "$BASE_DIR/guides/"*.md "$PROJECT_DIR/mentorspec/guides/" 2>/dev/null || true
success "Guides copied"

# ============================================================================
# STEP 6: Create product templates
# ============================================================================

info "Creating product templates..."

cat > "$PROJECT_DIR/mentorspec/product/mission.md" << 'EOF'
# Project Mission

> Run `/mentor-spec:init` to define your project vision.

## The Problem

<!-- What problem are you solving? Describe the PROBLEM, not features. -->

## Who Is This For?

<!-- Who will use this? -->

## Definition of Done

<!-- When is this project DONE? What must work? -->
EOF

cat > "$PROJECT_DIR/mentorspec/product/stack.md" << 'EOF'
# Technology Stack

> Run `/mentor-spec:init` to auto-detect and document your stack.

## Frontend

<!-- Technologies detected or chosen -->

## Backend

<!-- Technologies detected or chosen -->

## Why These Choices?

<!-- Document your reasoning -->
EOF

cat > "$PROJECT_DIR/mentorspec/product/roadmap.md" << 'EOF'
# Project Roadmap

> Run `/mentor-spec:init` to create your development roadmap.

## Phase 1: Foundation

- [ ] Project setup
- [ ] Core structure

## Phase 2: Core Features

- [ ] Feature 1
- [ ] Feature 2

## Phase 3: Polish & Deploy

- [ ] Testing
- [ ] Deployment
EOF

success "Product templates created"

# ============================================================================
# COMPLETE
# ============================================================================

echo ""
echo -e "${GREEN}╔═══════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║          Installation Complete!                       ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════════════════╝${NC}"
echo ""

success "MentorSpec installed successfully!"
echo ""

info "What was created:"
echo "  mentorspec/           — Your project docs (commit this)"
echo "  .claude/CLAUDE.md     — THE STRICTNESS (affects all Claude interactions)"
echo "  .claude/commands/     — Slash commands"
echo ""

info "Next steps:"
echo "  1. Open Claude Code in this project"
echo "  2. Run: /mentor-spec:init"
echo "  3. Answer 3 questions about your project vision"
echo "  4. Start building with AI mentorship!"
echo ""

info "To remove MentorSpec later:"
echo "  ~/mentor-spec/scripts/project-uninstall.sh"
echo ""
