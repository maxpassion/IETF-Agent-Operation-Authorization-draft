# AOA IETF Internet-Drafts

Agent Operation Authorization (AOA) specification drafts for IETF standardization.

## 📚 Draft Relationships Overview

The AOA framework consists of multiple interconnected IETF drafts, each addressing specific aspects of agent authorization:

| # | Draft Name | Category | Purpose | Dependencies |
|---|------------|----------|---------|--------------|
| 1 | [OAuth Authorization Evidence](#2-oauth-authorization-evidence) | Foundation | Defines evidence requirements for OAuth authorization decisions | — |
| 2 | [OAuth Chain Delegation](#3-oauth-chain-delegation) | Core Protocol | Multi-hop delegation with cryptographic binding | Evidence |
| 3 | [OAuth Cross-Domain ID Token Hint](#4-oauth-cross-domain-id-token-hint) | Identity Binding | Cross-domain user identity binding via ID tokens | Evidence |
| 4 | [OAuth Rego Policy](#5-oauth-rego-policy) | Policy Engine | Policy-based authorization using Rego language | Evidence, Delegation |
| 5 | [AI Agent Authorization Integration](#1-ai-agent-authorization-integration) | Integration | Integrates all mechanisms for AI agent scenarios | All above |

### Architecture Flow

```
┌─────────────────────────────────────────────────────────────┐
│                    AI Agent Scenarios                        │
│              (draft-ai-agent-authorization)                  │
└─────────────────────────────────────────────────────────────┘
                              ▲
                              │ Uses
        ┌─────────────────────┼─────────────────────┐
        │                     │                     │
        │                     │                     │
┌───────┴────────┐   ┌────────┴────────┐  ┌────────┴────────┐
│ Chain          │   │ Cross-Domain    │  │ Rego Policy     │
│ Delegation     │   │ ID Token Hint   │  │                 │
│                │   │                 │  │                 │
└────────────────┘   └─────────────────┘  └─────────────────┘
        ▲                     ▲                     ▲
        │                     │                     │
        └─────────────────────┴─────────────────────┘
                              │
                    ┌─────────┴──────────┐
                    │ Authorization      │
                    │ Evidence           │
                    │ (Foundation)       │
                    └────────────────────┘
```

---

## 📄 Available Drafts

### 1. AI Agent Authorization Integration

**Draft**: [draft-liu-ai-agent-authorization-integration-00](https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-ai-agent-authorization-integration-00.html)

- **HTML**: https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-ai-agent-authorization-integration-00.html
- **TXT**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/tree/main/drafts/txt/draft-liu-ai-agent-authorization-integration-00.txt
- **XML Source**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/tree/main/source-xml/draft-liu-ai-agent-authorization-integration-00.xml

**Purpose**: Comprehensive integration framework that combines all AOA mechanisms for AI agent authorization scenarios. This is the top-level specification that orchestrates evidence collection, chain delegation, cross-domain identity binding, and policy enforcement.

---

### 2. OAuth Authorization Evidence

**Draft**: [draft-liu-oauth-authorization-evidence-00](https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-oauth-authorization-evidence-00.html)

- **HTML**: https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-oauth-authorization-evidence-00.html
- **TXT**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/tree/main/drafts/txt/draft-liu-oauth-authorization-evidence-00.txt
- **XML Source**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/tree/main/source-xml/draft-liu-oauth-authorization-evidence-00.xml

**Purpose**: Defines the foundational evidence types required for making informed authorization decisions in agent-to-agent interactions. Establishes the base layer for trust establishment.

---

### 3. OAuth Chain Delegation

**Draft**: [draft-liu-oauth-chain-delegation-00](https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-oauth-chain-delegation-00.html)

- **HTML**: https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-oauth-chain-delegation-00.html
- **TXT**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/tree/main/drafts/txt/draft-liu-oauth-chain-delegation-00.txt
- **XML Source**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/tree/main/source-xml/draft-liu-oauth-chain-delegation-00.xml

**Purpose**: Enables secure multi-hop delegation chains with cryptographic binding between each hop. Extends OAuth 2.0 to support transitive authorization relationships in agent ecosystems.

---

### 4. OAuth Cross-Domain ID Token Hint

**Draft**: [draft-liu-oauth-cross-domain-id-token-hint-00](https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-oauth-cross-domain-id-token-hint-00.html)

- **HTML**: https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-oauth-cross-domain-id-token-hint-00.html
- **TXT**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/tree/main/drafts/txt/draft-liu-oauth-cross-domain-id-token-hint-00.txt
- **XML Source**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/tree/main/source-xml/draft-liu-oauth-cross-domain-id-token-hint-00.xml

**Purpose**: Provides cross-domain identity binding mechanism using ID Token hints, enabling seamless user identity mapping across different trust domains during agent-mediated interactions.

---

### 5. OAuth Rego Policy

**Draft**: [draft-liu-oauth-rego-policy-00](https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-oauth-rego-policy-00.html)

- **HTML**: https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-oauth-rego-policy-00.html
- **TXT**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/tree/main/drafts/txt/draft-liu-oauth-rego-policy-00.txt
- **XML Source**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/tree/main/source-xml/draft-liu-oauth-rego-policy-00.xml

**Purpose**: Integrates Open Policy Agent (OPA) Rego language for flexible, declarative policy evaluation in OAuth authorization servers. Supports complex authorization logic including evidence validation and delegation chain verification.

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
