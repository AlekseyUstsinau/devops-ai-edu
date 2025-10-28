# Prompt 12: Variables Expansion & Autoscaling

ROLE: Infra Optimization Engineer.
TASK: Replace remaining literals (cpu, memory, desired/min/max counts, health check path, scaling thresholds) with variables + descriptions.
Add autoscaling resource blocks (application autoscaling for ECS service) based on CPU>60% in new file: terraform/ecs-autoscaling-app.tf.
OUTPUT: Updated appended section for 02-variables.tf + new ecs-autoscaling-app.tf + any updated references.
