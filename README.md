# AOA IETF Internet-Drafts

Agent Operation Authorization (AOA) specification drafts for IETF standardization.

## 📄 Available Drafts

### 1. Agent Operation Authorization Protocol

**Draft**: [draft-liu-agent-operation-authorization-00](https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-agent-operation-authorization-00.html)

- **HTML**: https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-agent-operation-authorization-00.html
- **TXT**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/tree/main/drafts/txt/draft-liu-agent-operation-authorization-00.txt
- **XML Source**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/tree/main/source-xml/draft-liu-agent-operation-authorization-00.xml

---

### 2. AI Agent Authorization Integration

**Draft**: [draft-liu-ai-agent-authorization-integration-00](https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-ai-agent-authorization-integration-00.html)

- **HTML**: https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-ai-agent-authorization-integration-00.html
- **TXT**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/tree/main/drafts/txt/draft-liu-ai-agent-authorization-integration-00.txt
- **XML Source**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/tree/main/source-xml/draft-liu-ai-agent-authorization-integration-00.xml

---

### 3. OAuth Authorization Evidence

**Draft**: [draft-liu-oauth-authorization-evidence-00](https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-oauth-authorization-evidence-00.html)

- **HTML**: https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-oauth-authorization-evidence-00.html
- **TXT**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/tree/main/drafts/txt/draft-liu-oauth-authorization-evidence-00.txt
- **XML Source**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/tree/main/source-xml/draft-liu-oauth-authorization-evidence-00.xml

---

### 4. OAuth Chain Delegation

**Draft**: [draft-liu-oauth-chain-delegation-00](https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-oauth-chain-delegation-00.html)

- **HTML**: https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-oauth-chain-delegation-00.html
- **TXT**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/tree/main/drafts/txt/draft-liu-oauth-chain-delegation-00.txt
- **XML Source**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/tree/main/source-xml/draft-liu-oauth-chain-delegation-00.xml

---

### 5. OAuth Cross-Domain ID Token Hint

**Draft**: [draft-liu-oauth-cross-domain-id-token-hint-00](https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-oauth-cross-domain-id-token-hint-00.html)

- **HTML**: https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-oauth-cross-domain-id-token-hint-00.html
- **TXT**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/tree/main/drafts/txt/draft-liu-oauth-cross-domain-id-token-hint-00.txt
- **XML Source**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/tree/main/source-xml/draft-liu-oauth-cross-domain-id-token-hint-00.xml

---

### 6. OAuth Rego Policy

**Draft**: [draft-liu-oauth-rego-policy-00](https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-oauth-rego-policy-00.html)

- **HTML**: https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-oauth-rego-policy-00.html
- **TXT**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/tree/main/drafts/txt/draft-liu-oauth-rego-policy-00.txt
- **XML Source**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/tree/main/source-xml/draft-liu-oauth-rego-policy-00.xml

---

## 🏗️ Build System

This repository uses automated CI/CD to build HTML and TXT artifacts from XML sources.

### Directory Structure

```
IETF-Agent-Operation-Authorization-draft/
├── source-xml/           # XML source files (authoritative)
│   └── *.xml
├── drafts/
│   ├── html/            # Generated HTML files (viewable in browser)
│   │   └── *.html
│   └── txt/             # Generated TXT files (plain text format)
│       └── *.txt
└── Makefile             # Build automation
```

### Local Build

```bash
# Build all formats
make all

# Build HTML only
make html

# Build TXT only
make txt

# Clean generated files
make clean
```

### Requirements

- Python 3.x
- xml2rfc package (`pip install xml2rfc`)

## 📚 Background

The AOA (Agent Operation Authorization) framework provides standardized protocols for agent-to-agent authorization in OAuth 2.0 ecosystems. These drafts address emerging security requirements for AI agent interactions, cross-domain delegation, and cryptographic evidence binding.

## 🤝 Contributing

These are active IETF Internet-Drafts. For collaboration guidelines, please refer to the IETF working group processes.

## 📄 License

These documents are IETF Internet-Drafts subject to IETF Trust provisions (BCP 78).

---

**🔗 Main Repository**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft
