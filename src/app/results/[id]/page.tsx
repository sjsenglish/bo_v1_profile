// src/app/results/[id]/page.tsx
'use client';

import { useEffect, useState } from 'react';
import { useParams, useRouter } from 'next/navigation';
import { supabase } from '@/lib/supabase';
import { getFamiliarById, getGuildById } from '@/lib/identity';
import Dashboard from '@/components/uioverhaul/Dashboard';
import MatchesView from '@/components/uioverhaul/MatchesView';
import { AppStage, UserProfile, UniversityCourse, CareerPath } from '@/components/uioverhaul/types';
import { MOCK_PROFILE, MOCK_COURSES, MOCK_CAREERS } from '@/data/mock';

interface ScoredCourse {
  course_id: string;
  score: number;
  fit_score: number;
  friction: string;
  rank: number;
  bo_v1_courses: {
    id: string;
    course_name: string;
    university: string;
    russell_group: boolean;
    employment_rate: number;
    median_salary_3yr: number;
    subject_area: string;
    ucas_points: number;
  };
}

interface ProfileData {
  calibration: number;
  tolerance: number;
  transfer: number;
  precision: number;
  retrieval: number;
  receptivity: number;
  structure: number;
  consistency: number;
  social: number;
  depth: number;
  familiar_id: string;
  guild_id: string;
  dominant: string;
  nemesis: string;
  vrb_value: number;
  qnt_value: number;
  spd_value: number;
}

export default function ResultsPage() {
  const params = useParams();
  const router = useRouter();
  const sessionId = params?.id as string;

  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [stage, setStage] = useState<AppStage>(AppStage.DASHBOARD);
  const [showBetaDisclaimer, setShowBetaDisclaimer] = useState(true);

  // Data states
  const [userProfile, setUserProfile] = useState<UserProfile | null>(null);
  const [courses, setCourses] = useState<UniversityCourse[]>([]);
  const [careers, setCareers] = useState<CareerPath[]>([]);

  useEffect(() => {
    const fetchResults = async () => {
      if (!sessionId) return;

      try {
        // Fetch profile
        const { data: profileData, error: profileError } = await supabase
          .from('bo_v1_profiles')
          .select('*')
          .eq('session_id', sessionId)
          .single();

        // If no profile or error, we might want to fallback to mock
        if (profileError || !profileData) {
          console.warn('Profile fetch failed, using mock data:', profileError);
          setUserProfile(MOCK_PROFILE);
          setCourses(MOCK_COURSES);
          setCareers(MOCK_CAREERS);
          return;
        }

        // Transform Profile
        const rawProfile = profileData as ProfileData;
        const fam = getFamiliarById(rawProfile.familiar_id as any);
        const guild = getGuildById(rawProfile.guild_id as any);

        const transformedProfile: UserProfile = {
          id: sessionId,
          name: 'Candidate',
          precision: Math.round((rawProfile.calibration + rawProfile.precision + rawProfile.structure + rawProfile.consistency) / 4),
          tier: guild?.name as any || 'Standard',
          familiarUnlocked: true,
          familiarName: fam?.name || 'Observer',
          clusterStats: {
            stem: Math.round((rawProfile.precision + rawProfile.calibration + rawProfile.structure) / 3),
            humanities: Math.round((rawProfile.depth + rawProfile.transfer + rawProfile.receptivity) / 3),
            analytical: Math.round((rawProfile.calibration + rawProfile.precision + rawProfile.tolerance) / 3),
            business: Math.round((rawProfile.social + rawProfile.structure + rawProfile.retrieval) / 3),
            creative: Math.round((rawProfile.transfer + rawProfile.depth + rawProfile.social) / 3)
          }
        };
        setUserProfile(transformedProfile);

        // Fetch matches
        const { data: matchData, error: matchError } = await supabase
          .from('bo_v1_matches')
          .select(`
                        course_id,
                        score,
                        fit_score,
                        friction,
                        rank,
                        bo_v1_courses (
                            id,
                            course_name,
                            university,
                            russell_group,
                            employment_rate,
                            median_salary_3yr,
                            subject_area,
                            ucas_points
                        )
                    `)
          .eq('session_id', sessionId)
          .order('score', { ascending: false })
          .limit(20);

        if (matchError) throw matchError;

        if (!matchData || matchData.length === 0) {
          console.warn('No matches found, using mock data for courses');
          setCourses(MOCK_COURSES);
        } else {
          // Transform Courses
          const transformedCourses: UniversityCourse[] = (matchData || []).map((m: any) => {
            const c = m.bo_v1_courses;
            return {
              id: c.id,
              university: c.university,
              course: c.course_name,
              matchScore: m.score,
              tags: [c.subject_area, c.russell_group ? 'RG' : 'Modern'].filter(Boolean),
              isRussellGroup: c.russell_group,
              employmentRate: c.employment_rate || 90,
              matchReasons: [
                "Strong alignment with your analytical strengths.",
                "High graduate demand in this sector.",
                "Course structure matches your learning style."
              ],
              challenges: [
                {
                  skill: "Statistical Analysis",
                  required: 85,
                  user: rawProfile.qnt_value || 70,
                  description: "Heavy focus on quantitative methods."
                },
              ],
              details: {
                duration: "3 Years",
                entry: `${c.ucas_points || 120} UCAS`,
                assessment: "Exam Heavy",
                satisfaction: "4.2/5",
                avgSalary: `£${(c.median_salary_3yr || 30000).toLocaleString()}`
              }
            };
          });
          setCourses(transformedCourses);
        }

        // Mock Careers (since we don't have a table for this yet in this context)
        setCareers(MOCK_CAREERS);

      } catch (err) {
        console.error(err);
        // Fallback to Mocks on catastrophic error
        setUserProfile(MOCK_PROFILE);
        setCourses(MOCK_COURSES);
        setCareers(MOCK_CAREERS);
      } finally {
        setLoading(false);
      }
    };

    fetchResults();
  }, [sessionId]);

  const handleNavigate = (newStage: AppStage) => {
    if (newStage === AppStage.LANDING) {
      router.push('/');
    } else {
      setStage(newStage);
    }
  };

  if (loading) {
    return (
      <main className="min-h-screen bg-[#0a0a0f] flex items-center justify-center">
        <div className="text-center">
          <div className="w-8 h-8 border-2 border-[#6366f1]/30 border-t-[#6366f1] rounded-full animate-spin mx-auto mb-4" />
          <p className="text-gray-400 text-sm">Loading your results...</p>
        </div>
      </main>
    );
  }

  // Error state - ONLY if both userProfile AND mock fallback failed
  if (!userProfile) {
    return (
      <main className="min-h-screen bg-[#0a0a0f] flex items-center justify-center">
        <div className="p-8 bg-[#1a1a24] border border-white/10 rounded-2xl text-center">
          <p className="text-gray-400 mb-4">Results not found and mock comparison failed.</p>
          <button onClick={() => router.push('/')} className="px-6 py-2 bg-[#6366f1] text-white rounded-lg">Return Home</button>
        </div>
      </main>
    );
  }

  // Render based on stage
  if (stage === AppStage.MATCHES) {
    return <MatchesView courses={courses} onNavigate={handleNavigate} />;
  }

  // Default to Dashboard
  return (
    <>
      {/* Beta Disclaimer Modal */}
      {showBetaDisclaimer && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/80 backdrop-blur-sm p-4">
          <div className="bg-[#1a1a24] border-2 border-[#6366f1]/30 rounded-2xl p-8 max-w-lg w-full shadow-2xl">
            <div className="flex items-center justify-center mb-6">
              <div className="w-16 h-16 rounded-full bg-[#6366f1]/10 border border-[#6366f1]/30 flex items-center justify-center">
                <svg className="w-8 h-8 text-[#6366f1]" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
              </div>
            </div>
            
            <h2 className="text-2xl font-bold text-white text-center mb-4">Beta Assessment</h2>
            
            <div className="space-y-4 text-gray-300 text-sm mb-6">
              <p>
                This assessment is currently in <span className="text-[#6366f1] font-semibold">beta testing</span>. Your results are based on our evolving matching algorithm and should be used as indicative guidance rather than definitive recommendations.
              </p>
              <p>
                We're continuously improving the accuracy and relevance of course matches. Results may not reflect the full complexity of university admissions requirements or your complete academic profile.
              </p>
              <p className="text-xs text-gray-400 italic">
                This tool is designed to support your research, not replace it. Always verify course details directly with universities.
              </p>
            </div>
            
            <button
              onClick={() => setShowBetaDisclaimer(false)}
              className="w-full py-3 bg-[#6366f1] text-white font-semibold rounded-xl hover:bg-[#5558e3] transition-colors shadow-lg hover:shadow-[#6366f1]/20"
            >
              I Understand!
            </button>
          </div>
        </div>
      )}
      
      <Dashboard
        profile={userProfile}
        courses={courses.slice(0, 6)}
        careers={careers}
        onNavigate={handleNavigate}
      />
    </>
  );
}
