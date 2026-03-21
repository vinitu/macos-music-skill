# Repo Guide

This repo stores a skill for macOS Music.app integration.

## Goal

- Document AppleScript commands for Music.app accurately.
- Prefer runnable examples over long prose.
- Never modify the user's library (create playlists, delete tracks) without explicit user approval.

## Repo Layout

- `AGENTS.md`: this file; rules for coding agents.
- `SKILL.md`: the skill contract and usage instructions for agents.
- `README.md`: public project overview and installation notes.
- `Makefile`: targets `dictionary-music`, `check`, `compile`, `test` (test-dictionary + test-smoke).
- `scripts/playback/state.applescript`, `play.applescript`, `pause.applescript`, `stop.applescript`, `next.applescript`, `previous.applescript`, `back-track.applescript`, `fast-forward.applescript`, `resume.applescript`, `play-track.applescript`.
- `scripts/track/current.applescript`, `search.applescript`, `reveal.applescript`.
- `scripts/playlist/list.applescript`, `tracks.applescript`, `create.applescript`, `add-track.applescript`.
- `scripts/volume/get.applescript`, `set.applescript`; `scripts/shuffle/get.applescript`, `set.applescript`; `scripts/repeat/get.applescript`, `set.applescript`.
- `scripts/application/player-position.applescript`, `eq-enabled.applescript`, `mute.applescript`.
- `scripts/library/add-files.applescript`.
- `tests/dictionary_contract.sh`: contract test against Music.app scripting dictionary.
- `tests/smoke_music.sh`: smoke test for script layer (skips when Music.app not available).
- `.github/workflows/ci-pr.yml`: PR validation, auto-merge, version bump, tag, and release flow.
- `.github/workflows/ci-main.yml`: main-branch validation, patch tag, and release flow.

## Validation

After making changes:
- run `make check` to ensure Music.app is available;
- run `make test` to run dictionary contract and smoke tests;
- run `make compile` to compile all AppleScript files (syntax check);
- update `SKILL.md` when command coverage changes.

## Editing Rules

- Keep docs in simple English.
- Do not claim support for a feature unless it is verified with Music.app AppleScript.
- Never modify the user's library (create playlists, delete tracks) without explicit user approval.
