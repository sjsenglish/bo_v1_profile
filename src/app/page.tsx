'use client';

import React, { useState, useEffect } from 'react';
import { supabase } from '@/lib/supabase';
import { saveState, clearState } from '@/lib/assessment'; // Keep existing utility usage
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

export default function App() {
  const [stage, setStage] = useState<AppStage>(AppStage.LANDING);
  const [currentScenarioIndex, setCurrentScenarioIndex] = useState(0);
  const [loadingText, setLoadingText] = useState("Analysing profile...");
  const [isLoading, setIsLoading] = useState(false); // For initial button loading state

  // Task State
  const [currentTaskIndex, setCurrentTaskIndex] = useState(0);
  const [showEnjoyment, setShowEnjoyment] = useState(false);

  // Processing Animation Effect
  useEffect(() => {
    if (stage === AppStage.PROCESSING) {
      const timers = [
        setTimeout(() => setLoadingText("Calculating cognitive affinities..."), 1500),
        setTimeout(() => setLoadingText("Matching with 28,520 courses..."), 3000),
        setTimeout(() => setStage(AppStage.DASHBOARD), 4500)
      ];
      return () => timers.forEach(clearTimeout);
    }
  }, [stage]);

  const startAssessment = async () => {
    setIsLoading(true);
    // Preserving existing logic: Clear state and create session
    clearState();

    const { data, error } = await supabase
      .from('bo_v1_sessions')
      .insert({})
      .select('id')
      .single();

    if (error) {
      console.error('Failed to create session:', error);
      setIsLoading(false);
      // In a real app we might show an error, but for now we might opt to proceed or halt.
      // If offline/mock mode is acceptable, we could proceed. 
      // But typically we'd return. For this UI overhaul, let's proceed to show the UI.
      setStage(AppStage.ASSESSMENT_VIBE);
      return;
    }

    if (data) {
      saveState({
        sessionId: data.id,
        stage: 'vibe',
        vibeSwipes: [],
        vibeChoices: [],
        scenarioResponses: [],
        miniSampleResponses: [],
        startedAt: Date.now(),
      });
    }

    setIsLoading(false);
    setStage(AppStage.ASSESSMENT_VIBE);
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

        <nav className="relative z-10 flex justify-between items-center p-6 lg:px-12">
          <div className="text-2xl font-display font-bold italic tracking-wider">EXAMRIZZ</div>
          <Button variant="secondary" size="sm" onClick={() => setStage(AppStage.DASHBOARD)}>Demo Dashboard</Button>
        </nav>

        <main className="relative z-10 flex flex-col items-center justify-center text-center mt-12 lg:mt-20 px-4">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8 }}
          >
            <div className="inline-block px-3 py-1 mb-6 border border-white/10 rounded-full bg-white/5 text-xs tracking-widest uppercase text-indigo-300">
              Official HESA Data • Russell Group Optimised
            </div>
            <h1 className="text-5xl lg:text-7xl font-display font-bold leading-tight mb-6 drop-shadow-2xl">
              Find where you'll <span className="text-transparent bg-clip-text bg-gradient-to-r from-primaryGlow to-accent">thrive</span>, not just survive.
            </h1>
            <p className="text-lg text-gray-400 max-w-2xl mx-auto mb-10 leading-relaxed">
              AI-powered university matching based on your cognitive capacity, learning dispositions, and true potential.
            </p>
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
              { step: "01", title: "Complete Profile", desc: "Psychometric assessment takes ~6 minutes." },
              { step: "02", title: "Unlock Archetype", desc: "Discover your cognitive strengths & style." },
              { step: "03", title: "Get Matched", desc: "Instantly compare 28,000+ UK courses." }
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
        setStage(AppStage.ASSESSMENT_TASKS);
      }
    };

    return (
      <div className="min-h-screen bg-background flex flex-col items-center justify-center relative">
        {/* Skip Section Button */}
        <div className="absolute top-6 right-6 z-50">
          <Button
            variant="ghost"
            size="sm"
            onClick={() => setStage(AppStage.ASSESSMENT_TASKS)}
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
  if (stage === AppStage.ASSESSMENT_TASKS) {
    const handleTaskComplete = () => {
      setShowEnjoyment(true);
    };

    const handleEnjoymentComplete = () => {
      setShowEnjoyment(false);

      if (currentTaskIndex < TASKS.length - 1) {
        setCurrentTaskIndex(prev => prev + 1);
      } else {
        setStage(AppStage.PROCESSING);
      }
    };

    const handleTaskSkip = () => {
      // Skip current task without enjoyment rating
      setShowEnjoyment(false);
      if (currentTaskIndex < TASKS.length - 1) {
        setCurrentTaskIndex(prev => prev + 1);
      } else {
        setStage(AppStage.PROCESSING);
      }
    };

    return (
      <div className="relative w-full h-full min-h-screen bg-background text-white">
        <AssessmentTask
          task={TASKS[currentTaskIndex]}
          currentTaskIndex={currentTaskIndex}
          totalTasks={TASKS.length}
          onComplete={handleTaskComplete}
          onSkip={handleTaskSkip}
        />
        {showEnjoyment && (
          <EnjoymentModal onContinue={handleEnjoymentComplete} />
        )}
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
