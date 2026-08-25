---
name: babysit-pr
description: Monitor a pull request through review and CI. Use when the user asks to monitor, watch or babysit a PR.
---

# Babysit PR

Your goal is to ensure a PR is green and ready to merge.

All the repos have both human and AI reviewers. They are helpful even if the findings are not always valid.

If your harness offers tools to monitor a PR, use them so you can respond to comments as they arrive. Else, poll the PR for new comments and checks.

Only act on checks and comments newer than the latest push. Verify each bot finding against the source code before changing, perform tests and check if valid first. Only fix real findings and CI failures as a result of the PR. Distinguish between pre-existing issues and problems uncovered as a result of your change that are unrelated. 
Do not let review feedback expand beyond the original scope of the PR. Address real issues but avoid scope creep. Ask me if you are unsure. Get back to me so we can decide what to do. 

Reply with a written reason when dismissing false positives.

When leaving replies, format this way:
```md
[MODEL_SLUG] responding on behalf of Shahmir
-----

[actual reply]
```
