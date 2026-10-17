# Lesson 12 — Test Evidence Register

This file separates results reported in the supplied working notes from tests still needing confirmation. Add genuine screenshots under this folder and update statuses only after checking the live workspace.

## Results reported in working notes

| Check | Reported result | Evidence to retain |
|---|---|---|
| Mock post-call request | HTTP 200; mock_call_002; outcome answered | Postman response screenshot |
| n8n response | call_log_id: 2 | n8n execution/output screenshot |
| Valid webhook path | Workflow path shown green | n8n canvas/execution screenshot |
| Call-log rows | Two mock rows described | Supabase query result screenshot |

These are reports from project notes, not independent verification of the current live environment.

## Pending confirmation

- [ ] Nighttime lead is blocked based on that lead's local timezone.
- [ ] Invalid signature returns HTTP 401 with invalid_signature.
- [ ] Invalid-signature request does not insert a call-log row.
- [ ] Throttle test produces the expected 5/5/5 behavior.
- [ ] Retell agent prompt and DNC tool configuration are captured.
- [ ] DNC persistence failure prevents further calls to that lead.
- [ ] End-to-end campaign test is complete using safe test data.

## Suggested screenshot filenames

1. 01-supabase-leads-table.png
2. 02-dispatcher-full-flow.png
3. 03-campaign-config-gate-blocked.png
4. 04-dispatcher-dry-run-call-blocked.png
5. 05-dnc-webhook-postman-200.png
6. 06-supabase-dnc-status-true.png
7. 07-post-call-webhook-valid-signature-200.png
8. 08-n8n-success-output.png
9. 09-post-call-webhook-canvas-valid-path.png
10. 10-supabase-call-log-row.png
11. 11-postman-invalid-signature-401.png
12. 12-post-call-webhook-canvas-401-path.png
13. 13-supabase-log-count-unchanged.png

Do not create or label mock images as real Postman, n8n, Retell, or Supabase evidence. If a test has not been run, leave it pending.
