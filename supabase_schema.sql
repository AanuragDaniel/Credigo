-- ============================================================================
-- CrediGo: Autonomous Credit Intelligence Platform
-- Supabase PostgreSQL Schema & Security Policies
-- Run this in your Supabase Dashboard: SQL Editor -> New Query -> Run
-- ============================================================================

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- 1. USERS & PROFILES TABLE (Mirrored from auth.users or direct platform users)
CREATE TABLE IF NOT EXISTS public.users (
    id TEXT PRIMARY KEY,
    email TEXT UNIQUE NOT NULL,
    full_name TEXT NOT NULL,
    phone TEXT,
    role TEXT DEFAULT 'customer' CHECK (role IN ('customer', 'admin', 'risk_officer')),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable RLS for users
ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow public read access to authenticated users" 
ON public.users FOR SELECT USING (true);

CREATE POLICY "Allow insert/upsert to all authenticated users and anon clients" 
ON public.users FOR INSERT WITH CHECK (true);

CREATE POLICY "Allow users to update own profile" 
ON public.users FOR UPDATE USING (true);

-- 2. LOAN PROFILES & APPLICATIONS TABLE
CREATE TABLE IF NOT EXISTS public.loan_profiles (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id TEXT REFERENCES public.users(id) ON DELETE CASCADE,
    loan_amount NUMERIC NOT NULL DEFAULT 500000.0,
    preferred_tenure INTEGER NOT NULL DEFAULT 36,
    monthly_income NUMERIC NOT NULL DEFAULT 60000.0,
    existing_emi NUMERIC NOT NULL DEFAULT 10000.0,
    loan_purpose TEXT DEFAULT 'Personal / Debt Consolidation',
    employment_type TEXT DEFAULT 'Salaried',
    status TEXT DEFAULT 'IN_REVIEW',
    consultation_completed BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.loan_profiles ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow full access to loan profiles" 
ON public.loan_profiles FOR ALL USING (true);

-- 3. KYC VERIFICATIONS TABLE
CREATE TABLE IF NOT EXISTS public.kyc_verifications (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id TEXT REFERENCES public.users(id) ON DELETE CASCADE,
    demo_identity_name TEXT NOT NULL,
    id_type TEXT DEFAULT 'DigiLocker Mock',
    masked_id TEXT DEFAULT 'XXXX-XXXX-8921',
    status TEXT DEFAULT 'Not Started' CHECK (status IN ('Not Started', 'Pending', 'Preliminary Verified', 'Verified', 'Rejected')),
    validation_score NUMERIC DEFAULT 0,
    file_name TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.kyc_verifications ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow full access to kyc verifications" 
ON public.kyc_verifications FOR ALL USING (true);

-- 4. CREDIT SCORING & UNDERWRITING TABLE
CREATE TABLE IF NOT EXISTS public.credit_assessments (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id TEXT REFERENCES public.users(id) ON DELETE CASCADE,
    credit_score INTEGER NOT NULL,
    risk_level TEXT NOT NULL CHECK (risk_level IN ('Low', 'Medium', 'High')),
    dti_ratio NUMERIC NOT NULL,
    cashflow_cushion NUMERIC NOT NULL,
    breakdown JSONB,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.credit_assessments ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow full access to credit assessments" 
ON public.credit_assessments FOR ALL USING (true);

-- 5. AUDIT LOGS TABLE (For Governance & Compliance Stream)
CREATE TABLE IF NOT EXISTS public.audit_logs (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    agent_name TEXT NOT NULL,
    action TEXT NOT NULL,
    details JSONB,
    timestamp TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.audit_logs ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow read to audit logs" 
ON public.audit_logs FOR SELECT USING (true);

CREATE POLICY "Allow append to audit logs" 
ON public.audit_logs FOR INSERT WITH CHECK (true);
