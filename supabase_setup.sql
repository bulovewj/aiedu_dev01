-- ============================================================
-- 토론 의견 수집 앱 — Supabase 초기 설정 SQL
-- Supabase 대시보드 → SQL Editor에 전체 내용을 붙여넣고 실행하세요.
-- ============================================================

-- 1. 테이블 생성
CREATE TABLE IF NOT EXISTS debate_records (
  id           uuid        DEFAULT gen_random_uuid() PRIMARY KEY,
  created_at   timestamptz DEFAULT now() NOT NULL,
  topic        text        NOT NULL,
  school_level text        NOT NULL,
  student_name text        NOT NULL,
  stance       text        NOT NULL CHECK (stance IN ('찬성', '반대', '중립')),
  reason       text        NOT NULL,
  evidence     text        NOT NULL,
  counter      text,
  learned      text
);

-- 2. Row Level Security 활성화
ALTER TABLE debate_records ENABLE ROW LEVEL SECURITY;

-- 3. RLS 정책: anon 사용자 INSERT 허용 (학생 제출)
CREATE POLICY "anon_insert"
  ON debate_records
  FOR INSERT
  TO anon
  WITH CHECK (true);

-- 4. RLS 정책: anon 사용자 SELECT 허용 (교사 조회)
CREATE POLICY "anon_select"
  ON debate_records
  FOR SELECT
  TO anon
  USING (true);

-- 완료 확인 메시지
SELECT 'debate_records 테이블 및 RLS 설정 완료!' AS result;
