# Context7 MCP Setup Guide

> Context7 fetches up-to-date documentation for any library, ensuring you always reference official docs.

---

## Why Context7 Matters

As a junior developer, one of the most important habits to build is **reading official documentation**.

Context7 makes this easy by:

- Fetching the **latest** docs for any library (React 19 as of January 2026, not React 16)
- Providing **version-specific** guidance
- Eliminating outdated Stack Overflow answers

**The habit:** Before implementing anything, check the official docs. Context7 automates this.

---

## Installation

### Option A: Remote Server (Recommended)

No local dependencies required. Just run:

```bash
claude mcp add --transport http context7 https://mcp.context7.com/mcp
```

### Option B: Local Installation

Requires Node.js 18+:

```bash
claude mcp add context7 -- npx -y @upstash/context7-mcp
```

---

## API Key (Optional)

A free tier is available without an API key. For higher rate limits:

1. Create an account at https://context7.com/dashboard
2. Generate an API key
3. Install with the key:

```bash
claude mcp add --transport http context7 https://mcp.context7.com/mcp --header "CONTEXT7_API_KEY: YOUR_KEY"
```

---

## Verify Installation

After installing, restart Claude Code and run:

```
/mcp
```

You should see `context7` listed as an available MCP server.

---

## How It Works in MentorSpec

When you're working on a feature and need guidance, your mentor will:

1. **Resolve the library** — Find the correct Context7 ID for the library
2. **Fetch relevant docs** — Get the specific section you need
3. **Cite the source** — "According to the React 19 docs..."

This ensures you're always learning from official, up-to-date sources.

---

## Troubleshooting

### "Context7 not found"

Make sure you've restarted Claude Code after installation.

### Rate limit errors

Consider getting a free API key from https://context7.com/dashboard for higher limits.

### Connection issues

Try the local installation option if the remote server is slow.

---

_Context7 is maintained by Upstash. Learn more at https://github.com/upstash/context7_
