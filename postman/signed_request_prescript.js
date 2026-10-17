// Postman Pre-request Script: signs the raw body like Retell does (v=<timestamp>,d=<HMAC-SHA256(body + timestamp)>)
// Use the SAME key as the n8n variable RETELL_API_KEY. For local mock tests a dummy key is used.
// For the invalid-signature test change `key` to a wrong value.
const body = pm.request.body.raw;
const ts = Date.now().toString();
const key = 'lesson12_local_test_signing_key';
const digest = CryptoJS.HmacSHA256(body + ts, key).toString(CryptoJS.enc.Hex);
pm.request.headers.upsert({ key: 'x-retell-signature', value: 'v=' + ts + ',d=' + digest });
