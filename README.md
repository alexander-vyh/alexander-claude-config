# alexander-claude-config

Personal Claude Code advisor agents — management lenses, design critics,
productivity advisors, domain-specific tools. Source-controlled so they
travel across machines and can be rolled back if a particular advisor
turns out to be giving worse output than expected.

## Scope

This repo holds **personal preference** — frameworks I draw from, lenses
I think with, agents I find useful for my own work. It is not a reusable
framework and is not intended for general adoption.

The **reusable workflow framework** (beads/openspec/continuation harness,
along with the two workflow-integral agents `adversarial-reviewer` and
`test-quality-reviewer`) lives in a separate repo:
[`claude-workflow-setup`](https://github.com/alexander-vyh/claude-workflow-setup).

This split exists because `claude-workflow-setup` is a sharp,
opinionated framework that someone else might want to adopt; mixing in
the agents in this repo (management philosophizers, ux researchers, etc.)
would muddy that thesis and fail the bureaucracy-design tests its own
rules argue for.

## Contents

`claude/agents/` — 16 personal advisor agents, deployed as symlinks into
`~/.claude/agents/`:

- **Management & leadership lenses:** `management-philosophizer`,
  `manager-tools-advisor`, `delegation-accountability-coach`
- **Productivity & attention:** `attention-coach`, `behavioral-psychologist`,
  `habit-architect`, `personal-lean-advisor`, `personal-systems-integrator`
- **UX & design critics:** `ui-design-critic`, `ux-researcher`,
  `information-architect`
- **Ops & service:** `ops-excellence-advisor`, `service-design-reviewer`,
  `employee-experience-auditor`
- **Domain:** `dashboard-auditor`, `opportunity-finder`

Three agents are pinned to `model: opus` (`dashboard-auditor`,
`management-philosophizer`, `personal-systems-integrator`) — the ones
where false negatives or missed cross-framework tensions are expensive.
The remaining 13 are on `model: sonnet`.

## Install

```sh
git clone https://github.com/alexander-vyh/alexander-claude-config.git
cd alexander-claude-config
./INSTALL.sh
```

Existing real files at `~/.claude/agents/<name>.md` are backed up as
`<name>.md.backup-YYYYMMDD-HHMMSS` before the symlinks land.

Uninstall:

```sh
./INSTALL.sh --uninstall
```

Removes the symlinks; backups stay.
