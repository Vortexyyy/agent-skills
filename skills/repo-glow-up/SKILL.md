---
name: repo-glow-up
description: Make a GitHub repo look great and easy to adopt: banner, badges, screenshots, clear README, topics, star call to action. Use when asked to polish, "spice up", or prepare a repo for public release. Run the publish-safety-audit skill first if the repo is private or about to go public.
---

# Repo glow-up

A visitor decides in about ten seconds. Show what it is, show it working, and tell them how to start.

## 1. Understand the project first

Read the code and the existing README. Write the one-sentence pitch ("X that does Y for Z"). If you cannot, ask the user.

## 2. README structure

1. **Banner** (SVG in `docs/banner.svg`, relative path so it works on forks).
2. **Badges**: version/download, supported platforms or versions, license, stars. Keep to one row.
3. **Pitch** in one centered line, then a star request: friendly, one sentence, a link to `/stargazers`.
4. **Highlights**: a two-column table of the best features, not an exhaustive list.
5. **Screenshots**: one wide hero image, then a captioned grid. Real captures of the real product.
6. **Install / download**, with the shortest path first.
7. **Build from source** in a code block that actually works.
8. **Privacy / security** notes if relevant, honest and specific.
9. **Support**: star, issues, share. Repeat the star button at the bottom.
10. Move long technical docs to `docs/` and link them.

Use colour consistently with the product's own palette. Emoji as section markers are fine in moderation.

## 3. Screenshots

- Capture the real UI with realistic but non-personal data. Use demo accounts and placeholder names.
- Inspect every image for names, emails, paths, tokens, browser tabs, notifications.
- Strip metadata (keep only the critical PNG chunks).
- Keep them reasonably small (under about 600 KB each) and name them by content (`launcher-home.png`).

## 4. Repository settings

- One-line description and 3 to 6 topics.
- A license file, or an explicit "all rights reserved" line; ask the user which.
- If the project bundles third-party code (for example Stockfish, GPL), respect its license and say so.

## 5. Verify

Load the README as an anonymous visitor: banner and images return HTTP 200, relative links resolve, badges render. Do not claim visual quality you have not looked at; say what was and was not previewed.
