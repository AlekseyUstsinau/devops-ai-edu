# Jira Integration Instructions

## Context
This project integrates with Jira for issue tracking and project management. Issues should follow standardized formats to ensure consistency and proper tracking of development tasks, bugs, and feature requests.

## Issue Types
- **Story**: New features or enhancements
- **Task**: General development work or improvements
- **Bug**: Defects or issues that need fixing
- **Epic**: Large features broken down into smaller stories

## Required Fields
- **Summary**: Clear, concise description of the issue (format: [Type] Brief description)
- **Description**: Detailed explanation with acceptance criteria
- **Priority**: Based on business impact (High/Medium/Low)
- **Labels**: Appropriate tags (demo, terraform, automation, etc.)
- **Components**: Relevant system components affected
- **Assignee**: Developer responsible for the work

## Summary Pattern
Use this format for issue summaries:
- `[STORY] Add new AWS S3 bucket configuration`
- `[TASK] Update Terraform module documentation`
- `[BUG] Fix security group rule validation error`
- `[EPIC] Implement CI/CD pipeline automation`

## Description Template
```
## Objective
Brief description of what needs to be accomplished.

## Acceptance Criteria
- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Criterion 3

## Technical Notes
Any relevant technical details, dependencies, or considerations.

## Definition of Done
- [ ] Code implemented and tested
- [ ] Documentation updated
- [ ] Peer review completed
- [ ] Integration tests passing
```

## Allowed Actions
- Create new Jira issues following the template
- Update existing issue descriptions and status
- Add comments with progress updates
- Link related issues and dependencies
- Set appropriate priority and labels

## Restrictions
- **DO NOT** create issues without proper summary format
- **DO NOT** assign issues without consulting the team
- **DO NOT** close issues without completing acceptance criteria
- **DO NOT** modify workflow states without understanding the process