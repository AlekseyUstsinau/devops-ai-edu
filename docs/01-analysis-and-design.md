# Demo 1: Analysis & Design

**Goal:** Demonstrate how LLM and Copilot accelerate analysis and design by generating ready-to-use epics, stories, and a fully formatted architecture diagram.

---

## Detailed Step-by-Step Demo Plan

### 1. Presentation of Business Requirements

**Demonstrator Actions:**
- Open the Markdown file containing the corporate website task.
- Read and explain the requirements to the team, emphasizing that this is the full business specification from management.

**Expected Outcome:**
- Team understands the full scope of the project.
- All key components (Infrastructure, Application, CI/CD, Monitoring, Automation) are clearly visible in the requirements.

---

### 2. Generate Epics and Stories with Estimates

**Demonstrator Actions:**
- Ask LLM/Copilot to generate epics and stories with full details, including Acceptance Criteria, Effort Estimation, and a suggested folder/file hierarchy for epics/stories/tasks.

**Example LLM Prompt:**
```plaintext
Generate epics and stories for the corporate website project. Include:
- Detailed description
- Expected outcome
- Acceptance Criteria
- Effort estimation for one DevOps engineer
- Save it as files
- Folder/file structure: tasks/<epic name>/<Number as logical order in implementation>-<task name>.md
Ensure all tasks are ready for immediate planning and implementation.
```

- Present generated backlog to the team and discuss minor adjustments if necessary.
- Add tasks to **Jira** or **GitHub Projects**.

**Expected Outcome:**
- Complete list of epics and stories with clear titles, descriptions, Acceptance Criteria, and effort estimations.
- Structured backlog ready for implementation.

---

### 3. Generate Architecture Diagram

**Demonstrator Actions:**
- Ask LLM to generate an architecture diagram in **Mermaid format** (ready to paste into Markdown).

**Example LLM Prompt:**
```plaintext
Generate a Mermaid architecture diagram for the corporate website project:
- Include all known components: VPC, EKS, ALB, ECR, Docker container, CI/CD pipeline, CloudWatch logs.
- Show data flows between components.
- Make it suitable to embed directly in Markdown using ```mermaid``` code block.
- Save it as DIAGRAM.md file
```

- Paste the generated diagram into a slide or Markdown file.
- Discuss data flows and dependencies with the team.

**Expected Outcome:**
- Fully formatted Mermaid diagram showing all key components and connections.
- Team understanding of component interactions and deployment flow.

---

### 4. Team Interaction and Validation

**Demonstrator Actions:**
- Encourage the team to review LLM-generated epics, stories, and diagram.
- Ask for feedback: “Are there any missing components or misaligned dependencies?”
- Adjust as necessary with team input.

**Expected Outcome:**
- LLM output validated by the team.
- Consensus on task breakdown and architecture.

---

### 5. Demo 1 Result
- Ready-to-use epics and stories with Acceptance Criteria and effort estimations.
- Fully formatted Mermaid architecture diagram.
- Team ready to move to the implementation phase without additional refinement.
