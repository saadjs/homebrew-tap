#!/usr/bin/env python3
from __future__ import annotations

import re
from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent
FORMULA_DIR = ROOT / "Formula"
README_PATH = ROOT / "README.md"
TAP_REPO = "saadjs/homebrew-tap"


def extract(pattern: str, text: str) -> str | None:
    match = re.search(pattern, text, re.MULTILINE)
    return match.group(1) if match else None


def github_repo_from_homepage(homepage: str) -> str:
    match = re.match(r"https://github\.com/([^/]+/[^/]+?)(?:\.git)?/?$", homepage)
    if not match:
        raise ValueError(f"unsupported homepage: {homepage}")
    return match.group(1)


def read_formula(path: Path) -> dict[str, str]:
    text = path.read_text(encoding="utf-8")
    homepage = extract(r'^\s*homepage\s+"([^"]+)"', text)
    desc = extract(r'^\s*desc\s+"([^"]+)"', text) or ""
    version = extract(r'^\s*version\s+"([^"]+)"', text) or ""
    if not homepage:
        raise ValueError(f"missing homepage in {path}")
    repo = github_repo_from_homepage(homepage)
    name = path.stem
    return {
        "name": name,
        "desc": desc,
        "version": version,
        "homepage": homepage,
        "repo": repo,
    }


def release_badge(repo: str, label: str) -> str:
    return f"[![{label} release](https://img.shields.io/github/v/release/{repo}?display_name=tag&label={label})](https://github.com/{repo}/releases)"


def table_release_badge(repo: str) -> str:
    return f"[![GitHub release](https://img.shields.io/github/v/release/{repo}?display_name=tag&label=release)](https://github.com/{repo}/releases)"


def brew_badge(name: str) -> str:
    install_label = name.replace("-", "--")
    return (
        f"[![brew install](https://img.shields.io/badge/brew%20install-saadjs%2Ftap%2F{install_label}-FBB040"
        f"?logo=homebrew&logoColor=black)](https://github.com/{TAP_REPO}/blob/main/Formula/{name}.rb)"
    )


def generate() -> str:
    formulas = sorted((read_formula(path) for path in FORMULA_DIR.glob("*.rb")), key=lambda item: item["name"])

    badge_lines = "\n".join(release_badge(item["repo"], item["name"]) for item in formulas)
    table_lines = "\n".join(
        f"| `{item['name']}` | {table_release_badge(item['repo'])} {brew_badge(item['name'])} |"
        for item in formulas
    )
    install_lines = "\n".join(f"brew install {item['name']}" for item in formulas)
    upgrade_lines = "\n".join(f"brew upgrade {item['name']}" for item in formulas)
    uninstall_lines = "\n".join(f"brew uninstall {item['name']}" for item in formulas)

    return f"""# homebrew-tap

[![Homebrew Tap](https://img.shields.io/badge/homebrew-tap-yellow)](https://github.com/{TAP_REPO})
{badge_lines}

Homebrew tap for my CLI tools.

> This README is generated from `Formula/*.rb`. Edit the formulas or `scripts/generate_readme.py`, not this file by hand.

## Taps

| Tap |  |
| --- | --- |
{table_lines}

## Install

```sh
brew tap {TAP_REPO}
{install_lines}
```

## Upgrade

```sh
{upgrade_lines}
```

## Uninstall

```sh
{uninstall_lines}
```
"""


def main() -> None:
    README_PATH.write_text(generate(), encoding="utf-8")


if __name__ == "__main__":
    main()
