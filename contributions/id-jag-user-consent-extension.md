# Proposed Extension to ID-JAG: User Consent Mode

**Target Document:** draft-ietf-oauth-identity-assertion-authz-grant

**Authors:** Dapeng Liu, Hongru Zhu, Suresh Krishnan

**Status:** Contribution proposal for discussion with ID-JAG authors

---

## Overview

This document proposes an extension to the Identity Assertion JWT Authorization Grant (ID-JAG) to support scenarios requiring explicit user consent before token issuance. This extension is particularly relevant for AI agent authorization, where users must explicitly approve the operations an agent can perform on their behalf.

### Motivation

The current ID-JAG specification states that it "grants a client delegated access to a resource in another trust domain on behalf of a user **without a direct user-approval step** at the authorization server."

However, certain scenarios require explicit user consent:

1. **AI Agent Authorization**: Autonomous agents acting on behalf of users need explicit consent for specific operations, not just identity verification.

2. **High-Risk Operations**: Financial transactions, data deletion, or other sensitive operations may require step-up consent even when identity is already verified.

3. **Compliance Requirements**: Regulatory frameworks (GDPR, etc.) may require explicit, verifiable consent for certain data processing activities.

4. **Policy-Based Authorization**: Fine-grained authorization policies (e.g., "allow purchases up to $50") require user understanding and approval.

---

## Proposed Changes to ID-JAG

### New Section: User Consent Mode

Insert after Section 4 (Token Exchange Request at Resource Authorization Server):

```markdown
## User Consent Mode {#consent-mode}

In certain scenarios, the Resource Authorization Server (AS) MAY require 
explicit user consent before issuing an access token, even when a valid 
ID-JAG is presented. This section defines an OPTIONAL extension to support 
such scenarios.

### When to Require User Consent

The Resource AS MAY require user consent when:

1. The requested authorization includes high-risk operations (e.g., 
   financial transactions, data modification);
   
2. The client is an autonomous agent (identified by workload identity 
   such as SPIFFE ID) requesting authorization for specific operations;
   
3. The authorization request includes `authorization_details` (RAR) that 
   require explicit user approval;
   
4. Policy or regulatory requirements mandate explicit consent.

The decision to require consent is at the discretion of the Resource AS 
based on its security policy and the nature of the authorization request.

### Consent Required Response

When the Resource AS determines that user consent is required, it responds 
to the token exchange request with an HTTP 200 response containing the 
following parameters instead of an access token:

confirmation_uri:
: REQUIRED. A URL that the client MUST present to the user for consent.
  The URL is bound to the pending authorization session.

session_id:
: REQUIRED. An opaque identifier for the pending authorization session.
  The client uses this to correlate the consent callback with the 
  original request.

expires_in:
: REQUIRED. The lifetime in seconds of the consent session 
  (RECOMMENDED: 300 seconds).

redirect_uri:
: OPTIONAL. The URI to which the AS will redirect after user consent.
  If not provided, the client MUST have a pre-registered redirect URI.

Example response:

~~~json
HTTP/1.1 200 OK
Content-Type: application/json

{
  "confirmation_uri": "https://as.example.com/consent?session=xyz789",
  "session_id": "session_abc123xyz",
  "expires_in": 300,
  "redirect_uri": "https://agent.example.com/callback"
}
~~~

### User Consent Flow

Upon receiving a consent required response, the client:

1. Redirects the user's browser to the `confirmation_uri`, including a 
   `state` parameter for CSRF protection:

   ~~~
   HTTP/1.1 302 Found
   Location: https://as.example.com/consent?session=xyz789
             &state=af0ifjsldkj
             &redirect_uri=https://agent.example.com/callback
   ~~~

2. The AS presents a consent interface to the user displaying:
   
   - The client's identity (verified through client authentication);
   - The requested operations (derived from `scope` or `authorization_details`);
   - The resource server being accessed;
   - The duration of the authorization.

3. Upon user approval, the AS redirects to the `redirect_uri` with an 
   authorization code:

   ~~~
   HTTP/1.1 302 Found
   Location: https://agent.example.com/callback
             ?code=SplxlOBeZQQYbYS6WxSbIA
             &state=af0ifjsldkj
   ~~~

4. The client exchanges the authorization code for an access token using 
   the standard token endpoint.

### Differences from Device Authorization Grant

This consent flow differs from the Device Authorization Grant (RFC 8628):

| Aspect | Device Flow (RFC 8628) | ID-JAG Consent Mode |
|--------|------------------------|---------------------|
| Use case | Input-constrained devices | Agents with browser access |
| User interaction | Enter code on separate device | Direct redirect to consent page |
| Token retrieval | Polling | Standard authorization code callback |
| Latency | High (polling interval) | Low (immediate callback) |

### Security Considerations for Consent Mode

When implementing user consent mode:

1. **Confirmation URI Binding**: The `confirmation_uri` MUST be bound to 
   the authenticated client's identity to prevent session hijacking.

2. **Single-Use Sessions**: The consent session MUST be single-use. Once 
   the user completes consent (approve or deny), the session MUST be 
   invalidated.

3. **Short Expiry**: Consent sessions SHOULD expire within 5 minutes to 
   limit the window for attacks.

4. **State Parameter**: Clients MUST use the `state` parameter to prevent 
   CSRF attacks during the redirect flow.

5. **HTTPS Required**: The `confirmation_uri` MUST use HTTPS.

### Consent Evidence

When user consent mode is used, the AS SHOULD record consent evidence 
including:

- Timestamp of user consent;
- The authorization details that were displayed to the user;
- The user's action (approved/denied);
- Client identity.

This evidence MAY be included in the access token or made available 
through token introspection for audit purposes. See 
[I-D.liu-oauth-authorization-evidence] for a detailed specification of 
authorization evidence claims.
```

---

## New ID-JAG Claims for Consent Mode

Add to Section 3.1 (ID-JAG Claims):

```markdown
consent_required:
: OPTIONAL - A boolean value. When `true`, indicates that the IdP 
  Authorization Server has determined that explicit user consent 
  SHOULD be obtained by the Resource AS before issuing an access token.
  This is a hint to the Resource AS; the Resource AS makes the final 
  decision based on its own policy.
```

---

## Token Response Extensions

Add to Section 5 (Token Response):

```markdown
### Consent Evidence in Token Response

When user consent was obtained through the consent mode flow, the token 
response MAY include:

evidence_ref:
: OPTIONAL. A reference identifier for the consent evidence record.
  The full evidence can be retrieved through token introspection.

Example token response with evidence:

~~~json
{
  "access_token": "eyJhbGciOiJSUzI1NiJ9...",
  "token_type": "Bearer",
  "expires_in": 3600,
  "evidence_ref": "evidence-xyz"
}
~~~
```

---

## Authorization Server Metadata

Add to AS Metadata section:

```markdown
### Consent Mode Metadata

Authorization servers supporting user consent mode SHOULD include the 
following metadata:

consent_endpoint:
: OPTIONAL. URL of the consent endpoint. If present, indicates the AS 
  supports user consent mode.

consent_modes_supported:
: OPTIONAL. JSON array of supported consent modes. Possible values:
  - `redirect`: Standard browser redirect consent flow
  - `ciba`: Out-of-band consent using CIBA

Example:

~~~json
{
  "issuer": "https://as.example.com",
  "token_endpoint": "https://as.example.com/token",
  "consent_endpoint": "https://as.example.com/consent",
  "consent_modes_supported": ["redirect", "ciba"]
}
~~~
```

---

## Complete Flow Diagram

```
+--------+     +--------+     +--------+     +--------+
|  User  |     | Client |     |  IdP   |     |   AS   |
|        |     | (Agent)|     |        |     |(Resource)
+--------+     +--------+     +--------+     +--------+
    |               |               |               |
(1) | Authenticate  |               |               |
    |-------------->|               |               |
    |               |               |               |
(2) |               | Token Exchange|               |
    |               | (get ID-JAG)  |               |
    |               |-------------->|               |
    |               |               |               |
(3) |               | ID-JAG        |               |
    |               |<--------------|               |
    |               |               |               |
(4) |               | Token Exchange|               |
    |               | (ID-JAG +     |               |
    |               |  authz_details)               |
    |               |------------------------------>|
    |               |               |               |
(5) |               |               |    Validate   |
    |               |               |    ID-JAG     |
    |               |               |               |
    |               |               |    Consent    |
    |               |               |    Required?  |
    |               |               |               |
(6) |               | confirmation_uri              |
    |               | + session_id  |               |
    |               |<------------------------------|
    |               |               |               |
(7) |<--------------| Redirect to   |               |
    |               | consent page  |               |
    |               |               |               |
(8) | Review &      |               |               |
    | Approve       |               |               |
    |-------------------------------------->|       |
    |               |               |               |
(9) |<--------------| Callback with |               |
    |               | auth code     |               |
    |               |               |               |
(10)|               | Exchange code |               |
    |               | for token     |               |
    |               |------------------------------>|
    |               |               |               |
(11)|               | Access Token  |               |
    |               | (+ evidence_ref)              |
    |               |<------------------------------|
```

---

## Relationship to Other Specifications

This extension is designed to work with:

- **Rich Authorization Requests (RFC 9396)**: The `authorization_details` 
  claim in ID-JAG can carry structured authorization requests that are 
  displayed to the user during consent.

- **CIBA (OpenID Connect CIBA)**: For scenarios where browser redirect is 
  not possible, the consent mode can be implemented using CIBA's 
  out-of-band authentication.

- **Authorization Evidence**: See [I-D.liu-oauth-authorization-evidence] 
  for detailed specification of evidence claims.

- **Rego Policy**: See [I-D.liu-oauth-rego-policy] for fine-grained 
  policy-based authorization that can be used with `authorization_details`.

---

## Questions for ID-JAG Authors

1. **Scope**: Should this extension be part of ID-JAG core, or a separate 
   profile document?

2. **Consent Evidence**: Should evidence claims be defined in ID-JAG or 
   remain in a separate specification?

3. **CIBA Support**: Should CIBA-based consent be included in this 
   extension or deferred?

4. **Policy Language**: Should ID-JAG recommend a specific policy language 
   for `authorization_details`, or remain agnostic?

---

## Next Steps

1. Review and discuss with Aaron Parecki, Brian Campbell, and Karl McGuinness
2. Submit as GitHub issue or PR to oauth-identity-assertion-authz-grant repo
3. Present at OAuth WG meeting if needed
4. Iterate based on feedback

---

*This document is a contribution proposal and not an official IETF document.*
