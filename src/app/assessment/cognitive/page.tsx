// src/app/assessment/cognitive/page.tsx
'use client';

import { useState, useEffect, useRef } from 'react';
import { useRouter } from 'next/navigation';
import { getCognitiveQuestions } from '@/lib/questions';
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

export default function CognitiveQuestionsPage() {
  const router = useRouter();
  const [currentIndex, setCurrentIndex] = useState(0);
  const [responses, setResponses] = useState<DiagnosticResponse[]>([]);
  const [sessionId, setSessionId] = useState<string | null>(null);
  const [selectedValue, setSelectedValue] = useState<number | null>(null);
  const [animating, setAnimating] = useState(false);
  const startTimeRef = useRef<number>(Date.now());

  const questions = getCognitiveQuestions();
  const currentQuestion = questions[currentIndex];
  const progress = Math.round((currentIndex / questions.length) * 100);

  useEffect(() => {
    const state = getInitialState();
    if (!state.sessionId) {
      router.push('/');
      return;
    }
    setSessionId(state.sessionId);
    setResponses(state.cognitiveResponses);
    setCurrentIndex(state.cognitiveResponses.length);
  }, [router]);

  useEffect(() => {
    // Reset start time when question changes
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

    // Save to Supabase
    await supabase.from('bo_v1_diagnostic_responses').insert({
      session_id: sessionId,
      question_id: currentQuestion.id,
      value,
      skipped: false,
      response_time_ms: responseTime,
    });

    const newResponses = [...responses, newResponse];
    setResponses(newResponses);

    // Save state
    const state = getInitialState();
    saveState({ ...state, cognitiveResponses: newResponses });

    // Move to next after brief delay
    setTimeout(() => {
      setAnimating(false);
      if (currentIndex + 1 >= questions.length) {
        // Complete cognitive stage
        supabase.from('bo_v1_sessions').update({ 
          cognitive_completed: true,
          questions_answered: newResponses.length 
        }).eq('id', sessionId);
        saveState({ ...state, cognitiveResponses: newResponses, stage: 'behavioral' });
        router.push('/assessment/behavioral');
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
      value: 3, // Default to neutral
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
    saveState({ ...state, cognitiveResponses: newResponses });

    setTimeout(() => {
      setAnimating(false);
      if (currentIndex + 1 >= questions.length) {
        supabase.from('bo_v1_sessions').update({ 
          cognitive_completed: true,
          questions_answered: newResponses.filter(r => !r.skipped).length,
          questions_skipped: newResponses.filter(r => r.skipped).length
        }).eq('id', sessionId);
        saveState({ ...state, cognitiveResponses: newResponses, stage: 'behavioral' });
        router.push('/assessment/behavioral');
      } else {
        setCurrentIndex(currentIndex + 1);
      }
    }, 300);
  };

  if (!currentQuestion) {
    return (
      <div className="min-h-screen bg-slate-900 flex items-center justify-center">
        <div className="animate-spin h-8 w-8 border-2 border-cyan-500 border-t-transparent rounded-full" />
      </div>
    );
  }

  // Get dimension for display
  const dimensionLabels: Record<string, string> = {
    calibration: 'Self-Monitoring',
    tolerance: 'Productive Struggle',
    transfer: 'Pattern Recognition',
    precision: 'Error Sensitivity',
    retrieval: 'Recall Discipline',
    receptivity: 'Feedback Comfort',
  };

  return (
    <main className="min-h-screen bg-gradient-to-br from-slate-900 via-slate-900 to-cyan-950 flex flex-col">
      {/* Header */}
      <header className="p-4 flex items-center justify-between">
        <div className="flex items-center gap-2">
          <span className="text-cyan-400 text-sm font-medium">Cognitive</span>
          <span className="text-slate-600">•</span>
          <span className="text-slate-500 text-sm">{dimensionLabels[currentQuestion.dimension]}</span>
        </div>
        <div className="text-slate-500 text-sm">
          {currentIndex + 1} / {questions.length}
        </div>
      </header>

      {/* Progress bar */}
      <div className="px-4">
        <div className="h-1 bg-slate-800 rounded-full overflow-hidden">
          <div
            className="h-full bg-gradient-to-r from-cyan-500 to-blue-500 transition-all duration-300"
            style={{ width: `${progress}%` }}
          />
        </div>
      </div>

      {/* Question area */}
      <div className="flex-1 flex flex-col items-center justify-center p-6">
        <div className={`max-w-xl w-full transition-all duration-300 ${animating ? 'opacity-0 translate-y-4' : 'opacity-100'}`}>
          {/* Question card */}
          <div className="bg-slate-800/50 rounded-2xl p-8 border border-slate-700/50 mb-8">
            <p className="text-xl text-slate-100 leading-relaxed text-center">
              "{currentQuestion.text}"
            </p>
          </div>

          {/* Likert scale */}
          <div className="space-y-3">
            {LIKERT_OPTIONS.map((option) => (
              <button
                key={option.value}
                onClick={() => handleSelect(option.value)}
                disabled={animating}
                className={`w-full p-4 rounded-xl border transition-all ${
                  selectedValue === option.value
                    ? 'bg-cyan-500/20 border-cyan-500 text-cyan-300'
                    : 'bg-slate-800/30 border-slate-700 text-slate-300 hover:bg-slate-800/50 hover:border-slate-600'
                } disabled:opacity-50`}
              >
                <div className="flex items-center gap-4">
                  <div className={`w-6 h-6 rounded-full border-2 flex items-center justify-center ${
                    selectedValue === option.value ? 'border-cyan-500 bg-cyan-500' : 'border-slate-600'
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

          {/* Skip button */}
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

      {/* Progress indicator */}
      <div className="p-4 flex justify-center gap-1">
        {questions.slice(Math.max(0, currentIndex - 5), currentIndex + 6).map((_, i) => {
          const actualIndex = Math.max(0, currentIndex - 5) + i;
          return (
            <div
              key={actualIndex}
              className={`w-2 h-2 rounded-full transition-all ${
                actualIndex < currentIndex ? 'bg-cyan-500' :
                actualIndex === currentIndex ? 'bg-cyan-400 w-4' :
                'bg-slate-700'
              }`}
            />
          );
        })}
      </div>
    </main>
  );
}
