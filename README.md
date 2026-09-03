# rafa-thayto/tap — Homebrew tap for thaytool

[thaytool](https://thaytool.com) is a native macOS app for running multiple AI coding agents — like [Claude Code](https://www.anthropic.com/claude-code) and [Codex](https://openai.com/codex/) — in parallel, each isolated in its own [git worktree](https://git-scm.com/docs/git-worktree), with terminals a background daemon keeps alive through quit, update, and reboot. It reads real git status, ports, and CPU straight from your machine. Fully local: no cloud, no account, no telemetry.

## Install

```sh
brew install rafa-thayto/tap/thaytool
```

Or tap once and install by name:

```sh
brew tap rafa-thayto/tap
brew install thaytool
```

In a `Brewfile`:

```ruby
tap "rafa-thayto/tap"
cask "thaytool"
```

The cask installs the same signed, notarized `Thaytool.dmg` that [thaytool.com/install](https://thaytool.com/install) serves. The app updates itself via Sparkle (EdDSA-signed), so `brew upgrade` leaves it alone unless you pass `--greedy`. `brew livecheck thaytool` reads the same appcast the app polls.

## Casks

| Cask | Channel | Notes |
|:-----|:--------|:------|
| `thaytool` | stable | every release on the [changelog](https://thaytool.com/changelog) |
| `thaytool@canary` | canary | early builds, when published; coexists with `thaytool` |

## Requirements

- macOS 26 (Tahoe) or later
- Apple silicon (arm64)

## Pricing

A one-time $20 license covers up to three Macs — no subscription, free updates for life. The 40-day trial keeps working after it ends; you just get a polite reminder.

## Links

- Site: [thaytool.com](https://thaytool.com) · [features](https://thaytool.com/features) · [compare](https://thaytool.com/compare) · [changelog](https://thaytool.com/changelog)
- Agent-readable: [llms.txt](https://thaytool.com/llms.txt) · every page also serves `Accept: text/markdown`
- Author: [Rafael Thayto](https://thayto.com) · [@thayto_dev](https://x.com/thayto_dev)

thaytool is closed-source; this tap holds only the cask definitions.
