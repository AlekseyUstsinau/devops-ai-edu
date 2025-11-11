# Demo 0: Preparatory Steps

## Overview

Before starting Demo 1, you need to set up instruction files that guide GitHub Copilot (or another AI agent) on how to work with your project. These files will be loaded from the `.github/instructions/` directory and help the agent understand your project's context and constraints.

## Required Instruction Files

Create two instruction files in the `.github/instructions/` directory:

1. **`terraform.instruction.md`** - Defines where infrastructure code is located and what operations are permitted (reading files, proposing plans, etc.)
2. **`jira.instruction.md`** - Specifies how Jira issues should be structured (required fields, summary pattern, etc.)

At minimum, each file should contain a stub with a brief purpose statement.

### VS Code Settings Reference

You can configure instruction file locations in VS Code settings:
- `vscode://settings/chat.modeFilesLocations`
- `vscode://settings/chat.instructionsFilesLocations`

## Instruction File Structure

Each instruction file should include the following sections:

- **Project context** - Brief description (1-2 paragraphs) of the project and relevant terminology
- **Allowed actions** - Bullet list of operations the agent can perform
- **Restrictions** - Clear boundaries on what the agent should NOT do without explicit confirmation
- **Templates** - Any specific formats required for requests or outputs

## Why These Files Matter

Instruction files provide essential context that enables the AI agent to:
- Generate accurate and appropriate responses
- Follow project-specific conventions
- Avoid unnecessary clarification questions
- Operate within defined safety boundaries

## Example: Minimal Terraform Instruction File

```markdown
# Terraform Instruction

## Context
Infrastructure code is located in the `./infra` directory.

## Allowed Actions
- Read any `*.tf` files
- Propose infrastructure change plans
- Explain existing configurations

## Restrictions
- Do NOT commit or apply changes without explicit review and approval
```

## Additional Setup: GitHub MCP Server

**Important:** Before proceeding to Demo 1, you must connect the GitHub MCP (Model Context Protocol) server in your IDE. This enables the agent to:
- Create and manage GitHub issues
- Interact with repository resources
- Execute repository operations

**Timing:** Set up the MCP connection after creating the instruction files but before starting the demo walkthroughs.

## Next Steps

1. Create `.github/instructions/terraform.instruction.md`
2. Create `.github/instructions/jira.instruction.md`
3. Configure GitHub MCP server connection
4. Commit the instruction files to your repository
5. Proceed to Demo 1

If you would like assistance creating these instruction file stubs, please let me know.
