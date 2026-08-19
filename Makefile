.PHONY: setup lint format-check test check

setup:
	uv sync --dev --extra import-json --extra pgp

lint:
	uv run ruff check .

format-check:
	uv run black --check --diff .

test:
	ENV_PATH=etc/test.env uv run pytest

check: lint format-check test