EMSDK_DIR := /workspaces/.emsdk
EMSDK_ENV := . $(EMSDK_DIR)/emsdk_env.sh

SRC := main.c
OUT := index.html

.PHONY: all build run clean

all: build

build: $(OUT)

$(OUT): $(SRC)
	@echo "Sourcing emsdk and building..."
	@$(EMSDK_ENV) && emcc $(SRC) -s USE_SDL=2 -o $(OUT)

run: build
	@echo "Serving on port 8080 (http://localhost:8080 in the Codespaces browser)..."
	python3 -m http.server 8080

clean:
	rm -f index.html index.js index.wasm
