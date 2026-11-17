---
name: verify-before-done
description: Before saying work is finished, prove it. Run the build, the tests and the real thing, check the output yourself, and report what was and was not verified. Use at the end of any coding task, before claiming something works, is fixed, released or published, and whenever delegating work to subagents.
---

# Verify before done

"It should work" is not a result. Evidence is.

## Checklist before the final message

1. **Build** the project the way a user would (`npm run build`, `./gradlew build`, `cargo build`). Read the output; do not assume.
2. **Run the tests** that exist. If you changed behavior, add or update one.
3. **Run the thing**: start the app, hit the endpoint, open the page, take a screenshot, run the CLI. Look at the result.
4. **Check the diff**: read it once as a reviewer would. Look for leftovers: debug prints, commented code, personal paths, accidental files.
5. **Check the edges** you touched: empty input, error path, other versions or platforms the project supports.
6. **Subagent output is a claim, not a fact.** Read the changed files and run the quick check before relaying it.

## Report with three groups

- **Verified**: what you ran or looked at, and the result.
- **Not verified**: what you could not run (other versions, real accounts, production, hardware) and why.
- **Changed but not asked for**: any side effects, renamed files, new settings.

## Rules

- If something failed, say so with the actual output. Do not soften it.
- Do not claim a visual result you did not look at.
- If a step was skipped, say it was skipped.
- For irreversible or outward-facing actions (push, publish, release, delete), confirm with the user first unless they clearly asked for exactly that.
