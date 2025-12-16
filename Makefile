VENV=.venv
PY=$(VENV)/bin/python
PIP=$(VENV)/bin/pip

setup:
	./scripts/clone_tools.sh

venv:
	python3 -m venv $(VENV)
	$(PIP) install --upgrade pip

install: venv setup
	$(PIP) install -e "tools/agentic-evaluation-sandbox[dev]"
	$(PIP) install -e "tools/governance-graph-compiler[dev]"
	$(PIP) install -e "tools/agentic-memory-graph-engine[dev]"
	$(PIP) install -e "tools/self-healing-agentic-workflows[dev]"
	$(PIP) install -e "tools/temporal-executive-agent[dev]"

test: install
	cd tools/agentic-evaluation-sandbox && $(PY) -m pytest -q
	cd tools/governance-graph-compiler && $(PY) -m pytest -q
	cd tools/agentic-memory-graph-engine && $(PY) -m pytest -q
	cd tools/self-healing-agentic-workflows && $(PY) -m pytest -q
	cd tools/temporal-executive-agent && $(PY) -m pytest -q

demo: install
	cd tools/agentic-evaluation-sandbox && $(PY) -m aes.cli run --scenario scenarios/example.yaml --out out
	cd tools/governance-graph-compiler && $(PY) -m ggc.cli compile --policy policies/example.md --out out
	cd tools/agentic-memory-graph-engine && $(PY) -m amg.cli ingest --events examples/meeting.json --out out
	cd tools/self-healing-agentic-workflows && $(PY) -m shaw.cli run --workflow workflows/example.yaml --out out
	cd tools/temporal-executive-agent && $(PY) -m tea.cli plan --tasks tasks/sample.json --out out

.PHONY: setup venv install test demo
