# AOA IETF Internet-Drafts

Agent Operation Authorization (AOA) specification drafts for IETF standardization.

## 📚 Background

The AOA (Agent Operation Authorization) framework provides standardized protocols for agent-to-agent authorization in OAuth 2.0 ecosystems. These drafts address emerging security requirements for AI agent interactions, cross-domain delegation, and cryptographic evidence binding.


## 📚 Draft Relationships Overview

The AOA framework consists of multiple interconnected IETF drafts, each addressing specific aspects of agent authorization:

| # | Draft Name | Purpose |
|---|------------|---------||
| 1 | [OAuth Cross-Domain ID Token Hint](#1-oauth-cross-domain-id-token-hint) | Cross-domain user identity binding via ID tokens |
| 2 | [OAuth Rego Policy](#2-oauth-rego-policy) | Policy-based authorization using Rego language |
| 3 | [OAuth Authorization Evidence](#3-oauth-authorization-evidence) | Defines evidence requirements for OAuth authorization decisions |
| 4 | [OAuth Chain Delegation](#4-oauth-chain-delegation) | Multi-hop delegation with cryptographic binding |
| 5 | [AI Agent Authorization Integration](#5-ai-agent-authorization-integration) | Integrates all mechanisms for AI agent scenarios |



---

## 📄 Available Drafts


---

## 1. OAuth Cross-Domain ID Token Hint

**Draft**: [draft-liu-oauth-cross-domain-id-token-hint-00](https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-oauth-cross-domain-id-token-hint-00.html)

- **HTML**: https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-oauth-cross-domain-id-token-hint-00.html

- **XML Source**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/tree/main/source-xml/draft-liu-oauth-cross-domain-id-token-hint-00.xml

**Purpose**: Provides cross-domain identity binding mechanism using ID Token hints, enabling seamless user identity mapping across different trust domains during agent-mediated interactions.

---

## 2. OAuth Rego Policy

**Draft**: [draft-liu-oauth-rego-policy-00](https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-oauth-rego-policy-00.html)

- **HTML**: https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-oauth-rego-policy-00.html

- **XML Source**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/tree/main/source-xml/draft-liu-oauth-rego-policy-00.xml

**Purpose**: Integrates Open Policy Agent (OPA) Rego language for flexible, declarative policy evaluation in OAuth authorization servers. Supports complex authorization logic including evidence validation and delegation chain verification.

---

## 3. OAuth Authorization Evidence

**Draft**: [draft-liu-oauth-authorization-evidence-00](https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-oauth-authorization-evidence-00.html)

- **HTML**: https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-oauth-authorization-evidence-00.html

- **XML Source**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/tree/main/source-xml/draft-liu-oauth-authorization-evidence-00.xml

**Purpose**: Defines the foundational evidence types required for making informed authorization decisions in agent-to-agent interactions. Establishes the base layer for trust establishment.

---

## 4. OAuth Chain Delegation

**Draft**: [draft-liu-oauth-chain-delegation-00](https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-oauth-chain-delegation-00.html)

- **HTML**: https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-oauth-chain-delegation-00.html

- **XML Source**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/tree/main/source-xml/draft-liu-oauth-chain-delegation-00.xml

**Purpose**: Enables secure multi-hop delegation chains with cryptographic binding between each hop. Extends OAuth 2.0 to support transitive authorization relationships in agent ecosystems.

---

### 5. AI Agent Authorization Integration

**Draft**: [draft-liu-ai-agent-authorization-integration-00](https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-ai-agent-authorization-integration-00.html)

- **HTML**: https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-ai-agent-authorization-integration-00.html

- **XML Source**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/tree/main/source-xml/draft-liu-ai-agent-authorization-integration-00.xml

**Purpose**: Comprehensive integration framework that combines all AOA mechanisms for AI agent authorization scenarios. This is the top-level specification that orchestrates evidence collection, chain delegation, cross-domain identity binding, and policy enforcement.

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


---

**🔗 Main Repository**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft
