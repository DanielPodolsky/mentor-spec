#!/bin/bash

# MentorSpec Project Installation Script
# AI-Mentored Development for Juniors
# Version 2.0 - Skill-Driven SDD Engine

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
echo -e "${GREEN}╔═══════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║              MentorSpec Installation v2.0                 ║${NC}"
echo -e "${GREEN}║       AI-Mentored Spec-Driven Development Engine          ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════════════════════╝${NC}"
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

# MentorSpec project directories
mkdir -p "$PROJECT_DIR/mentorspec/product"
mkdir -p "$PROJECT_DIR/mentorspec/specs/active"
mkdir -p "$PROJECT_DIR/mentorspec/specs/completed"
mkdir -p "$PROJECT_DIR/mentorspec/career/stories"
mkdir -p "$PROJECT_DIR/mentorspec/guides"

# Claude Code directories (v2.0 - Skill-Driven)
mkdir -p "$PROJECT_DIR/.claude/commands/mentor-spec"
mkdir -p "$PROJECT_DIR/.claude/skills/fundamentals/frontend"
mkdir -p "$PROJECT_DIR/.claude/skills/fundamentals/backend"
mkdir -p "$PROJECT_DIR/.claude/skills/fundamentals/security"
mkdir -p "$PROJECT_DIR/.claude/skills/fundamentals/performance"
mkdir -p "$PROJECT_DIR/.claude/skills/fundamentals/error-handling"
mkdir -p "$PROJECT_DIR/.claude/skills/fundamentals/engineering"
mkdir -p "$PROJECT_DIR/.claude/skills/fundamentals/database"
mkdir -p "$PROJECT_DIR/.claude/skills/fundamentals/testing"
mkdir -p "$PROJECT_DIR/.claude/skills/fundamentals/seo"
mkdir -p "$PROJECT_DIR/.claude/skills/fundamentals/accessibility"
mkdir -p "$PROJECT_DIR/.claude/skills/fundamentals/documentation"
mkdir -p "$PROJECT_DIR/.claude/skills/gates/ownership"
mkdir -p "$PROJECT_DIR/.claude/skills/gates/security"
mkdir -p "$PROJECT_DIR/.claude/skills/gates/error"
mkdir -p "$PROJECT_DIR/.claude/skills/gates/performance"
mkdir -p "$PROJECT_DIR/.claude/skills/gates/fundamentals"
mkdir -p "$PROJECT_DIR/.claude/skills/gates/testing"
mkdir -p "$PROJECT_DIR/.claude/skills/career/star-stories"
mkdir -p "$PROJECT_DIR/.claude/skills/career/resume-bullets"
mkdir -p "$PROJECT_DIR/.claude/skills/learned"

# Learning Flywheel directories
mkdir -p "$PROJECT_DIR/learning/patterns"
mkdir -p "$PROJECT_DIR/learning/failures"

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
# STEP 4: Copy commands (v2.0 location)
# ============================================================================

info "Installing commands..."

# Copy commands from .claude/commands/mentor-spec/
cp "$BASE_DIR/.claude/commands/mentor-spec/"*.md "$PROJECT_DIR/.claude/commands/mentor-spec/" 2>/dev/null || true
success "Commands installed (10 commands including test/docs)"

# ============================================================================
# STEP 5: Copy skills (NEW in v2.0)
# ============================================================================

info "Installing skills..."

# Copy fundamentals
if [ -d "$BASE_DIR/.claude/skills/fundamentals" ]; then
    for skill in frontend backend security performance error-handling engineering database testing seo accessibility documentation; do
        if [ -f "$BASE_DIR/.claude/skills/fundamentals/$skill/SKILL.md" ]; then
            cp "$BASE_DIR/.claude/skills/fundamentals/$skill/SKILL.md" \
               "$PROJECT_DIR/.claude/skills/fundamentals/$skill/"
        fi
    done
    success "11 Core Fundamental skills installed"
fi

# Copy gates
if [ -d "$BASE_DIR/.claude/skills/gates" ]; then
    for gate in ownership security error performance fundamentals testing; do
        if [ -f "$BASE_DIR/.claude/skills/gates/$gate/SKILL.md" ]; then
            cp "$BASE_DIR/.claude/skills/gates/$gate/SKILL.md" \
               "$PROJECT_DIR/.claude/skills/gates/$gate/"
        fi
    done
    success "6 Mentorship Gate skills installed"
fi

# Copy career skills
if [ -d "$BASE_DIR/.claude/skills/career" ]; then
    for career in star-stories resume-bullets; do
        if [ -f "$BASE_DIR/.claude/skills/career/$career/SKILL.md" ]; then
            cp "$BASE_DIR/.claude/skills/career/$career/SKILL.md" \
               "$PROJECT_DIR/.claude/skills/career/$career/"
        fi
    done
    success "Career extraction skills installed"
fi

# Create .gitkeep for learned skills
echo "# Auto-generated skills go here (from /retrospective)" > "$PROJECT_DIR/.claude/skills/learned/.gitkeep"

# ============================================================================
# STEP 6: Create Learning Registry (NEW in v2.0)
# ============================================================================

info "Creating Learning Registry..."

if [ -f "$BASE_DIR/learning/LEARNING_REGISTRY.md" ]; then
    cp "$BASE_DIR/learning/LEARNING_REGISTRY.md" "$PROJECT_DIR/learning/"
else
    cat > "$PROJECT_DIR/learning/LEARNING_REGISTRY.md" << 'EOF'
# Learning Registry

> Automatically updated by `/retrospective`. Query with `/advise`.
> This file tracks your growth as an engineer across all sessions.

---

## Patterns (Reusable Solutions)

Successful patterns you've discovered and can reuse:

| Date | Domain | Pattern | Location |
|------|--------|---------|----------|
| | | *No patterns recorded yet* | |

---

## Failures (Anti-Patterns)

Mistakes you've made and learned from (the most valuable learnings):

| Date | Domain | Issue | Location |
|------|--------|-------|----------|
| | | *No failures documented yet* | |

---

## Competency Progression

Track your growth over time:

| Week | Level | Evidence |
|------|-------|----------|
| Start | ⭐ (learning) | Beginning MentorSpec journey |

---

## Detailed Entries

*Entries will be added here chronologically as you complete `/retrospective` sessions.*
EOF
fi
success "Learning Registry created"

# ============================================================================
# STEP 7: Copy guides
# ============================================================================

info "Copying guides..."

cp "$BASE_DIR/guides/"*.md "$PROJECT_DIR/mentorspec/guides/" 2>/dev/null || true
success "Guides copied"

# ============================================================================
# STEP 8: Create product templates
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
echo -e "${GREEN}╔═══════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║            Installation Complete! v2.0                    ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════════════════════╝${NC}"
echo ""

success "MentorSpec v2.0 installed successfully!"
echo ""

info "What was created:"
echo ""
echo "  📁 mentorspec/              — Your project docs (commit this)"
echo "     ├── product/             — Mission, stack, roadmap"
echo "     ├── specs/               — Feature specifications"
echo "     ├── career/              — Interview stories & bullets"
echo "     └── guides/              — Setup guides"
echo ""
echo "  📁 .claude/                 — Claude Code configuration"
echo "     ├── CLAUDE.md            — THE STRICTNESS (mentor behavior)"
echo "     ├── commands/            — 10 slash commands"
echo "     └── skills/              — Auto-invoked mentorship skills"
echo "         ├── fundamentals/    — 11 Core review skills"
echo "         ├── gates/           — 6 Mentorship gates"
echo "         ├── career/          — STAR & resume extraction"
echo "         └── learned/         — Auto-generated from /retrospective"
echo ""
echo "  📁 learning/                — Learning Flywheel data"
echo "     ├── LEARNING_REGISTRY.md — Your growth tracker"
echo "     ├── patterns/            — Reusable solutions"
echo "     └── failures/            — Documented anti-patterns"
echo ""

info "New in v2.0:"
echo "  • 6 Mentorship Gates in /done command (including Testing)"
echo "  • /test command (guide through writing tests)"
echo "  • /docs command (guide through writing documentation)"
echo "  • /advise command (pre-work intelligence)"
echo "  • /retrospective command (learning capture)"
echo "  • Learning Flywheel that grows with you"
echo "  • MCP integration (Context7 + Octocode)"
echo ""

info "Next steps:"
echo "  1. Open Claude Code in this project"
echo "  2. Run: /mentor-spec:init"
echo "  3. Before each task: /mentor-spec:advise"
echo "  4. After each task: /mentor-spec:done → /mentor-spec:retrospective"
echo ""

info "MCP Setup (recommended):"
echo "  claude mcp add --transport http context7 https://mcp.context7.com/mcp"
echo ""

info "To remove MentorSpec later:"
echo "  ~/mentor-spec/scripts/project-uninstall.sh"
echo ""
