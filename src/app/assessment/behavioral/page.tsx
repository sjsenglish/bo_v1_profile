// src/app/assessment/behavioral/page.tsx
'use client';

import { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import { getBehavioralQuestions } from '@/lib/questions';
import { getInitialState, saveState } from '@/lib/assessment';
import { DiagnosticResponse } from '@/lib/types';
import { supabase } from '@/lib/supabase';

const LIKERT_OPTIONS = [
  { value: 1, label: 'Strongly Disagree' },
  { value: 2, label: 'Disagree' },
  { value: 3, label: 'Neutral' },
  { value: 4, label: 'Agree' },
  { value: 5, label: 'Strongly Agree' },
];

export default function BehavioralQuestionsPage() {
  const router = useRouter();
  const [currentIndex, setCurrentIndex] = useState(0);
  const [responses, setResponses] = useState<DiagnosticResponse[]>([]);
  const [sessionId, setSessionId] = useState<string | null>(null);
  const [selectedValue, setSelectedValue] = useState<number | null>(null);
  const [animating, setAnimating] = useState(false);
  const startTimeRef = useRef<number>(Date.now());

  const questions = getBehavioralQuestions();
  const currentQuestion = questions[currentIndex];
  const progress = Math.round((currentIndex / questions.length) * 100);

  useEffect(() => {
    const state = getInitialState();
    if (!state.sessionId) {
      router.push('/');
      return;
    }
    setSessionId(state.sessionId);
    setResponses(state.behavioralResponses);
    setCurrentIndex(state.behavioralResponses.length);
  }, [router]);

  useEffect(() => {
    startTimeRef.current = Date.now();
    setSelectedValue(null);
  }, [currentIndex]);

  const handleSelect = async (value: number) => {
    if (!currentQuestion || !sessionId || animating) return;

    setSelectedValue(value);
    setAnimating(true);

    const responseTime = Date.now() - startTimeRef.current;

    const newResponse: DiagnosticResponse = {
      question_id: currentQuestion.id,
      value,
      skipped: false,
      response_time_ms: responseTime,
    };

    await supabase.from('bo_v1_diagnostic_responses').insert({
      session_id: sessionId,
      question_id: currentQuestion.id,
      value,
      skipped: false,
      response_time_ms: responseTime,
    });

    const newResponses = [...responses, newResponse];
    setResponses(newResponses);

    const state = getInitialState();
    saveState({ ...state, behavioralResponses: newResponses });

    setTimeout(() => {
      setAnimating(false);
      if (currentIndex + 1 >= questions.length) {
        supabase.from('bo_v1_sessions').update({ 
          behavioral_completed: true,
          completed_at: new Date().toISOString()
        }).eq('id', sessionId);
        saveState({ ...state, behavioralResponses: newResponses, stage: 'experiential' });
        router.push('/assessment/experiential');
      } else {
        setCurrentIndex(currentIndex + 1);
      }
    }, 400);
  };

  const handleSkip = async () => {
    if (!currentQuestion || !sessionId || animating) return;

    setAnimating(true);

    const newResponse: DiagnosticResponse = {
      question_id: currentQuestion.id,
      value: 3,
      skipped: true,
    };

    await supabase.from('bo_v1_diagnostic_responses').insert({
      session_id: sessionId,
      question_id: currentQuestion.id,
      value: null,
      skipped: true,
    });

    const newResponses = [...responses, newResponse];
    setResponses(newResponses);

    const state = getInitialState();
    saveState({ ...state, behavioralResponses: newResponses });

    setTimeout(() => {
      setAnimating(false);
      if (currentIndex + 1 >= questions.length) {
        supabase.from('bo_v1_sessions').update({ 
          behavioral_completed: true,
          completed_at: new Date().toISOString()
        }).eq('id', sessionId);
        saveState({ ...state, behavioralResponses: newResponses, stage: 'experiential' });
        router.push('/assessment/experiential');
      } else {
        setCurrentIndex(currentIndex + 1);
      }
    }, 300);
  };

  const skipBehavioral = async () => {
    if (!sessionId) return;
    await supabase.from('bo_v1_sessions').update({ 
      behavioral_skipped: true,
      completed_at: new Date().toISOString()
    }).eq('id', sessionId);
    const state = getInitialState();
    saveState({ ...state, stage: 'experiential' });
    router.push('/assessment/experiential');
  };

  if (!currentQuestion) {
    return (
      <div className="min-h-screen bg-slate-900 flex items-center justify-center">
        <div className="animate-spin h-8 w-8 border-2 border-pink-500 border-t-transparent rounded-full" />
      </div>
    );
  }

  const dimensionLabels: Record<string, string> = {
    structure: 'Scaffolding Need',
    consistency: 'Routine Stability',
    social: 'Learning Mode',
    depth: 'Learning Orientation',
  };

  return (
    <main className="min-h-screen bg-gradient-to-br from-slate-900 via-slate-900 to-pink-950 flex flex-col">
      <header className="p-4 flex items-center justify-between">
        <div className="flex items-center gap-2">
          <span className="text-pink-400 text-sm font-medium">Behavioral</span>
          <span className="text-slate-600">•</span>
          <span className="text-slate-500 text-sm">{dimensionLabels[currentQuestion.dimension]}</span>
        </div>
        <div className="flex items-center gap-4">
          <div className="text-slate-500 text-sm">
            {currentIndex + 1} / {questions.length}
          </div>
          <button
            onClick={skipBehavioral}
            className="text-slate-500 hover:text-slate-300 text-sm transition-colors"
          >
            Skip section →
          </button>
        </div>
      </header>

      <div className="px-4">
        <div className="h-1 bg-slate-800 rounded-full overflow-hidden">
          <div
            className="h-full bg-gradient-to-r from-pink-500 to-rose-500 transition-all duration-300"
            style={{ width: `${progress}%` }}
          />
        </div>
      </div>

      <div className="flex-1 flex flex-col items-center justify-center p-6">
        <div className={`max-w-xl w-full transition-all duration-300 ${animating ? 'opacity-0 translate-y-4' : 'opacity-100'}`}>
          <div className="bg-slate-800/50 rounded-2xl p-8 border border-slate-700/50 mb-8">
            <p className="text-xl text-slate-100 leading-relaxed text-center">
              &ldquo;{currentQuestion.text}&rdquo;
            </p>
          </div>

          <div className="space-y-3">
            {LIKERT_OPTIONS.map((option) => (
              <button
                key={option.value}
                onClick={() => handleSelect(option.value)}
                disabled={animating}
                className={`w-full p-4 rounded-xl border transition-all ${
                  selectedValue === option.value
                    ? 'bg-pink-500/20 border-pink-500 text-pink-300'
                    : 'bg-slate-800/30 border-slate-700 text-slate-300 hover:bg-slate-800/50 hover:border-slate-600'
                } disabled:opacity-50`}
              >
                <div className="flex items-center gap-4">
                  <div className={`w-6 h-6 rounded-full border-2 flex items-center justify-center ${
                    selectedValue === option.value ? 'border-pink-500 bg-pink-500' : 'border-slate-600'
                  }`}>
                    {selectedValue === option.value && (
                      <svg className="w-4 h-4 text-white" fill="currentColor" viewBox="0 0 20 20">
                        <path fillRule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clipRule="evenodd" />
                      </svg>
                    )}
                  </div>
                  <span className="flex-1 text-left">{option.label}</span>
                  <span className="text-slate-600 text-sm">{option.value}</span>
                </div>
              </button>
            ))}
          </div>

          <div className="mt-6 text-center">
            <button
              onClick={handleSkip}
              disabled={animating}
              className="text-slate-500 hover:text-slate-400 text-sm transition-colors disabled:opacity-50"
            >
              Skip this question →
            </button>
          </div>
        </div>
      </div>

      <div className="p-4 flex justify-center gap-1">
        {questions.map((_, i) => (
          <div
            key={i}
            className={`w-2 h-2 rounded-full transition-all ${
              i < currentIndex ? 'bg-pink-500' :
              i === currentIndex ? 'bg-pink-400 w-4' :
              'bg-slate-700'
            }`}
          />
        ))}
      </div>
    </main>
  );
}
