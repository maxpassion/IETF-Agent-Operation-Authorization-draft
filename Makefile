# IETF Draft Build System
# XML source: source-xml/ -> HTML/TXT output: drafts/

XML_FILES = $(wildcard source-xml/*.xml)
HTML_DIR = drafts/html
TXT_DIR = drafts/txt

.PHONY: all clean html txt

all: html txt

html: $(patsubst source-xml/%.xml,$(HTML_DIR)/%.html,$(XML_FILES))

txt: $(patsubst source-xml/%.xml,$(TXT_DIR)/%.txt,$(XML_FILES))

$(HTML_DIR)/%.html: source-xml/%.xml
	@mkdir -p $(HTML_DIR)
	xml2rfc --v3 $< --html -o $@

$(TXT_DIR)/%.txt: source-xml/%.xml
	@mkdir -p $(TXT_DIR)
	xml2rfc --v3 $< --text -o $@

clean:
	rm -rf $(HTML_DIR)/*.html $(TXT_DIR)/*.txt
