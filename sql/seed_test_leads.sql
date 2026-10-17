-- Sample leads. Replace the first number with your own test phone before any real call.
-- The +1555000000x numbers are fictional and are protected in the dispatcher code (never dialed).
INSERT INTO campaign_leads (first_name, phone_number, product_name, timezone, dnc_status) VALUES
('TestUser',       '+91XXXXXXXXXX', 'Premium Cloud Storage', 'Asia/Kolkata',        FALSE),
('NightTest',      '+15550000002',  'Premium Cloud Storage', 'America/Los_Angeles', FALSE),
('DNCUser',        '+15550000003',  'Premium Cloud Storage', 'Asia/Kolkata',        TRUE),
('DNCWebhookTest', '+15550000004',  'Premium Cloud Storage', 'Asia/Kolkata',        FALSE);
