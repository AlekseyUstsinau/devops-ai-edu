# Prompt 13: Tag & Governance Consistency (App)

ROLE: Governance Reviewer.
TASK: Ensure all Terraform resources (including newly added app-specific ones) in terraform/ use centralized tag map.
VARIABLE: default_tags (Project, Owner, Environment, CostCenter).
RULE: merge(var.default_tags, { Component = "CorpSite" }).
OUTPUT: Show changed blocks only (for resources missing the pattern) and confirm no duplicate tag logic introduced.
