## Demo Scenario: FROM EMAIL TO DEPLOYED INFRA

> Use ticket with all requirenments for deployment to create complete process:
> Building app - Push to ECR - deploy to ECS
> No blueprints or templates exist for that, so everything should be created from scratch
> All required for deployment config files should be created as well
> Githu workflow pipeline need to be created as well
> Use bestpractices for that sphere as guide to follow


Using the provided input data from ticket #
Using information about infrastructure in #

Generate github workflow in #main.yaml which will build deploy Docker image, and deploy it to AWS ECS Fargate.

There is no task defenition created already or service in ECS, so it should be done by you.

Ask me questions to fill any gaps in order to perform this.


### 3. Registering a Task Definition
Generate the complete JSON document to register a new **Fargate** task definition with the family name `my-fargate-task-def`. Ensure that:
* The `"image"` field uses the provided **ECR Image URI**.
* The `"executionRoleArn"` field uses the provided **Task Execution Role ARN**.
* The provided **CPU** and **Memory** values are set.
* **`logConfiguration`** is set up for CloudWatch, using the group `/ecs/my-fargate-task-def` and the region **`YOUR_REGION`**.

### 4. Creating an ECS Service
Generate the **`aws ecs create-service`** command to launch a service named `my-app-service` in the `my-fargate-cluster`. Ensure that:
* The service uses the newly created task definition `my-fargate-task-def`.
* The desired number of tasks (`desired-count`) is set to `1`.
* The network configuration (`--network-configuration`) is set up using the provided **VPC**, **subnets**, and **security group**, with public IP (`assignPublicIp`) **enabled**.

The output should contain the full JSON for step 3 first, followed by the AWS CLI command for step 4. Replace the placeholders (e.g., `[INSERT YOUR ECR URI]`, `YOUR_REGION`) with the actual data.