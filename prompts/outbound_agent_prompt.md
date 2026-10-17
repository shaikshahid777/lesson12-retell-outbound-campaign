# Cloud Solutions Outbound Follow-Up Agent (Retell, single-prompt agent)

> The full prompt text lives in the Retell dashboard (agent_766a1f061fc987c5ab6182037b). This file summarizes what it contains.

Elements the deployed prompt contains:
- Dynamic greeting using {{first_name}} and {{product_name}}
- Short, professional trial follow-up, no invented product facts or survey URLs
- Opt-out recognition ("stop calling", "remove me", "don't call again", ...)
- On opt-out: calls `register_dnc_optout` with phone_number = {{user_number}}, does not claim success unless the tool confirms, then ends the call with `end_call`
- Hold handling

Post-call extraction fields: Call Summary, Call Successful, User Sentiment, optout_requested, dnc_registration_failed
