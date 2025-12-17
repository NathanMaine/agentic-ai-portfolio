# 👋 Welcome — Start Here


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

Requires Python 3.10+ (recommended: Python 3.12).
If `python3 --version` shows 3.8/3.9, install a newer Python and rerun.

    python3 --version

    git clone https://github.com/NathanMaine/agentic-ai-portfolio.git
    cd agentic-ai-portfolio
    make setup
    make install
    make test
    make demo

If your `python3` is too old (common on macOS):

    brew install python@3.12
    rm -rf .venv
    make venv PYTHON=/opt/homebrew/bin/python3.12
    make install
    make test
    make demo

### Python version note (macOS)

If `make install` fails with “requires a different Python … not in '>=3.10'”, your system `python3` is too old (often 3.8/3.9).

Apple Silicon (M1/M2/M3):

    brew install python@3.12
    rm -rf .venv
    make venv PYTHON=/opt/homebrew/bin/python3.12
    make install
    make test
    make demo

Intel Mac:

    brew install python@3.12
    rm -rf .venv
    make venv PYTHON=/usr/local/bin/python3.12
    make install
    make test
    make demo



### What the artifacts show you (in plain English)

- They prove each tool actually ran and produced **inspectable, deterministic outputs**, not just console text.
- They give you **evidence** (JSONL) you can diff across runs, feed into future scoring, or use for demos.
- They give you **portable artifacts** (graph JSON/DOT, plan/state) that can be visualized or reused by other tools later.

### What each tool does (deep dive)

**Agentic Evaluation Sandbox (`aes`)** — Compact evaluation harness for agentic behavior. Runs a single scenario end-to-end with a Doer + Judge pattern (stubbed/deterministic today, extensible later) and produces structured, replayable evidence instead of just console output. Each step is logged to append-only `out/evidence.jsonl`, and the run summary is written to `out/runs/<run_id>.json` with timestamps, status/verdict, and artifact pointers. This is the suite anchor for measuring correctness/safety/robustness, and it can grow into real LLM judges, adversarial cases, regression suites, and scoring dashboards.

**Governance Graph Compiler (`ggc`)** — Policy-to-graph compiler that turns human-readable governance text into an inspectable machine structure. Ingests policy Markdown and uses deterministic heuristics to extract headings, bullets, and rule-like statements into a directed graph. Writes `out/graph.json` (nodes/edges, labels, metadata) and `out/graph.dot` (Graphviz). The goal: make governance “real” early so you can review policy as a graph, spot missing edges/contradictions, and later map policies to executable checks, runtime guards, or approval workflows.

**Agentic Memory Graph Engine (`amg`)** — Graph-based memory layer prototype for meetings/events. Starts from an input fixture, builds a memory graph you can inspect (`out/graph.json`, `out/graph.dot`), and separates ingest (build structure) from explain (trace how a node/decision connects to prior events). This answers “why does the agent believe X?” via graph paths instead of black-box responses, and sets up future extensions like richer schemas, retrieval paths, confidence tracking, and cross-agent shared memory.

**Self-Healing Agentic Workflows (`shaw`)** — Minimal workflow runner focused on resilience: detect failure → retry with intent → record recovery. Executes a YAML workflow, simulates a tool step that fails once then retries successfully, and writes both run summaries (`out/runs/<run_id>.json`) and append-only evidence (`out/evidence.jsonl`) that show failure and recovery. It’s a template for production automation: no silent failures, no blind retries, clear records, and ready for validation gates, circuit breakers, error taxonomies, and remediation playbooks.

**Temporal Executive Agent (`tea`)** — Deterministic long-horizon planner that turns tasks (with deps and due dates) into an ordered plan plus persistent state. Outputs `out/plan.md` (human-readable sequence) and `out/state.json` (machine-readable snapshot for delta planning). Uses simple heuristics (dependency ordering + due date priority) to stay auditable, with a path to expand into risk scoring, constraint reasoning, calendar-aware scheduling, and replanning while keeping the “plan + state” contract.

