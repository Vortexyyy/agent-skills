---
name: publish-safety-audit
description: Audit a project for secrets and personal data before it is pushed public or shared. Use when the user wants to make a repo public, publish code, open-source something, or asks "is anything private in here". Scans the working tree, the full git history, build artifacts and image metadata, then reports before anything is published.
---

# Publish safety audit

Goal: nothing personal or secret leaves the machine. Audit first, publish second, and never publish without the user's explicit go-ahead after the report.

## 1. Know what would be published

- `git remote -v`, `git ls-files | wc -l`, and the repo's current visibility (`gh repo view --json visibility`).
- Read `.gitignore`. Confirm dev folders (worlds, run/, logs, `.env*`, local config, build output) are ignored.
- List tracked files that are not source (`git ls-files` minus common source extensions). Look at every one.

## 2. Scan the working tree and the whole history

History matters: a secret deleted in a later commit is still public once the repo is.

```bash
git log -p --all --no-color > /tmp/hist.txt
grep -nEi "(ghp_|gho_|github_pat_|sk-[a-z0-9]{20}|AKIA[0-9A-Z]{16}|xox[bp]-|BEGIN [A-Z ]*PRIVATE KEY|eyJ[a-zA-Z0-9_-]{20,}\.[a-zA-Z0-9_-]{20,}|(password|secret|api[_-]?key|token)\s*[:=]\s*['\"][^'\"]{6,})" /tmp/hist.txt
```

Then scan for personal strings: the user's real name, email, usernames, home paths (`C:\Users\`, `/Users/`, `/home/`), machine names, IP addresses, phone numbers. Also check:

- committer emails: `git log --all --format='%an <%ae>' | sort -u` (prefer the GitHub `noreply` address);
- binary files and jars: grep with `-a` for the same strings; check git history for large or deleted binaries;
- images: PNG/JPEG metadata (EXIF, text chunks) and the pixels themselves (names, paths, usernames, tabs, notifications in screenshots);
- config examples that contain real values instead of placeholders.

Never print a real secret into the report or chat. Report the file and line, and describe it.

## 3. Check for secrets that are stored on purpose

Encrypted credential blobs, saved sessions, cookies and tokens do not belong in a repo even when encrypted. Confirm none are tracked, and that the code reads them from the user's own data folder at runtime.

## 4. Check dependencies and the app

Run the ecosystem's audit (`npm audit`, `pip-audit`, `cargo audit`, etc.). Separate runtime dependencies from build-only ones in the report. For desktop and web apps, glance at obvious hardening: sandboxing, context isolation, restricted navigation.

## 5. Report, then ask

Give a short report: what was checked, what was found (with severity), what was fixed, what remains. If anything was found in history, explain the options (rewrite history, rotate the credential, or start a clean repo) and **rotate any real credential regardless**.

Only after the user says to publish:

- flip visibility and enable secret scanning and push protection;
- verify as an anonymous user (raw URLs return 200, README renders).
