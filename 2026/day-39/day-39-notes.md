 Day 39 – What is CI/CD?

## Task
Before writing a single pipeline, understand **why CI/CD exists** and what it actually does.

Today is a research and diagram day — no pipelines yet. Get the concepts right first.

---
## Challenge Tasks

### Task 1: The Problem
Think about a team of 5 developers all pushing code to the same repo manually deploying to production.

Write in your notes:
1. What can go wrong?

Ans: Several problems can occur:

Conflicting changes – Developers may overwrite each other’s work.

Unreviewed code in production – Bugs can reach production without testing.

Deployment mistakes – Someone may deploy the wrong branch or wrong version.

Missed dependencies – Required libraries or environment variables may be missing.

Downtime – Incorrect deployments can crash the application.

Inconsistent environments – Production may differ from development machines.

Human error – Manual steps increase the chance of mistakes.

2. What does "it works on my machine" mean and why is it a real problem?

Ans : It works on my machine” means:

A developer’s code runs correctly on their local computer, but fails on another developer’s machine, staging, or production.

Why this happens :- 

Different operating systems

Different library versions

Missing environment variables

Different database setups

Missing dependencies

Example:

Developer machine:
Python 3.11 + Flask 2.3 → Works

Production:
Python 3.8 + Flask 1.1 → App crashes

Why it is a real problem?

Bugs appear only after deployment.

Wastes time debugging environment issues.

Slows down development.

Makes collaboration difficult.

3. How many times a day can a team safely deploy manually?

Ans: Usually 1–2 times per day at most, sometimes even less.

Why?
Manual deployments require:- 
Testing
Coordination
Careful execution
Verification after deployment
Each deployment introduces risk of human error.

---

### Task 2: CI vs CD
Research and write short definitions (2-3 lines each):
1. **Continuous Integration** — what happens, how often, what it catches
2. **Continuous Delivery** — how it's different from CI, what "delivery" means
3. **Continuous Deployment** — how it differs from Delivery, when teams use it

Ans: 1.Continuous Integration (CI)
Continuous Integration is the practice of automatically building and testing code whenever developers push changes to a shared repository.
It happens frequently (often multiple times a day) and helps catch integration issues, bugs, and failed builds early before they reach production.

2.Continuous Delivery (CD)
Continuous Delivery extends CI by ensuring that the application is always in a deployable state after passing automated tests.
The code is automatically prepared for release to production, but a human usually approves the final deployment step.

3.Continuous Deployment
Continuous Deployment goes one step further than Continuous Delivery by automatically deploying every successful change directly to production without manual approval.
Teams use it when they have strong automated testing, monitoring, and rollback systems to safely release updates many times a day.


---

### Task 3: Pipeline Anatomy
A pipeline has these parts — write what each one does:
- **Trigger** — what starts the pipeline
- **Stage** — a logical phase (build, test, deploy)
- **Job** — a unit of work inside a stage
- **Step** — a single command or action inside a job
- **Runner** — the machine that executes the job
- **Artifact** — output produced by a job


Ans: Trigger:
A trigger is the event that starts the pipeline automatically.
Common triggers include code pushes, pull requests, scheduled runs, or manual execution.

Stage:
A stage is a major phase in the pipeline that groups related tasks together.
Typical stages include build, test, and deploy, and they usually run in sequence.

Job:
A job is a specific task executed within a stage.
Each job runs independently and performs a defined function such as running tests or building an application.

Step:
A step is a single command or action inside a job.
Steps execute sequentially and can include things like installing dependencies, running scripts, or executing tests.

Example:
Step 1: Install dependencies  
Step 2: Run tests  
Step 3: Build application

Runner:
A runner is the machine (virtual machine, container, or server) that actually executes the jobs in the pipeline.
Runners can be hosted by the CI service or self-hosted by the development team.

Artifact:
An artifact is a file or output produced by a job that can be saved and used later in the pipeline.
Examples include compiled applications, test reports, logs, or Docker images.

✅ Simple Pipeline Flow

Trigger → Stage → Job → Step
           ↓
         Runner executes it
           ↓
---

### Task 4: Draw a Pipeline
Draw a CI/CD pipeline for this scenario:
> A developer pushes code to GitHub. The app is tested, built into a Docker image, and deployed to a staging server.

Include at least 3 stages. Hand-drawn and photographed is perfectly fine.

Ans: Developer
    │
    │  Push code
    ▼
 GitHub Repository
    │
    │ (Trigger pipeline)
    ▼
┌───────────────┐
│   Stage 1     │
│     Build     │
│ Install deps  │
│ Compile app   │
└───────────────┘
        │
        ▼
┌───────────────┐
│   Stage 2     │
│     Test      │
│ Run unit tests│
│ Run linting   │
└───────────────┘
        │
        ▼
┌───────────────┐
│   Stage 3     │
│ Docker Build  │
│ Build Docker  │
│ Image         │
│ Push to repo  │
└───────────────┘
        │
        ▼
┌───────────────┐
│   Stage 4     │
│   Deploy      │
│ Deploy image  │
│ to Staging    │
└───────────────┘
        │
        ▼
   Staging Server

   Developer → GitHub → Build → Test → Docker Image → Deploy → Staging Server
---

### Task 5: Explore in the Wild
1. Open any popular open-source repo on GitHub (Kubernetes, React, FastAPI — pick one you know)
2. Find their `.github/workflows/` folder
3. Open one workflow YAML file
4. Write in your notes:
   - What triggers it?
   - How many jobs does it have?
   - What does it do? (best guess)

Ans: Folder : https://github.com/fastapi/fastapi/blob/master/.github/workflows/build-docs.yml

- What triggers it?

Ans: It triggers on Push master branch and ull requests that are opened or synchronized (updated with new commits):

- How many jobs does it have?

Ans: 4 jobs are running :- 
changes – checks which files changed to see if docs need rebuilding.
langs – determines which languages to build docs for.
build-docs – actually builds the documentation for each language.
docs-all-green – a helper job for branch protection to report overall success/failure.

- What does it do? (best guess)

Ans: changes: Uses dorny/paths-filter to see if any documentation-related files changed (like docs/**, README.md, mkdocs.yml).
langs: Prepares Python and uv environment, then figures out which languages need documentation built.
build-docs: For each language, installs dependencies, builds the docs, caches build results, and uploads artifacts for inspection.
docs-all-green: Ensures that branch protection rules can see the overall workflow result, even if some jobs are skipped.
---

## Hints
- CI/CD is a practice, not just a tool
- GitHub Actions, Jenkins, GitLab CI, CircleCI — all are tools that implement CI/CD
- A pipeline failing is not a problem — it's CI/CD doing its job