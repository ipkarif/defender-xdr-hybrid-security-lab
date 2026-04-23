\# Hybrid Security Operations Lab – Full Technical Guide

Defender XDR + Sentinel + Security Copilot + Azure Policy



\---



\## Overview



This document provides a detailed technical walkthrough for building a hybrid enterprise security lab using Microsoft technologies.



The lab combines on-premises Active Directory, Azure infrastructure, Microsoft 365, and Microsoft security solutions to demonstrate how modern organizations implement security controls, monitoring, governance, and response capabilities across hybrid environments.



\---



\## Lab Objectives



This lab is designed to demonstrate:



\- Hybrid identity and access management using Active Directory and Microsoft Entra ID

\- Department-based security segmentation and policy enforcement

\- Network segmentation using Azure virtual networks and subnets

\- Endpoint protection and monitoring using Microsoft Defender XDR

\- SIEM and detection workflows using Microsoft Sentinel

\- Investigation and triage using Security Copilot

\- Governance and compliance using Azure Policy and Defender for Cloud

\- Practical mapping of security controls to NIST Cybersecurity Framework functions



\---



\## Lab Scenario



The lab simulates a modern small-to-medium enterprise environment with multiple departments, each operating under different security requirements.



\### Departments included:



\- IT (administrative access and monitoring)

\- Finance (restricted access and tighter controls)

\- HR (sensitive data handling and device restrictions)

\- Marketing (more flexible access with monitoring)



Each department is logically separated and governed through identity, policy, and network controls.



\---



\## High-Level Architecture



The environment includes:



\### On-Premises

\- Windows Server Domain Controller

\- Active Directory Domain Services

\- DNS

\- Organizational Units for departments and systems

\- Group Policy for access and device controls



\### Azure

\- Resource group and virtual network

\- Segmented subnets for departments

\- Network Security Groups (NSGs)

\- Azure Virtual Machines

\- Azure Bastion for secure remote access

\- Azure Policy for governance and compliance

\- Defender for Cloud for posture management

\- Azure Arc concepts for hybrid management



\### Microsoft Security Stack

\- Microsoft Defender XDR

\- Defender for Endpoint

\- Defender for Office 365 (conceptual integration)

\- Microsoft Sentinel

\- Security Copilot



\---



\## Lab Design Principles



This lab is built around the following security principles:



\- Least privilege access

\- Segmentation of users and systems

\- Policy-based enforcement

\- Centralized monitoring and visibility

\- Layered security controls across identity, network, and endpoints

\- Practical validation through simulated events and testing



\---



\## Publication Note



This project has been refactored into an independent portfolio lab for GitHub publication.



Sensitive values such as passwords, tenant-specific identifiers, workspace keys, and service principal credentials have been replaced with placeholders.



Where direct screenshots were not appropriate to publish, Microsoft Learn references were used as safe visual placeholders for equivalent portal views. These can be replaced over time with sanitized screenshots from the lab environment.



\---



\## How to Use This Guide



This document is organized into logical sections that follow a typical deployment and validation flow:



1\. Environment setup (on-premises and Azure)

2\. Identity and directory configuration

3\. Network and segmentation setup

4\. Policy and governance implementation

5\. Security monitoring and detection

6\. Incident simulation and validation

7\. Investigation and response workflows



Each section builds on the previous one, so it is recommended to follow the steps in order when reproducing the lab.



\---



\## Important Notes



\- This lab is intended for controlled, non-production environments only.

\- All configurations and scripts are designed for learning and demonstration purposes.

\- Any testing or simulation should be performed only within your own lab environment.





Section 1 — Environment Setup

\---



\## 1. Environment Setup



\### Objective

Prepare the foundational infrastructure for the hybrid lab environment.



\### Steps



1\. Create an Azure subscription (or use existing lab subscription)

2\. Create a resource group:



```bash

az group create --name "RG-SECURITY-LAB" --location "eastus"

Create a virtual network and subnets:

IT subnet

Finance subnet

HR subnet

Marketing subnet

Domain Controller subnet

Create Network Security Groups (NSGs) for each subnet

Deploy Azure Virtual Machines:

Domain Controller (Windows Server)

1–2 client machines

Configure Azure Bastion (optional for secure access)

Expected Outcome

Azure environment is ready

VNet and subnets are created

VMs are accessible



\---



\## Section 2 — Identity \& Active Directory



```markdown

\---



\## 2. Identity and Directory Configuration



\### Objective

Establish centralized identity and access management.



\### Steps



1\. Promote Windows Server to Domain Controller:

\- Install AD DS and DNS

\- Create domain (e.g., contoso.com)



2\. Create Organizational Units (OUs):

\- IT

\- Finance

\- HR

\- Marketing



3\. Create users and groups:

\- IT Admin

\- Finance users

\- HR users

\- Marketing users



4\. Apply Group Policy structure:

\- Department-based GPOs

\- Basic security policies



5\. (Optional) Configure Microsoft Entra Connect for hybrid identity



\### Expected Outcome

\- Domain is operational

\- Users and groups are structured

\- GPO framework is ready



&#x20;Section 3 — Network Segmentation \& Policies

\---



\## 3. Network Segmentation and Policy Enforcement



\### Objective

Apply security controls using segmentation and policy.



\### Steps



1\. Assign subnets to departments

2\. Associate NSGs with each subnet



3\. Define NSG rules:

\- Allow required internal communication

\- Restrict unnecessary traffic



4\. Apply department-based policies:

\- Finance: restricted internet access

\- HR: device restrictions (e.g., USB)

\- Marketing: more flexible access



5\. Validate connectivity between systems



\### Expected Outcome

\- Departments are logically separated

\- Security controls are enforced via network and policy



&#x20;Section 4 — Defender XDR Setup

\---



\## 4. Microsoft Defender XDR Configuration



\### Objective

Enable endpoint protection and monitoring.



\### Steps



1\. Onboard endpoints to Defender for Endpoint

2\. Verify device inventory in Defender portal

3\. Enable endpoint protection features:

\- Real-time protection

\- Cloud-delivered protection



4\. Configure web content filtering policies



5\. Validate onboarding using:

\- defender-validation.ps1 script



\### Expected Outcome

\- Devices appear in Defender portal

\- Protection features are active



&#x20;Section 5 — Microsoft Sentinel

\---



\## 5. Microsoft Sentinel Integration



\### Objective

Enable centralized logging, detection, and investigation.



\### Steps



1\. Create a Log Analytics workspace

2\. Enable Microsoft Sentinel



3\. Configure data connectors:

\- Security events

\- Microsoft Defender



4\. Create basic analytic rules

5\. Run sample KQL queries from:

&#x20;  scripts/sentinel-kql-queries.txt



\### Expected Outcome

\- Logs are ingested into Sentinel

\- Alerts and incidents are generated



&#x20;Section 6 — Security Copilot (Conceptual / Optional)

\---



\## 6. Security Copilot Integration



\### Objective

Demonstrate AI-assisted investigation workflows.



\### Steps



1\. Use Security Copilot (if available) to:

\- summarize incidents

\- explain alerts

\- assist with queries



2\. Example use cases:

\- incident summarization

\- suspicious activity explanation



\### Expected Outcome

\- Improved investigation efficiency

\- Better understanding of alert context



&#x20;Section 7 — Governance \& Policy

\---



\## 7. Governance and Policy Controls



\### Objective

Apply governance and compliance controls.



\### Steps



1\. Create Azure Policy:

\- require resource tags

\- restrict insecure deployments



2\. Apply resource locks to critical resources



3\. Review Defender for Cloud:

\- secure score

\- recommendations



4\. (Optional) Demonstrate Azure Arc concepts



\### Expected Outcome

\- Governance policies are enforced

\- Compliance posture is visible



&#x20;Section 8 — Event Simulation \& Validation

\---



\## 8. Event Simulation and Validation



\### Objective

Validate detection and response capabilities.



\### Steps



1\. Run test-event-simulation.ps1:

\- failed logon attempts

\- safe Defender test activity



2\. Generate policy violations manually

3\. Review alerts in:

\- Defender XDR

\- Sentinel



4\. Use KQL queries to investigate events



\### Expected Outcome

\- Alerts are generated

\- Events are visible in monitoring tools



&#x20;Section 9 — Investigation \& Response

\---



\## 9. Investigation and Response



\### Objective

Perform basic incident analysis and response.



\### Steps



1\. Review incidents in Defender XDR

2\. Investigate alerts using Sentinel

3\. Correlate events across systems

4\. Use Security Copilot (if available) for assistance

5\. Document findings and actions



\### Expected Outcome

\- Incidents are analyzed

\- Response actions are understood

