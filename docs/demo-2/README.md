
## Security & Observability Hardening

You already have a working environment and CI/CD pipeline.
Now, your goal is to:
Analyze the deployed infrastructure for cost inefficiencies.
Implement Terraform and pipeline optimizations suggested by LLM.


```
ROLE: Security & Observability Reviewer.

TASK: Review and optimize existing Terraform and GitHub Actions code for security efficiency: 
- Restrict IAM roles to least-privilege.
- Add logs, alerts where it required according to best bractices.
- Enable activity log retention (30 days).
- Ensure enought tags set.
- Add outputs for key resource IDs.
- Secret management.
- Supply chain security (pin actions, use verified publishers).
- Observability (add logs/artifacts upload, deployment notifications).
- Security scans if approrpiate

CONSTRAINTS:
- Do not introduce services outside earlier scope.
- Keep inline comments brief.

OUTPUT: Show only added/changed blocks.
```

## Bestpractices


## Cost Optimization / Resource Efficiency

You already have a working environment and CI/CD pipeline.
Now, your goal is to:
   Analyze the deployed infrastructure for cost inefficiencies.
   Implement Terraform and pipeline optimizations suggested by LLM.
   Validate that the updated configuration uses fewer resources or is more cost-effective.

```
ROLE: FinOps & Resource Efficiency Reviewer.
TASK: Review and optimize existing Terraform and GitHub Actions code for cost and resource efficiency within AWS infrastructure.

OBJECTIVES:
1. Identify AWS cost inefficiencies in Terraform code:
   - Oversized EC2 instance types or underutilized resources.
   - Unattached EBS volumes, idle Load Balancers, or Elastic IPs.
   - Missing auto-scaling or instance schedule policies.
   - Overly long CloudWatch log retention or expensive S3 storage tiers.
   - Unused NAT Gateways or public-facing components.

2. Suggest and generate optimized Terraform configurations:
   - Replace compute SKUs with cost-effective instance types (e.g., t3/t4g for dev workloads).
   - Enable instance auto-stop/start or scaling policies for non-prod.
   - Set CloudWatch log retention to 30 days.
   - Move infrequent data to S3 Infrequent Access or Glacier.
   - Output estimated monthly cost savings per change.

3. Analyze GitHub Actions pipelines for efficiency:
   - Identify redundant or costly workflow steps.
   - Introduce caching (e.g., for Terraform plugins or dependencies).
   - Skip deploys when infrastructure hasn’t changed.
   - Recommend parallelization or matrix optimizations if safe.

CONSTRAINTS:
- Do not introduce new AWS services outside existing scope.
- Keep all Terraform and pipeline modifications minimal and reversible.
- Retain existing security and observability enhancements from previous demos.
- Keep inline comments short and functional.

OUTPUT:
- Markdown table summarizing issues and recommendations.
- Terraform code diff showing only added or changed blocks.
- Updated GitHub Actions YAML snippets demonstrating runtime optimizations.
- Final summary table: "Improvement | Impact | Est. Monthly Savings (USD)".
```














### Logging Investigation

✅ Отличный кейс — все девопсы с этим сталкиваются.
💡 Сделай упор не на “LLM как парсер логов”, а на путь рассуждения:

вводишь логи/метрики →

просишь LLM найти закономерности (“What’s the most common error cause?”) →

формируешь диагноз + remediation plan →

бонус: “generate a postmortem summary” или “Grafana alert message template”.

⚠️ Главное — не превращай в “LLM прочитал логи и угадал причину”. Лучше показать, как он ускоряет анализ и коммуникацию.




💻 4. CLI AI Tools

✅ Классно, если ты покажешь Copilot-cli, gh copilot, aider, llama-cpp, или open-interpreter — но с прицелом на use-case, не инструмент.
💡 Идея: “как я автоматизирую скучную рутину в CLI при помощи LLM” — например:

генерирую jq фильтры по описанию,

создаю kubectl команды по естественному языку,

пишу one-liners для Bash.

⚠️ Но не делай это “технической рекламой CLI”. Лучше подай как: “вот как LLM встроился в мой shell-цикл”.


🔁 5.  Infra Converter

Конверт АВС инфраструктуры из terraform папки в terraform/azure в Ажур