-- Signals the daily repost report needs in order to raise an alarm rather than
-- silently reporting "0 reposts" when the job never ran at all.

ALTER TABLE extension_tokens ADD COLUMN extension_version TEXT;
ALTER TABLE extension_tokens ADD COLUMN last_seen_at TEXT;

CREATE TABLE IF NOT EXISTS extension_runs (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER NOT NULL,
  team_id INTEGER NOT NULL,
  extension_version TEXT,
  trigger_source TEXT,
  outcomes INTEGER NOT NULL DEFAULT 0,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_extension_runs_user_date ON extension_runs(user_id, created_at);
