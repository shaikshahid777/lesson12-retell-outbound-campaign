# Test evidence

Screenshots are in `screenshots/` (numbers masked). Outputs without a screenshot are transcribed below from the n8n execution output.

| ID | Requirement | Setup | Observed result | Evidence |
|---|---|---|---|---|
| TC-002 | FR-002 | Dispatcher, `now_override` = 2026-10-16T23:30:00+05:30, `call_gate` = BLOCKED | TestUser skipped as `skipped_outside_call_window` (local_time 23:30); other leads skipped (protected / DNC) | Transcript A |
| DNC | FR-003 / FR-004 (n8n side) | Postman POST to the DNC webhook for fictional number +15550000004 | HTTP 200, `success: true`, `dnc_status: true`; Supabase row confirms | Screenshots 05, 06 |
| TC-004 | FR-005 | Postman, signed mock `call_analyzed` payload | HTTP 200, `outcome_label: answered`; row written to `campaign_call_logs` | Screenshots 07 to 10 |
| Webhook security | invalid signature | Postman, signature made with a wrong key | HTTP 401 `invalid_signature`; log row count unchanged | Screenshots 11 to 13 |
| TC-005 | NFR-001 | Throttle workflow, 15 mock requests to httpbin.org, batch size 5, 1000 ms interval | 5, 5, 5 requests per second; max 5; pass | Transcript B |
| Dry run | Safety gate | Dispatcher with `call_gate` = BLOCKED | `BLOCKED_BY_SAFETY_GATE_NO_API_CALL_MADE`; no Retell request | Screenshot 04 |

## Transcript A: calling-window test (Evaluate Compliance output)

```text
lead_id  first_name      phone_number     timezone              local_time  decision
1        TestUser        +91XXXXXXXXXX    Asia/Kolkata          23:30       skipped_outside_call_window
2        NightTest       +15550000002     America/Los_Angeles   null        skipped_protected_test_number
3        DNCUser         +15550000003     Asia/Kolkata          null        skipped_dnc
4        DNCWebhookTest  +15550000004     Asia/Kolkata          null        skipped_dnc
```

A mistyped `now_override` is reported as `skipped_timezone_invalid` (seen once during testing and fixed by retyping the value).

## Transcript B: throttle test (Throttle Evidence output)

```json
{
  "total_requests": 15,
  "requests_per_second": { "1792157502": 5, "1792157503": 5, "1792157504": 5 },
  "max_per_second": 5,
  "limit": 5,
  "pass": true
}
```

## Notes

- The throttle test proves the batching settings against a mock endpoint, not against Retell. The dispatcher HTTP node uses the same batch size 5 with the default 1000 ms interval.
- Webhook tests use mock payloads signed with a local test key, not real Retell traffic.
- Not run: TC-001 (live greeting) and TC-003 end to end (Retell tool call on a live call).
