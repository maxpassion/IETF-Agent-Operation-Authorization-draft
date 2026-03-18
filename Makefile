# AOA IETF Drafts - Build System
# XML-first workflow for IETF collaboration

XML_DIR = drafts/xml
OUTPUT_HTML_DIR = output/html
OUTPUT_TXT_DIR = output/txt

DRAFTS = 01-cross-domain-id-token-hint 02-authorization-evidence 03-chain-delegation 04-rego-policy 05-integration

.PHONY: all clean help validate html txt build-all

all: build-all
	@echo "✅ All drafts built successfully!"
	@echo "📅 Build time: $(shell date)"

build-all: html txt
	@echo "✅ HTML and TXT versions generated"

html: $(foreach d,$(DRAFTS),$(OUTPUT_HTML_DIR)/draft-liu-oauth-$(d)-00.html)
	@echo "✅ HTML drafts ready"

txt: $(foreach d,$(DRAFTS),$(OUTPUT_TXT_DIR)/draft-liu-oauth-$(d)-00.txt)
	@echo "✅ TXT drafts ready"

$(OUTPUT_HTML_DIR)/draft-liu-oauth-%-00.html: $(XML_DIR)/draft-liu-oauth-%-00.xml
	@echo "Building HTML: $@"
	@mkdir -p $(OUTPUT_HTML_DIR)
	@xml2rfc --v3 $< --html -o $@

$(OUTPUT_TXT_DIR)/draft-liu-oauth-%-00.txt: $(XML_DIR)/draft-liu-oauth-%-00.xml
	@echo "Building TXT: $@"
	@mkdir -p $(OUTPUT_TXT_DIR)
	@xml2rfc --v3 $< --text -o $@

validate:
	@echo "Validating XML files..."
	@for xml in $(wildcard $(XML_DIR)/*.xml); do \
		if [ -f "$$xml" ]; then \
			xml2rfc --v3 $$xml --check 2>&1 | head -20 || true; \
		fi; \
	done

clean:
	@rm -rf $(OUTPUT_HTML_DIR)/*.html $(OUTPUT_TXT_DIR)/*.txt

help:
	@echo "Targets:"
	@echo "  all      - Build all formats (HTML, TXT from XML)"
	@echo "  html     - Generate HTML versions from XML"
	@echo "  txt      - Generate TXT versions from XML"
	@echo "  validate - Validate XML syntax"
	@echo "  clean    - Remove generated files"
