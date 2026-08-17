# Repo Guide

This repo stores a skill for macOS Music.app integration.

Installed global skill directory: `~/.agents/skills/macos-music`.
`skills check` and `skills update` may refer to this skill by upstream package name `apple-music`.

## Public interface and internal backend

- **Public:** `scripts/commands/<entity>/<action>.sh` is the only public command surface. Run commands from the repo root.
- **Internal:** `scripts/applescripts/<entity>/<action>.applescript` is the internal backend, invoked via `osascript` by the command wrappers. Do not call AppleScript files directly from skill instructions.
- `scripts/commands/_lib/common.sh` holds shared helpers (`run_backend`, `json_wrap`, `json_fail`, `require_arg`).
- Only commands listed in `SKILL.md` are public. Other scripts may exist for internal use or legacy cleanup.

## Goal

- Document AppleScript commands for Music.app accurately.
- Prefer runnable examples over long prose.
- Never modify the user's library (create playlists, delete tracks) without explicit user approval.

## Source of truth

- `make dictionary-music` / `make dictionary-standard`
- Live checks with `osascript` against Music.app
- Raw dictionary commands live only in this file and in the `Makefile`

## Repo Layout

- `AGENTS.md`: this file; rules for coding agents.
- `SKILL.md`: the skill contract and usage instructions for agents.
- `README.md`: public project overview and installation notes.
- `Makefile`: targets `dictionary-music`, `dictionary-standard`, `check`, `compile`, `test` (test-dictionary + test-smoke).
- `scripts/commands/<entity>/<action>.sh` — public shell interface (run from repo root).
- `scripts/applescripts/<entity>/<action>.applescript` — internal AppleScript backends (invoked via `osascript`).
- `scripts/commands/_lib/common.sh` — shared helpers (`run_backend`, `json_wrap`, `json_fail`).
- `tests/dictionary_contract.sh`: contract test against Music.app scripting dictionary.
- `tests/smoke_music.sh`: smoke test for the command layer (skips when Music.app is not available).
- `.github/workflows/ci-pr.yml`: PR validation, auto-merge, version bump, tag, and release flow.
- `.github/workflows/ci-main.yml`: main-branch validation, patch tag, and release flow.

## Pitfalls / Environment limits

- Music.app automation may need a TCC permission prompt the first time a process sends it Apple events (System Settings → Privacy & Security → Automation). Document TCC blocks clearly instead of retrying blindly.
- Apple Music (the streaming service) and the local library differ: some tracks are subscription catalog items and may not be writable or may require an active subscription. Stream-only tracks may not support all properties (e.g. file path).
- `make test-dictionary` and `make test-smoke` require a real Music.app and `sdef`; they cannot run in CI without macOS.

## Safety rules

- Treat the music library as real user data. Never send, delete, move, overwrite, or export without explicit user approval.
- Library mutations need explicit approval before running: `playlist/create`, `playlist/add-track`, `library/add-files`.
- Use the `CodexTest_` prefix for any test playlists or test data, and clean them up afterwards.
- Read-only commands (playback, state, volume get, shuffle/repeat get, track search/current) are safe by default.

## Validation

After making changes:
- run `make compile` to compile all AppleScript files (syntax check) and `bash -n` all shell wrappers;
- run `make check` to ensure Music.app is available;
- run `make test` to run dictionary contract and smoke tests (live; needs Music.app);
- update `SKILL.md` when command coverage changes.

## Editing Rules

- Keep docs in simple English.
- Do not claim support for a feature unless it is verified with Music.app AppleScript.
- Never modify the user's library (create playlists, delete tracks) without explicit user approval.
- Keep `SKILL.md` and `README.md` about the public `scripts/commands` interface, not internal backends.