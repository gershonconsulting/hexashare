-- Audit trail and once-per-day guard for the platform-wide extension report
-- emailed to the Gershon Consulting reporting inbox.
CREATE TABLE IF NOT EXISTS admin_daily_reports (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  report_date TEXT NOT NULL UNIQUE,
  recipient TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'sent',
  provider_message_id TEXT,
  metrics_json TEXT,
  error TEXT,
  sent_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_admin_daily_reports_date ON admin_daily_reports(report_date);
