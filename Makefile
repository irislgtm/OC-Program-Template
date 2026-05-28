.PHONY: all lint lint-ci test clean manifest

LUA ?= lua
LUACHECK ?= luacheck
PUBLISH_DIR ?= src

all: lint

lint:
	$(LUACHECK) src/ test/

lint-ci:
	$(LUACHECK) -q src/ test/

manifest:
	@echo "-- auto-generated" > $(PUBLISH_DIR)/manifest.lua
	@echo "return {" >> $(PUBLISH_DIR)/manifest.lua
	@first=1; \
	find $(PUBLISH_DIR) -type f ! -name manifest.lua | sort | while read f; do \
	  path=$${f#$(PUBLISH_DIR)}; \
	  size=$$(stat -c%s "$$f" 2>/dev/null || stat -f%z "$$f" 2>/dev/null); \
	  if [ "$$first" = "0" ]; then echo "," >> $(PUBLISH_DIR)/manifest.lua; fi; \
	  first=0; \
	  printf '  {path="%s",size=%s}' "$$path" "$$size" >> $(PUBLISH_DIR)/manifest.lua; \
	done
	@echo "" >> $(PUBLISH_DIR)/manifest.lua
	@echo "}" >> $(PUBLISH_DIR)/manifest.lua
	@echo "manifest.lua generated"

test:
	$(LUA) test/test_example.lua

clean:
	rm -f src/manifest.lua
	find . -name "*.out" -delete
	find . -name "*.log" -delete
