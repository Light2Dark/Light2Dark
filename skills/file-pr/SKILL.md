---
name: file-pr
description: Make commits and create a new draft PR. Use when user asks to create a PR or to push the changes.
user-invocable: true
allowed-tools: Bash(git:*), Bash(gh:*), Bash(jq:*), Bash(rg:*), Bash(sed:*), Bash(ls:*), Bash(cat:*), Bash(mkdir:*), Bash(date:*), Bash(uv:*), Bash(make:*), Bash(pnpm:*), Read, Write, Edit, Glob, Grep, WebFetch, AskUserQuestion, Agent
---

# File a Pull Request

## Instructions

### 1. See if we are already in a PR branch. If so, use the current branch. Otherwise, create a new branch.

### 2. Identify the changes to be committed. It should be relevant to the user's request, ignore irrelevant changes.

### 3. Make commits. Commits should be small and focused, with good commit messages (avoid verbose commit messages).

### 4. Push the commits and create a new draft PR.
- Push the branch directly to the upstream repo where possible (the `origin` remote, e.g. `marimo-team/marimo`), NOT to a personal fork. Use `git push -u origin <branch>`.
- Open the PR against `origin`'s default branch.

### 5. Update the PR title and description based on the changes. The description should follow the repository's PR template.
- For PR titles, use concise, human-readable titles that explains why the change matters:

BAD:
> ❌ perf(server): negotiate message-deflate size on websockets

GOOD:
> ✅ perf(server): cut websocket frame size by 70% with gzipping

For descriptions:
- Open the description with a simple explanation of the problem based on the user's original request, then briefly explain the solution. Do not inventory list the changes.
- Detail the why we made this decision rather than just how.
- Avoid writing test plans or validation messages.
- You should add a short blurb at the end of the description that says: "> Written by [MODEL_SLUG] on [HARNESS_SLUG]"

The repository might enforce a label for the PR. If so, choose one and apply it.

### 6. Attach visual evidence when it helps reviewers.
- When screenshots or recordings were produced while verifying the change, upload them as native GitHub attachments with `gh --attach`. Do not commit them to the repository or upload them to a public image host.
- Prefer embedding them in the description: reference the local file in the body (`![Login error state](./login.png)`), then run `gh pr edit <number> --body-file <file> --attach ./login.png`. `gh` rewrites the reference to the uploaded asset.
- For evidence that does not belong in the description, post a concise visual-verification comment: `gh pr comment <number> --body-file <file> --attach './after.png#Alt text'`.
- Give every image alt text that says what it shows. Use the `<file>#<alt>` form or the alt in the body reference. Videos cannot have alt text.

### 7. Next steps

If the reviewer asks to babysit the PR, continue with the `babysit-pr` skill.

## Tools

- Use `gh` to make commits, changes, etc.
- Use `uv` for Python related checks.

