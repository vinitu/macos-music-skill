.PHONY: dictionary-music compile check test test-dictionary test-smoke

dictionary-music:
	@sdef /System/Applications/Music.app

compile:
	@set -euo pipefail; \
	find scripts -name '*.applescript' -print | while IFS= read -r file; do \
		osacompile -o /tmp/$$(echo "$$file" | tr '/' '_' | sed 's/\.applescript$$/.scpt/') "$$file"; \
	done

check:
	@osascript -e 'tell application "Music" to get name' >/dev/null || { echo "check: Music.app not available"; exit 1; }
	@echo "Music.app is available"

test: test-dictionary test-smoke

test-dictionary:
	@bash tests/dictionary_contract.sh

test-smoke:
	@bash tests/smoke_music.sh
