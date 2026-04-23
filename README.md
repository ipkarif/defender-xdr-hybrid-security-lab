\# Hybrid Security Operations Lab

\*\*Defender XDR + Sentinel + Security Copilot + Azure Policy\*\*



\## Project Overview



This project demonstrates a hybrid enterprise security lab built around Microsoft’s security ecosystem, combining on-premises Active Directory, Azure infrastructure, Microsoft 365, Defender XDR, Sentinel, Security Copilot, and policy-based governance.



The lab simulates a modern small-to-medium business environment with multiple departments, segmented networks, differentiated security controls, and centralized visibility for detection and response.



\## Project Goals



This lab was designed to demonstrate:



\- Hybrid identity and access management

\- Department-based security controls

\- Network segmentation and policy enforcement

\- Defender XDR incident visibility and investigation

\- Microsoft Sentinel SIEM integration and analytics

\- Security Copilot support for triage and investigation

\- Azure Policy, Defender for Cloud, and Azure Arc governance concepts

\- Practical mapping of controls to NIST Cybersecurity Framework functions



\## Project Context



This project was created as a hands-on security lab to demonstrate how a hybrid organization can implement practical controls across identity, endpoints, cloud resources, and monitoring platforms.



The focus is not just on tool deployment, but on showing how policy, segmentation, visibility, and response workflows come together in a realistic enterprise-style setup.



\## Environment Summary



The lab simulates a hybrid organization with:



\- On-premises Active Directory domain services

\- Azure virtual network with segmented subnets

\- Windows endpoints across multiple departments

\- Microsoft 365 integration for identity and collaboration

\- Defender XDR and Sentinel for detection and incident handling

\- Policy-based governance using Azure Policy and Defender for Cloud

\- Hybrid management concepts using Azure Arc



\## Department Security Model



The environment includes four departments, each with a different security posture.



| Department | Security Posture | Example Controls |

|-----------|------------------|------------------|

| IT | High privilege / monitored | Administrative access, audit logging |

| Finance | Restricted | Blocked non-business sites, tighter controls |

| HR | Sensitive data | USB restrictions, stricter protection |

| Marketing | More flexible | Broader web access, monitored usage |



\## Core Technologies



\- Windows Server / Active Directory

\- Group Policy

\- Microsoft Entra Connect

\- Microsoft 365

\- Microsoft Defender XDR

\- Microsoft Defender for Endpoint

\- Microsoft Sentinel

\- Security Copilot

\- Azure Policy

\- Defender for Cloud

\- Azure Arc

\- PowerShell

\- Azure CLI



\## Security Features Demonstrated



\- OU and user structure for role and department separation

\- Domain-joined systems and hybrid identity integration

\- Network segmentation with Azure subnets and NSGs

\- Department-based internet and device restrictions

\- Defender for Endpoint onboarding and validation

\- Web content filtering and endpoint policy enforcement

\- Sentinel analytics, KQL queries, and investigation workflows

\- Security Copilot prompts for incident analysis and query assistance

\- Azure Policy controls for governance and compliance

\- Defender for Cloud posture review and secure score improvement



\## Architecture



!\[Hybrid Security Lab Architecture](architecture/hybrid-security-lab-topology.png)



\## Repository Structure



\- `docs/lab-guide.md` – full technical walkthrough

\- `docs/setup-overview.md` – environment and deployment summary

\- `docs/governance-and-policy.md` – governance, policy, and compliance controls

\- `docs/detection-and-response.md` – Defender, Sentinel, and incident workflow

\- `docs/nist-mapping.md` – framework mapping

\- `scripts/ad-ou-user-setup.ps1` – Active Directory OU, user, and group setup

\- `scripts/azure-foundation-commands.txt` – Azure setup reference commands

\- `scripts/sentinel-kql-queries.txt` – sample KQL queries for Sentinel

\- `scripts/test-event-simulation.ps1` – safe lab event generation examples

\- `scripts/defender-validation.ps1` – validation checks for Defender and hybrid identity

\- `evidence/README.md` – notes for sanitized screenshots and proof points

\## Quick Start

1. Review `docs/setup-overview.md` for the environment design
2. Use `docs/lab-guide.md` for the full build sequence
3. Run scripts from the `scripts/` folder as needed in your lab environment
4. Validate onboarding, logging, and detections using the included PowerShell and KQL examples

\## NIST CSF Alignment



This lab maps to the NIST Cybersecurity Framework in a practical way:



\- \*\*Govern\*\* – policy assignments, compliance decisions, department-level control expectations

\- \*\*Identify\*\* – assets, users, departments, telemetry sources, and scope

\- \*\*Protect\*\* – segmentation, access control, GPO, NSGs, Defender policies, hardening

\- \*\*Detect\*\* – Defender XDR alerts, Sentinel rules, KQL hunting, event monitoring

\- \*\*Respond\*\* – incident review, playbooks, Copilot-assisted investigation

\- \*\*Recover\*\* – remediation, policy correction, secure score improvement, validation



See \[`docs/nist-mapping.md`](docs/nist-mapping.md) for more detail.



\## Publication Note



This project has been refactored into an independent portfolio lab for GitHub publication.



Sensitive values such as passwords, tenant-specific identifiers, workspace keys, and service principal credentials have been replaced with placeholders.



Where direct screenshots were not appropriate to publish, Microsoft Learn references were used as safe visual placeholders for equivalent portal views. These can be replaced over time with sanitized screenshots from the lab environment.



\## Notes



This repository is presented as an independent hands-on security lab project. It is intended to demonstrate practical infrastructure security, governance, detection, and response concepts in a Microsoft hybrid environment.



\## Author



\*\*Arif Khan\*\*  

IT \& Cybersecurity Professional | Security Operations | Risk-Aware IT Leadership



LinkedIn: \[linkedin.com/in/arifkhan31](https://www.linkedin.com/in/arifkhan31)  

GitHub: \[github.com/ipkarif](https://github.com/ipkarif)

