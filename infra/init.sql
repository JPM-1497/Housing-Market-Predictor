-- Create pipeline schemas -----------------------------

-- raw  → raw API / CSV ingests
CREATE SCHEMA IF NOT EXISTS raw;

-- stg  → staging models that clean and type-cast raw data
CREATE SCHEMA IF NOT EXISTS stg;

-- int  → intermediate transformations (joins, lags, rollups)
CREATE SCHEMA IF NOT EXISTS int;

-- mart → final analytics- or ML-ready tables
CREATE SCHEMA IF NOT EXISTS mart;

-- pred → model predictions or outputs
CREATE SCHEMA IF NOT EXISTS pred;
----------------------------------------------------------

-- Useful extensions (safe to keep) -----------------------
--    - uuid-ossp  : allows easy generation of universally unique identifiers (UUIDs)
--                   with functions like uuid_generate_v4()
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

--    - pgcrypto   : adds cryptographic and random functions (e.g., gen_random_uuid())
CREATE EXTENSION IF NOT EXISTS pgcrypto;
-----------------------------------------------------------

-- Optional: helpful search_path for this DB ----------------
-- The search_path tells Postgres which schemas to look in by default when a query
-- By listing our pipeline schemas, we can reference tables more easily in SQL.
ALTER DATABASE housing_ml SET search_path = public, raw, stg, int, mart, pred;
------------------------------------------------------------