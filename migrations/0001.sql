CREATE TABLE IF NOT EXISTS wedding_state (id integer PRIMARY KEY CHECK (id=1), data jsonb NOT NULL, version integer NOT NULL DEFAULT 1, updated_at timestamptz NOT NULL DEFAULT now());
CREATE TABLE IF NOT EXISTS wedding_receipts (id uuid PRIMARY KEY, provider_id text NOT NULL, name text NOT NULL, mime text NOT NULL, content text NOT NULL, created_at timestamptz NOT NULL DEFAULT now());
CREATE TABLE IF NOT EXISTS wedding_login_attempts (ip_hash text PRIMARY KEY, attempts integer NOT NULL DEFAULT 0, window_start timestamptz NOT NULL DEFAULT now());
