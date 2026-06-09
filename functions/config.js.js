// Cloudflare Pages Function
// /config.js 요청을 가로채 환경변수로 Supabase 설정을 동적으로 반환합니다.
export async function onRequest(context) {
  const { SUPABASE_URL, SUPABASE_ANON_KEY } = context.env;
  const body = `const SUPABASE_URL = '${SUPABASE_URL}';\nconst SUPABASE_ANON_KEY = '${SUPABASE_ANON_KEY}';`;
  return new Response(body, {
    headers: { 'Content-Type': 'application/javascript' },
  });
}
