import { createBrowserClient } from '@supabase/ssr';
import { createServerClient } from '@supabase/ssr';

// Client-side Supabase client
export function createClient() {
  return createBrowserClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        domain: '.examrizz.com', // Share cookies across subdomains
      },
    }
  );
}

// Server-side Supabase client
export async function createServerSupabaseClient() {
  const { cookies } = await import('next/headers');
  const cookieStore = await cookies();

  return createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        getAll() {
          return cookieStore.getAll();
        },
        setAll(cookiesToSet) {
          try {
            cookiesToSet.forEach(({ name, value, options }) => {
              cookieStore.set(name, value, { ...options, domain: '.examrizz.com' });
            });
          } catch {
            // Called from Server Component - cookie setting will happen via middleware
          }
        },
      },
    }
  );
}

// Legacy export for backwards compatibility (use createClient() for new code)
// Lazy initialization to avoid build-time errors
let _supabase: ReturnType<typeof createBrowserClient> | null = null;

export const supabase = new Proxy({} as ReturnType<typeof createBrowserClient>, {
  get(target, prop) {
    if (!_supabase) {
      _supabase = createBrowserClient(
        process.env.NEXT_PUBLIC_SUPABASE_URL!,
        process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
        {
          cookies: {
            domain: '.examrizz.com',
          },
        }
      );
    }
    return (_supabase as any)[prop];
  },
});
