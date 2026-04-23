\# Setup Overview



\## Lab Scenario



This lab simulates a hybrid enterprise environment with multiple departments, each operating under different security requirements. The design combines on-premises infrastructure with Azure and Microsoft security services to demonstrate modern security operations and governance.



\## Core Components



\### On-Premises

\- Windows Server domain controller

\- Active Directory Domain Services

\- DNS

\- Organizational Units for departments and devices

\- Group Policy for department-specific restrictions



\### Azure

\- Resource group

\- Virtual network with segmented subnets

\- Network Security Groups

\- Azure VMs

\- Azure Bastion

\- Azure Policy

\- Defender for Cloud

\- Azure Arc concepts for hybrid governance



\### Microsoft Security Stack

\- Microsoft Defender XDR

\- Defender for Endpoint

\- Defender for Office 365

\- Microsoft Sentinel

\- Security Copilot



\## Department Model



The environment includes:



\- IT

\- Finance

\- HR

\- Marketing



Each department has different access expectations and security controls, allowing the lab to demonstrate both centralized governance and role-based enforcement.



\## Design Priorities



\- Limit unnecessary access

\- Improve visibility into endpoint and identity activity

\- Demonstrate practical governance controls

\- Create security detections that can be validated in a lab

\- Show how modern Microsoft security tools can work together in a hybrid model

