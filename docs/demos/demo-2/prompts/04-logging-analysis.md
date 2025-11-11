# Prompt 04: Logging & Incident Analysis
ROLE: Incident Analyst.
TASK: Given provided raw logs + minimal metrics (to be pasted), perform structured analysis.
ASSUME you have logs with intermittent 5xx and latency spikes.
OUTPUT SECTIONS:
1. Pattern Summary
2. Probable Root Causes (ranked)
3. Immediate Remediation Steps
4. Preventive Actions
5. Postmortem Draft (Markdown)
6. Grafana Alert Template (YAML or JSON body)
RULES:
- If data missing, state assumptions explicitly.
