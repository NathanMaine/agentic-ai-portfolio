#!/usr/bin/env bash
set -euo pipefail

mkdir -p tools

clone_or_update () {
  local name="$1"
  local url="$2"
  if [[ -d "tools/$name/.git" ]]; then
    echo "🔄 updating tools/$name"
    git -C "tools/$name" pull --ff-only
  else
    echo "⬇️  cloning $name"
    git clone "$url" "tools/$name"
  fi
}

clone_or_update agentic-evaluation-sandbox https://github.com/NathanMaine/agentic-evaluation-sandbox.git
clone_or_update governance-graph-compiler https://github.com/NathanMaine/governance-graph-compiler.git
clone_or_update agentic-memory-graph-engine https://github.com/NathanMaine/agentic-memory-graph-engine.git
clone_or_update self-healing-agentic-workflows https://github.com/NathanMaine/self-healing-agentic-workflows.git
clone_or_update temporal-executive-agent https://github.com/NathanMaine/temporal-executive-agent.git

echo "✅ tools ready in ./tools"
