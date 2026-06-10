# AOA IETF Internet-Drafts

Agent Operation Authorization (AOA) specification drafts for IETF standardization.

## Background

The AOA (Agent Operation Authorization) framework defines a suite of protocols for securing AI agent operations within OAuth 2.0 ecosystems. It addresses agent identity, delegated authorization, fine-grained policy-based access control using the Rego policy language, and cryptographic evidence binding — enabling agents to operate autonomously while remaining under user-authorized boundaries.

> **Note on Agent Identity**: AOA does not define new authentication mechanisms for agents. Instead, it treats agent identity as workload identity, leveraging [WIMSE](https://datatracker.ietf.org/group/wimse/about/) (Workload Identity in Multi-System Environments) for authentication. This design choice enables seamless integration with existing infrastructure while focusing AOA on the authorization layer.
>
> **Optional: Trusted Execution Environment Verification**: For deployments requiring hardware-level assurance of agent integrity, [WIT Attestation](https://www.ietf.org/archive/id/draft-liu-wimse-wit-attestation-00.txt) can be used alongside WIMSE to embed remote attestation evidence (e.g., TEE technologies such as TDX and SEV-SNP) in workload identity tokens. This provides cryptographic proof that the agent is running in a trusted environment, complementing AOA's authorization decisions with runtime integrity verification.


## Progressive Deployment

AOA supports **progressive deployment** through a two-dimensional matrix, allowing organizations to adopt capabilities gradually based on their security requirements and operational maturity.

### Deployment Levels

| Dimension | Level 0 / A | Level 1 / B | Level 2 / C |
|-----------|-------------|-------------|-------------|
| **Identity** | Self-Issued | WIMSE | Enterprise IdP |
| **Token** | Pre-configured | Admin-assigned | Runtime AOA |

### Example Progression

- **Level 0A**: Personal or small-team agents (self-issued identity, pre-configured tokens)
- **Level 2C**: Enterprise production (enterprise IdP, full runtime AOA with user consent)

Organizations can start at any level and upgrade as requirements evolve.


## Draft Relationships Overview

The AOA framework consists of multiple interconnected IETF drafts, each addressing specific aspects of agent authorization:

| # | Draft Name | Version | Purpose |
|---|------------|---------|---------|
| 1 | [JWT Grant Interaction Response](#1-jwt-grant-interaction-response) | -00 | JWT authorization grants with user interaction, consent, and cross-domain agent-user identity binding |
| 2 | [OAuth Rego Policy](#2-oauth-rego-policy) | -00 | Behavioral authorization using Rego policy language with reverse-guided authorization |
| 3 | [OAuth Authorization Evidence](#3-oauth-authorization-evidence) | -00 | Authorization evidence and audit trail claims for OAuth 2.0 access tokens |
| 4 | [OAuth Chain Delegation](#4-oauth-chain-delegation) | -01 | Multi-hop delegation chains with cryptographic binding and evidence propagation |
| 5 | [AI Agent Authorization Integration](#5-ai-agent-authorization-integration) | -00 | Integration framework with progressive deployment matrix and reverse-guided authorization |



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

**Draft**: [draft-liu-oauth-rego-policy-00](https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/draft-liu-oauth-rego-policy-00.html)

- **HTML**: https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/draft-liu-oauth-rego-policy-00.html

- **XML Source**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/blob/main/source-xml/draft-liu-oauth-rego-policy-00.xml

**Purpose**: Integrates Open Policy Agent (OPA) Rego language for flexible, declarative policy evaluation in OAuth authorization servers. Supports complex authorization logic including evidence validation and delegation chain verification.

---

## 3. OAuth Authorization Evidence

**Draft**: [draft-liu-oauth-authorization-evidence-00](https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/draft-liu-oauth-authorization-evidence-00.html)

- **HTML**: https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/draft-liu-oauth-authorization-evidence-00.html

- **XML Source**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/blob/main/source-xml/draft-liu-oauth-authorization-evidence-00.xml

**Purpose**: Defines two JWT claims (`evidence` and `audit_trail`) for OAuth 2.0 access tokens. The `evidence` claim provides cryptographic proof of user consent with a signed confirmation record. The `audit_trail` claim enables semantic traceability from user intent to authorized operations. Includes a consent-to-evidence collection pipeline with JAG-IR as a concrete example, token exchange propagation strategies (Propagate / Reference / Omit), and GDPR/CCPA retention guidance.

---

## 4. OAuth Chain Delegation

**Draft**: [draft-liu-oauth-chain-delegation-01](https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/draft-liu-oauth-chain-delegation-01.html)

- **HTML**: https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/draft-liu-oauth-chain-delegation-01.html

- **XML Source**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/blob/main/source-xml/draft-liu-oauth-chain-delegation-01.xml

**Purpose**: Enables secure multi-hop delegation chains with cryptographic binding between each hop. Extends OAuth 2.0 to support transitive authorization relationships in agent ecosystems.

---

### 5. AI Agent Authorization Integration

**Draft**: [draft-liu-ai-agent-authorization-integration-00](https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/draft-liu-ai-agent-authorization-integration-00.html)

- **HTML**: https://maxpassion.github.io/IETF-Agent-Operation-Authorization-draft/draft-liu-ai-agent-authorization-integration-00.html

- **XML Source**: https://github.com/maxpassion/IETF-Agent-Operation-Authorization-draft/blob/main/source-xml/draft-liu-ai-agent-authorization-integration-00.xml

**Purpose**: Comprehensive integration framework that combines all AOA mechanisms for AI agent authorization scenarios. Defines a progressive deployment matrix (3 identity levels × 3 token levels), reverse-guided authorization where resource servers guide agents toward valid authorization, and profiles the complete 15-step authorization workflow. This is the top-level Informational specification that orchestrates evidence collection, chain delegation, cross-domain identity binding, and policy enforcement without defining new protocol mechanisms.

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
