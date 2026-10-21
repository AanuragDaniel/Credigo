# CrediGo — Agentic AI-Powered Personal Loan Assistance Platform

<div align="center">

![CrediGo Banner](https://images.unsplash.com/photo-1559526324-4b87b5e36e44?w=1200&auto=format&fit=crop&q=80)

### *Your Intelligent Guide to Smarter Loans*

[![Python](https://img.shields.io/badge/Python-3.14%2B-blue.svg)](https://python.org)
[![Flask](https://img.shields.io/badge/Flask-3.1.0-emerald.svg)](https://flask.palletsprojects.com/)
[![SQLite](https://img.shields.io/badge/SQLite-Relational%20DB-cyan.svg)](https://sqlite.org)
[![TailwindCSS](https://img.shields.io/badge/TailwindCSS-3.4-38bdf8.svg)](https://tailwindcss.com)
[![Status](https://img.shields.io/badge/Status-Viva%20Presentation%20Ready-purple.svg)]()

</div>

---

## 📌 1. Project Overview

**CrediGo** is an **Agentic AI-powered Personal Loan Assistance Platform** designed to simplify, automate, and explain the early stages of a personal loan journey. Built specifically for **BCA project presentation and viva defense**, CrediGo demonstrates a production-grade FinTech UI backed by a real multi-agent orchestration architecture.

The platform guides users through an autonomous 5-stage lifecycle:
$$\text{User Auth} \longrightarrow \text{AI Sales Dialogue} \longrightarrow \text{Simulated KYC} \longrightarrow \text{Credit Underwriting} \longrightarrow \text{Personalized Proposal}$$

> [!NOTE]
> **Academic Prototype Disclosure**: CrediGo is an educational demonstration system. It uses deterministic mathematical models, simulated DigiLocker-inspired identity flows, and offline-capable conversational state machines. **No real banking APIs, Aadhaar/PAN collection, or OCR data processing are utilized.**

---

## 🤖 2. Core Agentic AI Architecture

CrediGo implements a **Hierarchical Master-Worker Multi-Agent System**:

```
                         ┌────────────────────────┐
                         │      Customer UI       │
                         └───────────┬────────────┘
                                     │
                                     ▼
                         ┌────────────────────────┐
                         │   👑 MASTER AGENT      │
                         │ (Loan Officer Engine)  │
                         └───────────┬────────────┘
                                     │
           ┌─────────────────────────┼─────────────────────────┐
           ▼                         ▼                         ▼
┌─────────────────────┐   ┌─────────────────────┐   ┌─────────────────────┐
│ 💬 AI SALES AGENT   │   │ 🛡️ KYC AGENT        │   │ 📊 CREDIT AGENT     │
│ (Worker Node #01)   │   │ (Worker Node #02)   │   │ (Worker Node #03)   │
│ • Natural Dialogue  │   │ • DigiLocker Mock   │   │ • 100-Point Model   │
│ • NLP Intake        │   │ • Persona Sandbox   │   │ • DTI & Cashflow    │
│ • Concept Explainer │   │ • Zero Real PII     │   │ • Risk Tier (L/M/H) │
└──────────┬──────────┘   └──────────┬──────────┘   └──────────┬──────────┘
           │                         │                         │
           └─────────────────────────┼─────────────────────────┘
                                     ▼
                         ┌────────────────────────┐
                         │ 👑 MASTER AGENT        │
                         │ (Synthesis & Proposal) │
                         └───────────┬────────────┘
                                     │
                                     ▼
                         ┌────────────────────────┐
                         │ Final Recommendation   │
                         │ • Amount, Tenure, EMI  │
                         │ • Explainable AI Card  │
                         └────────────────────────┘
```

### The Agents & Responsibilities:
1. **Master Loan Orchestrator**:
   - Maintains customer journey status across 5 milestones.
   - Delegates sub-tasks to Worker Agents.
   - Logs timestamped inter-agent communications into the real-time event bus.
   - Combines worker outputs to generate the final loan proposal.
2. **AI Sales Agent (Worker #1)**:
   - Conversational chat interface with quick reply suggestions.
   - Extracts loan amount, purpose, monthly income, employment type, existing EMI, and tenure preferences.
   - Explains FinTech concepts (e.g. *What is EMI?*).
3. **KYC Verification Agent (Worker #2)**:
   - DigiLocker-inspired identity verification sandbox.
   - Preloaded with fictional Indian personas (Rahul Sharma, Priya Verma, Arjun Mehta, Ananya Roy).
   - Simulates user consent, cryptographic token generation, and badge issuance.
4. **Credit & Underwriting Agent (Worker #3)**:
   - Transparent, deterministic 100-point scoring algorithm.
   - Computes:
     - **EMI-to-Income Ratio (DTI)**: $\frac{\text{Existing EMI}}{\text{Monthly Income}} \times 100$
     - **Available Cashflow**: $\text{Monthly Income} - \text{Existing EMI}$
     - **Point Audit**: Points added/deducted for debt burden, income buffer, employment stability, and loan size multiple.
     - **Risk Category**: Low Risk ($\ge 75$), Medium Risk ($50-74$), High Risk ($<50$).
5. **Loan Recommendation Generator**:
   - Suggests amortized loan terms, rate range (e.g. $10.25\% - 11.75\%$), monthly EMI, 6-month amortization schedule, and structured *"Why this recommendation?"* reasoning cards.

---

## 🎓 3. Viva Demonstration Flow (Step-by-Step)

Follow this exact 12-step sequence during your project evaluation:

| Step | Action | What to Explain to the Examiner |
|---|---|---|
| **Step 1** | Open [http://localhost:5000](http://localhost:5000) | Highlight the **CrediGo FinTech landing page** and explain the **Agentic AI architecture visualizer** in the hero section. |
| **Step 2** | Click **Try Demo** | Shows instant 1-click login loading the fictional profile of **Alex Rivera**. |
| **Step 3** | Customer Dashboard | Point out the **5-step Journey Progress Tracker**, the 6 financial stat cards, and the live Agent Status widget. |
| **Step 4** | Launch **AI Sales Agent** | Demonstrate the conversational chat, type natural inputs like `5 lakhs` or click quick pills, and show the live profile auto-extracting in the right sidebar. |
| **Step 5** | Handover to Master Agent | Show the Master Agent receiving the completed requirement payload and assigning the KYC task. |
| **Step 6** | Open **KYC Studio** | Select a demo persona (e.g. **Rahul Sharma**), check the simulated consent box, and click *Execute DigiLocker Verification* to see the verification animation. |
| **Step 7** | Open **Underwriting Page** | Show the deterministic financial models: DTI %, Available Income, and max borrowing cap. |
| **Step 8** | Underwriting Breakdown | Explain the circular score gauge (out of 100) and walk the examiner through the line-by-line point addition/deduction table. |
| **Step 9** | Master Synthesis | Show the Master Agent combining the verified KYC status and Underwriting score. |
| **Step 10** | **Loan Recommendation** | Review the final approved loan terms, the 6-month amortization schedule preview, and the explainable AI reasoning card. |
| **Step 11** | Log in as **Admin** | Click *Admin View* in the top Viva toolbar or sign in as `admin@credigo.demo` / `Admin@123`. |
| **Step 12** | Admin Analytics & Audit | Showcase the 4 live **Chart.js analytics charts**, the filterable customer directory with 360° detail modals, and the live agent activity log. |

---

## ⚡ 4. Quick Viva Scenarios (1-Click Switcher)

CrediGo includes a floating **Viva Demonstration Bar** at the top of every screen:

- **Scenario 1 — Eligible Customer**:
  - *Income*: ₹80,000 | *EMI*: ₹10,000 | *Loan*: ₹5,00,000 | *Employment*: Salaried
  - *Outcome*: **Low Risk • Eligible (Score: 85/100)**
- **Scenario 2 — Conditionally Eligible**:
  - *Income*: ₹45,000 | *EMI*: ₹18,000 | *Loan*: ₹8,00,000 | *Employment*: Salaried
  - *Outcome*: **Medium Risk • Conditionally Eligible (Adjusted Amount / Extended 48M Tenure)**
- **Scenario 3 — High Risk Customer**:
  - *Income*: ₹30,000 | *EMI*: ₹15,000 | *Loan*: ₹10,00,000 | *Employment*: Self-Employed
  - *Outcome*: **High Risk • Not Currently Eligible (DTI >60% Cap Exceeded)**

---

## 🔑 5. Pre-Configured Demo Credentials

| Role | Email | Password | Preloaded Persona |
|---|---|---|---|
| **Admin Officer** | `admin@credigo.demo` | `Admin@123` | CrediGo Admin Officer |
| **Demo Customer 1** | `alex.demo@credigo.demo` | `Demo@123` | Alex Rivera (Eligible, ₹5L) |
| **Demo Customer 2** | `sneha.patel@demo.com` | `Demo@123` | Sneha Patel (Eligible, ₹6.5L) |
| **Demo Customer 3** | `rohan.deshmukh@demo.com` | `Demo@123` | Rohan Deshmukh (Conditional, ₹8L) |
| **Demo Customer 4** | `karan.kapoor@demo.com` | `Demo@123` | Karan Kapoor (High Risk, ₹10L) |

---

## 🛠️ 6. Technology Stack

- **Backend**: Python 3.14 / Flask 3.1.0 (Modular Blueprints, Factory Pattern)
- **Database**: SQLite3 Relational Database with Foreign Key Integrity
- **Authentication**: Stateless JSON Web Tokens (PyJWT) with PBKDF2 Password Hashing
- **Frontend**: Single Page Application (SPA) with Modern ES6 Modules
- **UI Framework**: Tailwind CSS (Glassmorphism, Dark/Light Mode) + Lucide Icons
- **Data Visualization**: Chart.js (Bar, Doughnut, Pie, Horizontal Analytics)
- **Special Effects**: Canvas Confetti for Loan Approvals

---

## 📂 7. Project Structure

```
Credigo/
├── backend/
│   ├── agents/
│   │   ├── master_agent.py          # Central Orchestrator & Audit Logger
│   │   ├── sales_agent.py           # Conversational AI & NLP Parsing
│   │   ├── kyc_agent.py             # DigiLocker Mock Verification
│   │   ├── credit_agent.py          # 100-Point Scoring Algorithm
│   │   └── recommendation_agent.py  # Amortization & AI Reasoning Synthesizer
│   ├── database/
│   │   ├── credigo.db               # SQLite Relational Database
│   │   ├── schema.sql               # Relational Schema & Constraints
│   │   ├── db.py                    # Connection Pool Context Manager
│   │   └── seed.py                  # Seed Data: 1 Admin + 9 Personas
│   ├── middleware/
│   │   └── auth_middleware.py       # JWT & Admin Route Decorators
│   ├── routes/
│   │   ├── auth_routes.py           # Login, Register, Demo Login, Me
│   │   ├── loan_profile_routes.py   # Profile CRUD & AI Chat Turns
│   │   ├── kyc_routes.py            # Mock KYC Profiles & Verification
│   │   ├── eligibility_routes.py    # Underwriting Assessment
│   │   ├── recommendation_routes.py # Final Recommendation Output
│   │   ├── agent_routes.py          # Journey Status & Orchestration
│   │   ├── admin_routes.py          # Analytics & Customer Management
│   │   └── demo_routes.py           # Viva Scenario Switchers
│   ├── services/
│   │   └── auth_service.py          # Token Encoding & Verification
│   ├── config.py                    # Configuration Settings
│   └── app.py                       # Flask Application Factory
├── frontend/
│   ├── static/
│   │   ├── css/
│   │   │   └── style.css            # FinTech Glassmorphism & Animations
│   │   └── js/
│   │       ├── api.js               # Centralized Fetch Client
│   │       ├── auth.js              # State Manager & Toast Utility
│   │       ├── components/
│   │       │   ├── navbar.js        # Global Responsive Navigation
│   │       │   ├── footer.js        # Global FinTech Footer
│   │       │   ├── viva_bar.js      # Floating Viva Demonstration Toolbar
│   │       │   └── agent_visualizer.js # Multi-Agent Graph Component
│   │       ├── pages/
│   │       │   ├── landing.js       # Hero, Flow, Interactive Estimator
│   │       │   ├── login.js         # Sign In & 1-Click Demo Buttons
│   │       │   ├── register.js      # Sign Up Page
│   │       │   ├── dashboard.js     # 5-Step Journey & Financial Cards
│   │       │   ├── sales_chat.js    # AI Chat Dialogue & Auto-Extraction
│   │       │   ├── kyc_verify.js    # DigiLocker Mock Studio
│   │       │   ├── credit_assessment.js # Scoring Model & Formula Breakdown
│   │       │   ├── recommendation.js # Proposal, Amortization, Reasoning
│   │       │   ├── control_center.js # Interactive Agent Graph & Event Stream
│   │       │   ├── admin_dashboard.js # Chart.js Analytics & Customer 360
│   │       │   └── security.js      # Ethics, Security & Viva Q&A Guide
│   │       └── app.js               # Client-Side SPA Hash Router
│   └── templates/
│       └── index.html               # Shell HTML
├── tests/
│   ├── test_agents.py               # Unit Tests for Agent Formulas
│   └── test_api.py                  # Integration Tests for REST APIs
├── requirements.txt
├── run.py                           # 1-Click Master Startup Script
└── README.md
```

---

## 🚀 8. Installation & Quick Start

### 1. Clone or Open the Workspace
```powershell
cd "c:\Users\Aanurag Daniel\OneDrive\Documents\Credigo"
```

### 2. Install Dependencies (if not already installed)
```powershell
pip install -r requirements.txt
```

### 3. Launch the Application
```powershell
python run.py
```

### 4. Open in Browser
Visit **[http://localhost:5000](http://localhost:5000)** in Chrome, Edge, or Firefox.

---

## 🧪 9. Running Automated Tests

Run the complete test suite verifying all agent calculation formulas, risk categorizations, and API endpoints:
```powershell
python -m unittest discover tests
```

---

## 🛡️ 10. Viva Defense Cheat Sheet (Q&A)

### Q1: Why is this called an "Agentic AI" platform instead of a normal form?
> **Answer**: In a typical web form, the backend is a passive database receiver. In CrediGo, the system is driven by a **Master Agent** that orchestrates autonomous specialized agents. The **Sales Agent** extracts requirements through conversational dialogue; the **KYC Agent** authenticates identity in a simulated sandbox; the **Underwriting Agent** conducts mathematical risk scoring; and the **Master Agent** synthesizes everything into explainable recommendations.

### Q2: Is the scoring model based on real machine learning?
> **Answer**: CrediGo intentionally uses a **transparent, rule-based deterministic scoring model (0-100 points)**. This ensures that every deduction (for high DTI, income level, employment type, or loan size) is completely explainable and mathematically auditable during a viva presentation without black-box opacity or external API dependencies.

---

<div align="center">
  <b>Developed for BCA Project Presentation & Viva Defense • 2026</b>
</div>
