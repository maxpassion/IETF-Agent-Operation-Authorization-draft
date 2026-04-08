# AOA IETF Internet-Drafts

Agent Operation Authorization (AOA) specification drafts for IETF standardization.

## Background

The AOA (Agent Operation Authorization) framework provides standardized protocols for agent authorization in OAuth 2.0 ecosystems. These drafts address emerging security requirements for AI agent interactions, cross-domain delegation, and cryptographic evidence binding.

> **Note on Agent Identity**: AOA does not define new authentication mechanisms for agents. Instead, it treats agent identity as workload identity, leveraging [WIMSE](https://datatracker.ietf.org/group/wimse/about/) (Workload Identity in Multi-System Environments) for authentication. This design choice enables seamless integration with existing infrastructure while focusing AOA on the authorization layer.
>
> **Optional: Trusted Execution Environment Verification**: For deployments requiring hardware-level assurance of agent integrity, [WIT Attestation](https://www.ietf.org/archive/id/draft-liu-wimse-wit-attestation-00.txt) can be used alongside WIMSE to embed remote attestation evidence (e.g., Intel TDX, AMD SEV-SNP measurements) in workload identity tokens. This provides cryptographic proof that the agent is running in a trusted environment, complementing AOA's authorization decisions with runtime integrity verification.


> **Progressive Deployment**: AOA supports progressive deployment through a two-dimensional matrix:
> - **Identity Levels**: Self-Issued (Level 0) → WIMSE (Level 1) → Enterprise IdP (Level 2)
> - **Token Levels**: Pre-configured (A) → Admin-assigned (B) → Runtime AOA (C)
> 
> This allows organizations to start simple (e.g., Level 0A for personal or small-team agents) and gradually upgrade to full AOA (Level 2C for enterprise production) based on their security requirements.


## Draft Relationships Overview

The AOA framework consists of multiple interconnected IETF drafts, each addressing specific aspects of agent authorization:

| # | Draft Name | Purpose |
|---|------------|---------|
| 1 | [JWT Grant Interaction Response](#1-jwt-grant-interaction-response) | JWT authorization grants with user interaction, consent, and cross-domain agent-user identity binding |
| 2 | [OAuth Rego Policy](#2-oauth-rego-policy) | Policy-based authorization using Rego language |
| 3 | [OAuth Authorization Evidence](#3-oauth-authorization-evidence) | Defines evidence for OAuth authorization decisions |
| 4 | [OAuth Chain Delegation](#4-oauth-chain-delegation) | Multi-hop delegation with cryptographic binding |
| 5 | [AI Agent Authorization Integration](#5-ai-agent-authorization-integration) | Integrates all mechanisms for AI agent scenarios |



---

## Available Drafts


---

## 1. JWT Grant Interaction Response

**Draft**: [draft-parecki-oauth-jwt-grant-interaction-response-00](https://datatracker.ietf.org/doc/html/draft-parecki-oauth-jwt-grant-interaction-response-00)

- **IETF Datatracker**: https://datatracker.ietf.org/doc/html/draft-parecki-oauth-jwt-grant-interaction-response-00

**Authors**: Aaron Parecki, Brian Campbell, Dapeng Liu

**Purpose**: Extends the JWT Authorization Grant (RFC 7523) to support user interaction, explicit consent flows, and cross-domain agent-user identity binding. This mechanism enables scenarios where an AI agent acting on behalf of a user needs to obtain authorization from an external authorization server, with user approval when required. The draft defines the `interaction_required` error response, the interaction flow for obtaining user consent, and the use of JWT assertions for cross-domain identity verification.



---

## 2. OAuth Rego Policy

**Draft**: [draft-liu-oauth-rego-policy-00](https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-oauth-rego-policy-00.html)

- **HTML**: https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-oauth-rego-policy-00.html

- **XML Source**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/blob/main/source-xml/draft-liu-oauth-rego-policy-00.xml

**Purpose**: Integrates Open Policy Agent (OPA) Rego language for flexible, declarative policy evaluation in OAuth authorization servers. Supports complex authorization logic including evidence validation and delegation chain verification.

---

## 3. OAuth Authorization Evidence

**Draft**: [draft-liu-oauth-authorization-evidence-00](https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-oauth-authorization-evidence-00.html)

- **HTML**: https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-oauth-authorization-evidence-00.html

- **XML Source**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/blob/main/source-xml/draft-liu-oauth-authorization-evidence-00.xml

**Purpose**: Defines the foundational evidence types required for making informed authorization decisions in agent-to-agent interactions. Establishes the base layer for trust establishment.

---

## 4. OAuth Chain Delegation

**Draft**: [draft-liu-oauth-chain-delegation-00](https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-oauth-chain-delegation-00.html)

- **HTML**: https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-oauth-chain-delegation-00.html

- **XML Source**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/blob/main/source-xml/draft-liu-oauth-chain-delegation-00.xml

**Purpose**: Enables secure multi-hop delegation chains with cryptographic binding between each hop. Extends OAuth 2.0 to support transitive authorization relationships in agent ecosystems.

---

### 5. AI Agent Authorization Integration

**Draft**: [draft-liu-ai-agent-authorization-integration-00](https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-ai-agent-authorization-integration-00.html)

- **HTML**: https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/drafts/html/draft-liu-ai-agent-authorization-integration-00.html

- **XML Source**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/blob/main/source-xml/draft-liu-ai-agent-authorization-integration-00.xml

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
