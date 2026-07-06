# AI Research Automation — Local LLM Learning Pipeline

**Automation · Artificial Intelligence · Large Language Models · 
No-Code · Make.com · Ollama · Google Docs · JavaScript**

> Turn any topic into a complete structured learning guide — 
> automatically — using a locally hosted open-source LLM.
> Zero paid API costs. Runs entirely on your own machine.

**Live demo:** pathaks.co.in
**Built by:** Dev Pathak — B.Tech CSBS, Jain University Bangalore

---

## What It Does

Type any topic. The pipeline runs it through 7 evidence-based 
learning steps and returns a complete guide in ~20 seconds.

| Step | Output Generated |
|---|---|
| 1 | Beginner-friendly overview |
| 2 | Reliable sources to study |
| 3 | Deep-thinking questions |
| 4 | Practical exercises |
| 5 | Common misconceptions |
| 6 | Spaced-repetition study plan |
| 7 | Self-test quiz |

Result: delivered instantly to browser + saved to Google Docs.

---

## Architecture

```
User Input (pathaks.co.in)
        |
        v
Make.com Webhook
        |
        v
8 Parallel HTTP Calls
→ Ollama (qwen2.5:0.5b) — running locally
→ Exposed via ngrok tunnel
Steps 1–7 run in parallel + Step 8 compiles output
        |
        v
   [Two outputs]
Webhook Response        Google Docs
(instant to frontend)   (permanent copy)
```

---

## Why Local LLM Instead of a Paid API

Every one of the 8 calls runs against Ollama on your own 
machine — zero per-token cost, no API key management, 
no rate limits from a provider.

ngrok exposes localhost:11434 to Make.com's cloud, 
making the local model reachable from any workflow.

---

## Tech Stack

| Layer | Tool | Role |
|---|---|---|
| Automation / Orchestration | Make.com | Fans out 8 parallel LLM calls |
| Large Language Model | Ollama (qwen2.5:0.5b) | Local inference — no API cost |
| Tunnel | ngrok | Exposes localhost to Make.com |
| Storage | Google Docs via Make.com | Permanent guide archive |
| Frontend | HTML / CSS / JavaScript | User interface |
| Hosting | Netlify | Static site deployment |
| Domain | pathaks.co.in | Live production URL |

---

## Repository Structure

```
ai-research-pipeline/
├── README.md            — Project overview (you are here)
├── index.html           — Frontend — live at pathaks.co.in
├── make-blueprint.json  — Import directly into Make.com
├── setup.bat            — Starts Ollama + ngrok together
└── .env.example         — Configuration template
```

---

## Setup Guide

### Prerequisites
- Ollama installed (ollama.ai)
- ngrok account — free tier works (ngrok.com)
- Make.com account — free tier works (make.com)
- Google account for Docs storage

### Steps

**Step 1 — Pull the model**
```bash
ollama pull qwen2.5:0.5b
```

**Step 2 — Start services**
Run setup.bat — opens Ollama and ngrok in separate windows

**Step 3 — Get ngrok URL**
Copy the HTTPS forwarding URL from the ngrok window
(format: https://xxxx.ngrok-free.dev)

**Step 4 — Import Make.com blueprint**
New scenario → menu → Import Blueprint → select 
make-blueprint.json → update all 8 HTTP module URLs 
to: your-ngrok-url/api/chat

**Step 5 — Connect Google Docs**
Reconnect the Google Docs module to your Google account
Set your destination folder ID

**Step 6 — Configure frontend**
Replace YOUR_MAKE_WEBHOOK_URL in index.html with your 
Make.com scenario webhook URL

**Step 7 — Deploy and test**
Open index.html locally or deploy to Netlify
Turn scenario ON → type a topic → submit

---

## How a Request Flows

1. Frontend POSTs topic as JSON to Make.com webhook
2. Make.com fans out 7 parallel prompts to local Ollama
   — each prompt targets one learning step
3. 8th call compiles all outputs into one formatted guide
4. Guide returned synchronously to frontend via 
   Webhook Respond module
5. Simultaneously saved to Google Docs automatically
6. Frontend caches last guide in localStorage
   — guide survives page refresh

---

## Skills Demonstrated

- Multi-step prompt engineering for consistent 
  cross-topic output
- Parallel API call orchestration in Make.com
- Local LLM deployment and tunneling via ngrok
- Full-stack JavaScript — custom markdown renderer,
  localStorage caching, async fetch with error handling
- Production deployment on custom domain via Netlify
- No-code automation architecture design

---

## Known Limitations

- qwen2.5:0.5b chosen for speed on modest hardware
  Swap to qwen2.5:7b or llama3.1:8b for better quality
  (one-line change per HTTP module)
- ngrok free tier URL changes on every restart
  Update Make.com HTTP modules each time
  Or use paid ngrok plan with static domain
- Google Docs auth tied to original account
  Reconnect after importing blueprint

---

## Related Projects

- AI Email Automation Pipeline
  Gmail → Gemini AI → Google Sheets → Telegram
  github.com/Devpathak18/email-ai-automation

---

## Author

Dev Pathak
B.Tech Computer Science and Business Systems (CSBS)
Jain Deemed-to-be University, Bangalore
Program co-designed with Tata Consultancy Services

GitHub: github.com/Devpathak18
LinkedIn: linkedin.com/in/devpathak18
Email: devpathak2244@gmail.com
Portfolio: pathaks.co.in

Open to remote internships in AI Automation, 
Data Analytics, and Business Analysis.
