.PHONY: dictionary dictionary-music dictionary-standard compile check test test-dictionary test-smoke

dictionary:
	@printf '### Music.app\n'
	@sdef /System/Applications/Music.app
	@printf '\n### CocoaStandard.sdef\n'
	@cat /System/Library/ScriptingDefinitions/CocoaStandard.sdef

dictionary-music:
	@sdef /System/Applications/Music.app

dictionary-standard:
	@cat /System/Library/ScriptingDefinitions/CocoaStandard.sdef

compile:
	@set -euo pipefail; \
	find scripts/applescripts -name '*.applescript' -print | while IFS= read -r file; do \
		osacompile -o /tmp/$$(echo "$$file" | tr '/' '_' | sed 's/\.applescript$$/.scpt/') "$$file" || exit 1; \
	done; \
	find scripts/tests scripts/commands -name '*.sh' -print | while IFS= read -r file; do \
		bash -n "$$file" || exit 1; \
	done

check:
	@osascript -e 'tell application "Music" to get name' >/dev/null || { echo "check: Music not available"; exit 1; }
	@echo "Music is available"

test: test-dictionary test-smoke

test-dictionary:
	@bash scripts/tests/dictionary_contract.sh

test-smoke:
	@bash scripts/tests/smoke_music.sh
