'use client';

import React, { useState, useEffect } from 'react';
import { supabase } from '@/lib/supabase';
import { saveState, clearState, getInitialState, getStageUrl } from '@/lib/assessment'; // Keep existing utility usage
import { AppStage, UserProfile, CareerPath, UniversityCourse, Scenario, VibePair, Task } from '../components/uioverhaul/types';
import Button from '../components/uioverhaul/Button';
import VibeSwiper from '../components/uioverhaul/VibeSwiper';
import ScenarioSlider from '../components/uioverhaul/ScenarioSlider';
import AssessmentTask from '../components/uioverhaul/AssessmentTask';
import EnjoymentModal from '../components/uioverhaul/EnjoymentModal';
import MatchesView from '../components/uioverhaul/MatchesView';
import Dashboard from '../components/uioverhaul/Dashboard';
import { MOCK_PROFILE, MOCK_COURSES, MOCK_CAREERS, SCENARIOS, VIBE_PAIRS, TASKS } from '../data/mock';
import { motion } from 'framer-motion';
import { SkipForward } from 'lucide-react';

import { useRouter } from 'next/navigation';

export default function App() {
  const router = useRouter();
  const [stage, setStage] = useState<AppStage>(AppStage.LANDING);
  const [currentScenarioIndex, setCurrentScenarioIndex] = useState(0);
  const [loadingText, setLoadingText] = useState("Analysing profile...");
  const [isLoading, setIsLoading] = useState(false); // For initial button loading state

  // Task State
  const [currentTaskIndex, setCurrentTaskIndex] = useState(0);
  const [showEnjoyment, setShowEnjoyment] = useState(false);

  // Check if there's an active session and redirect to appropriate assessment stage
  useEffect(() => {
    const state = getInitialState();
    if (state.sessionId && stage === AppStage.LANDING) {
      // User has an active session, route them to the correct assessment page
      const stageUrl = getStageUrl(state.stage);
      if (stageUrl !== '/') {
        router.push(stageUrl);
      }
    }
  }, [router, stage]);

  // Processing Animation Effect
  useEffect(() => {
    if (stage === AppStage.PROCESSING) {
      const timers = [
        setTimeout(() => setLoadingText("Building your profile..."), 1500),
        setTimeout(() => setLoadingText("Finding your matches..."), 3000),
        setTimeout(() => setStage(AppStage.DASHBOARD), 4500)
      ];
      return () => timers.forEach(clearTimeout);
    }
  }, [stage]);

  const startAssessment = async () => {
    setIsLoading(true);
    clearState();

    try {
      // Get authenticated user
      const { data: { user }, error: authError } = await supabase.auth.getUser();

      if (authError || !user) {
        // Middleware should catch this, but redirect just in case
        window.location.href = 'https://examrizz.com/login?redirect=assess';
        return;
      }

      // Check if user already has a session
      const { data: existing } = await supabase
        .from('bo_v1_sessions')
        .select('id')
        .eq('user_id', user.id)
        .single();

      let sessionId: string;

      if (existing) {
        // Resume existing session
        sessionId = existing.id;
      } else {
        // Create new session linked to user
        const { data, error } = await supabase
          .from('bo_v1_sessions')
          .insert({ user_id: user.id })
          .select('id')
          .single();

        if (error) {
          console.error('Failed to create session:', error);
          setIsLoading(false);
          return;
        }

        sessionId = data.id;
      }

      // Save session state
      saveState({
        sessionId,
        stage: 'vibe',
        vibeSwipes: [],
        vibeChoices: [],
        scenarioResponses: [],
        miniSampleResponses: [],
        startedAt: Date.now(),
      });

      setIsLoading(false);
      router.push('/assessment/vibe');
    } catch (error) {
      console.error('Error starting assessment:', error);
      setIsLoading(false);
    }
  };

  // View: Landing Page
  if (stage === AppStage.LANDING) {
    return (
      <div className="min-h-screen bg-background text-white overflow-hidden relative font-sans">
        {/* Abstract Background */}
        <div className="absolute top-0 left-0 w-full h-full overflow-hidden z-0 pointer-events-none">
          <div className="absolute top-[-20%] right-[-10%] w-[60%] h-[60%] bg-primary/20 blur-[120px] rounded-full"></div>
          <div className="absolute bottom-[-10%] left-[-10%] w-[50%] h-[50%] bg-accent/10 blur-[100px] rounded-full"></div>
        </div>



        <main className="relative z-10 flex flex-col items-center justify-center text-center mt-12 lg:mt-20 px-4">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8 }}
          >
            <h1 className="text-3xl lg:text-5xl font-display font-bold leading-tight mb-6 drop-shadow-2xl">
              Find where you'll <span className="text-transparent bg-clip-text bg-gradient-to-r from-primaryGlow to-accent">thrive</span>, not just survive.
            </h1>

            <Button
              size="lg"
              variant="primary"
              isLoading={isLoading}
              className="text-lg px-12 py-8 shadow-[0_0_30px_rgba(99,102,241,0.4)] hover:shadow-[0_0_50px_rgba(99,102,241,0.6)] transition-shadow"
              onClick={startAssessment}
            >
              Start Assessment
            </Button>
          </motion.div>

          <div className="mt-24 grid grid-cols-1 md:grid-cols-3 gap-8 max-w-5xl w-full text-left">
            {[
              { step: "01", title: "Complete Profile", desc: "Quick assessment takes ~6 minutes." },
              { step: "02", title: "Unlock Archetype", desc: "Discover your learning strengths & style." },
              { step: "03", title: "Get Matched", desc: "Compare thousands of UK courses." }
            ].map((item, i) => (
              <motion.div
                key={i}
                className="bg-surface/50 border border-white/5 p-6 rounded-xl hover:bg-surface/80 transition-colors"
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ delay: 0.2 + (i * 0.1) }}
              >
                <div className="text-accent font-display font-bold text-xl mb-2">{item.step}</div>
                <h3 className="text-xl font-bold text-white mb-2">{item.title}</h3>
                <p className="text-gray-400 text-sm">{item.desc}</p>
              </motion.div>
            ))}
          </div>
        </main>
      </div>
    );
  }

  // View: Assessment Stage 1 (Vibe Swiper)
  if (stage === AppStage.ASSESSMENT_VIBE) {
    return (
      <div className="min-h-screen bg-background flex flex-col">
        <div className="flex-1 flex items-center justify-center p-4">
          <VibeSwiper
            pairs={VIBE_PAIRS}
            onComplete={() => setStage(AppStage.ASSESSMENT_SCENARIO)}
          />
        </div>
      </div>
    );
  }

  // View: Assessment Stage 2 (Scenarios)
  if (stage === AppStage.ASSESSMENT_SCENARIO) {
    const handleScenarioNext = (value: number) => {
      // Here you would capture the value (0-100)
      if (currentScenarioIndex < SCENARIOS.length - 1) {
        setCurrentScenarioIndex(prev => prev + 1);
      } else {
        // Route to actual mini-samples page instead of local state
        router.push('/assessment/mini-samples');
      }
    };

    const handleSkipScenarios = () => {
      // Route to actual mini-samples page instead of local state
      router.push('/assessment/mini-samples');
    };

    return (
      <div className="min-h-screen bg-background flex flex-col items-center justify-center relative">
        {/* Skip Section Button */}
        <div className="absolute top-6 right-6 z-50">
          <Button
            variant="ghost"
            size="sm"
            onClick={handleSkipScenarios}
            className="text-gray-400 hover:text-white group bg-surface/50 backdrop-blur-sm border border-white/5 rounded-full px-4"
          >
            Skip Section <SkipForward size={16} className="ml-2 group-hover:translate-x-1 transition-transform" />
          </Button>
        </div>

        <ScenarioSlider
          scenario={SCENARIOS[currentScenarioIndex]}
          currentIndex={currentScenarioIndex}
          total={SCENARIOS.length}
          onNext={handleScenarioNext}
        />
      </div>
    );
  }

  // View: Assessment Stage 3 (Timed Tasks)
  // NOTE: This stage should redirect to /assessment/mini-samples in the actual flow
  if (stage === AppStage.ASSESSMENT_TASKS) {
    // Redirect to actual mini-samples page
    useEffect(() => {
      router.push('/assessment/mini-samples');
    }, [router]);

    return (
      <div className="min-h-screen bg-background flex items-center justify-center">
        <div className="text-white">Redirecting to tasks...</div>
      </div>
    );
  }

  // View: Processing
  if (stage === AppStage.PROCESSING) {
    return (
      <div className="min-h-screen bg-background flex flex-col items-center justify-center relative overflow-hidden">
        {/* Particle effects would go here */}
        <div className="relative z-10 text-center">
          <div className="w-24 h-24 mx-auto mb-8 relative">
            <div className="absolute inset-0 rounded-full border-4 border-primary/20"></div>
            <div className="absolute inset-0 rounded-full border-t-4 border-primary animate-spin"></div>
            <div className="absolute inset-4 rounded-full border-4 border-accent/20"></div>
            <div className="absolute inset-4 rounded-full border-b-4 border-accent animate-spin-slow"></div>
          </div>
          <h2 className="text-3xl font-display font-bold text-white mb-2 animate-pulse">{loadingText}</h2>
          <p className="text-gray-500">Do not refresh the page.</p>
        </div>
      </div>
    );
  }

  // View: Matches Analysis
  if (stage === AppStage.MATCHES) {
    return (
      <MatchesView courses={MOCK_COURSES} onNavigate={setStage} />
    );
  }

  // View: Dashboard (Default for logged in state)
  return (
    <Dashboard profile={MOCK_PROFILE} courses={MOCK_COURSES} careers={MOCK_CAREERS} onNavigate={setStage} />
  );
};
