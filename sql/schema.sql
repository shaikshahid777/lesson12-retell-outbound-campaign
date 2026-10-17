-- Lesson 12: campaign tables (PostgreSQL / Supabase)
CREATE TABLE IF NOT EXISTS campaign_leads (
  lead_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  phone_number VARCHAR(20) UNIQUE NOT NULL,
  product_name VARCHAR(100) NOT NULL,
  timezone VARCHAR(50) NOT NULL,
  dnc_status BOOLEAN DEFAULT FALSE,
  last_call_attempt TIMESTAMP
);

CREATE TABLE IF NOT EXISTS campaign_call_logs (
  call_log_id SERIAL PRIMARY KEY,
  lead_id INT REFERENCES campaign_leads(lead_id),
  call_sid VARCHAR(100) UNIQUE NOT NULL,
  call_duration_seconds INT,
  outcome_label VARCHAR(30) NOT NULL,
  recording_url TEXT,
  call_summary TEXT,
  occurred_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
