# 👋 Welcome — Start Here

If you’re exploring my work, these three projects are the best place to begin.  
They show the core themes across my portfolio: **real-time intelligence, agentic AI, governance, workflow orchestration, and developer experience automation.**

---

### 🚀 **1. Project Aurora Echo — Real-Time Meeting Intelligence**
Real-time audio → transcription → reasoning → structured memory.  
*If you only look at one project, make it this one.*  
🔗 https://github.com/NathanMaine/Project-Aurora-Echo

---

### 🧪 **2. Compliance Validation Agent — Governed Agentic Flows**
Demonstrates governance-first agent behavior, rule enforcement, and structured validation for enterprise workflows.  
🔗 https://github.com/NathanMaine/compliance-validation-agent

---

### 🧩 **3. Agentforce Data-Aware Agent — Metadata-Aware Safe Actions (Salesforce)**
Auto-discovers org schema → enforces FLS/sharing → runs safe Apex/Flow actions.  
🔗 https://github.com/NathanMaine/Agentforce-Data-Aware-Agent

---

## 🧰 Agent Suite (5 runnable tools)

This umbrella repo contains **orchestration + documentation**.  
The runnable tools live in their own repos, with consistent install flow, CLI entry points, and `out/` artifact conventions.

| Tool | What it does | Repo | Quickstart |
|------|--------------|------|-----------|
| **aes** | Scenario runner with Doer/Judge stubs → evidence + run summary | https://github.com/NathanMaine/agentic-evaluation-sandbox | https://github.com/NathanMaine/agentic-evaluation-sandbox#quickstart |
| **ggc** | Policy Markdown → governance graph exports | https://github.com/NathanMaine/governance-graph-compiler | https://github.com/NathanMaine/governance-graph-compiler#quickstart |
| **amg** | Ingest meeting events → graph memory + explain paths | https://github.com/NathanMaine/agentic-memory-graph-engine | https://github.com/NathanMaine/agentic-memory-graph-engine#quickstart |
| **shaw** | Workflow run with failure → retry → recovery evidence | https://github.com/NathanMaine/self-healing-agentic-workflows | https://github.com/NathanMaine/self-healing-agentic-workflows#quickstart |
| **tea** | Temporal planning by deps/due dates → plan + state | https://github.com/NathanMaine/temporal-executive-agent | https://github.com/NathanMaine/temporal-executive-agent#quickstart |

---

## Run Everything (one-command demo)

> **Requires Python 3.10+** (recommended: **Python 3.12**).  
> If `python3 --version` shows 3.8/3.9, install a newer Python and rerun.

```bash
python3 --version

git clone https://github.com/NathanMaine/agentic-ai-portfolio.git
cd agentic-ai-portfolio
make setup
make install
make test
make demo
