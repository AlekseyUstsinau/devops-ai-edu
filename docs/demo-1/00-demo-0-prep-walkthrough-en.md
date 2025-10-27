# Demo 0: Preparatory Steps (required instruction files)

You need specific instruction files for Copilot (or another agent) that it will load from the `.github/instructions/` directory.

## Required instruction files
Prepare ONLY two files (at minimum — stubs with a short purpose statement):

1. `.github/instructions/terraform.instruction.md` — where infra code lives and what is allowed (read, propose plan, etc.).
2. `.github/instructions/jira.instruction.md` — how Jira issues should be formed (required fields, summary pattern).

vscode://settings/chat.modeFilesLocations

## What they should contain (short)
- Project terms / context (1–2 short paragraphs).
- Allowed actions (bullet list).
- Restrictions (what NOT to do / not to change without confirmation).
- Request / template format (if any).

## Why they are needed
The agent uses these files as context to generate correct actions and avoid unnecessary questions.

## Minimal content example (Terraform)
```
# Terraform
Context: infrastructure code is in ./infra.
Allowed: read *.tf, propose change plans.
Forbidden: commit apply without review.
```

## Separate action: MCP connection (not an instruction file)
REQUIRED before running later demos: connect the GitHub MCP server in the IDE/agent (enables creating issues and repository interactions). Do this after adding the two instruction files but before starting the demo walkthroughs.

## Next steps
Create the two instruction files and add them to the repository. Then proceed to Demo 1.

Let me know if you want me to auto-create the stubs.
