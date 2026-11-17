---
name: measure-first
description: Performance work done honestly: baseline, audit, fix the biggest bottleneck, re-measure, report before/after. Use when asked to make something faster, raise FPS, cut CPU, memory or load time, or "optimize" anything. Prevents guessing and unmeasured claims.
---

# Measure first

No optimization without a number before and a number after.

## 1. Define the metric and the target

Ask or infer: what is slow (frame time, startup, request latency, memory, CPU), on what hardware, and what "good" means. If there is no target, propose one and say it is an assumption.

## 2. Build a repeatable baseline

- Make the scenario deterministic: same input, same warm-up, same duration, same settings (turn off vsync, frame caps, background load).
- Record several metrics, not one: average and 1% low or p99, frame or latency time, CPU, GPU where relevant, memory peak and steady state.
- Add the measurement to the project (a script or a flag), so it can be re-run later.
- Run it more than once. If runs differ by more than the effect you expect, you are measuring noise: fix the setup (close other apps, interleave A/B runs) or report the noise honestly.

## 3. Audit before touching code

Rank bottlenecks by measured or reasoned impact, with file and function for each. Separate CPU, GPU/render, memory and I/O. Look for: per-frame or per-request allocation, repeated work that could be cached, work on the hot thread that could move, overdraw and unbatched draw calls, N+1 queries, oversized assets, leaks.

## 4. Fix in small steps

One change, one re-measure. Keep each step reviewable. Preserve behavior: run the tests and check the output visually or functionally after each step. Add quality settings (a cap, a "low" mode) when users on weaker hardware benefit.

## 5. Report honestly

Give a before/after table with the same metrics and conditions. State noise, what was not measured, and what still limits performance. Never report a gain that sits inside the measured noise as a win.
