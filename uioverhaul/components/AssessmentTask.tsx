import React, { useState, useEffect } from 'react';
import { Task } from '../types';
import Button from './Button';
import { AlertTriangle, Code, FileText, SkipForward } from 'lucide-react';
import { motion } from 'framer-motion';

interface AssessmentTaskProps {
  task: Task;
  currentTaskIndex: number;
  totalTasks: number;
  onComplete: () => void;
  onSkip: () => void;
}

const CircularTimer: React.FC<{ duration: number; timeLeft: number }> = ({ duration, timeLeft }) => {
  const radius = 20;
  const circumference = 2 * Math.PI * radius;
  const offset = circumference - (timeLeft / duration) * circumference;
  
  let colorClass = "text-success";
  if (timeLeft < 30) colorClass = "text-error";
  else if (timeLeft < 60) colorClass = "text-warning";

  const formatTime = (seconds: number) => {
    const m = Math.floor(seconds / 60);
    const s = seconds % 60;
    return `${m}:${s.toString().padStart(2, '0')}`;
  };

  return (
    <div className="relative flex items-center justify-center">
      <svg className="transform -rotate-90 w-12 h-12">
        <circle
          cx="24"
          cy="24"
          r={radius}
          className="stroke-gray-700"
          strokeWidth="4"
          fill="transparent"
        />
        <circle
          cx="24"
          cy="24"
          r={radius}
          className={`${colorClass} transition-all duration-1000 ease-linear`}
          strokeWidth="4"
          fill="transparent"
          strokeDasharray={circumference}
          strokeDashoffset={offset}
          strokeLinecap="round"
        />
      </svg>
      <span className={`absolute text-[10px] font-bold ${colorClass}`}>
        {timeLeft > 0 ? formatTime(timeLeft) : "0:00"}
      </span>
    </div>
  );
};

const AssessmentTask: React.FC<AssessmentTaskProps> = ({ task, currentTaskIndex, totalTasks, onComplete, onSkip }) => {
  const [timeLeft, setTimeLeft] = useState(task.timeLimit);
  const [selectedOption, setSelectedOption] = useState<string | null>(null);
  const [textResponse, setTextResponse] = useState("");
  const [isOvertime, setIsOvertime] = useState(false);

  // Reset state when task changes
  useEffect(() => {
    setTimeLeft(task.timeLimit);
    setIsOvertime(false);
    setSelectedOption(null);
    setTextResponse("");
  }, [task]);

  // Timer Logic
  useEffect(() => {
    if (timeLeft <= 0) {
      setIsOvertime(true);
      return;
    }
    const timer = setInterval(() => {
      setTimeLeft((prev) => prev - 1);
    }, 1000);
    return () => clearInterval(timer);
  }, [timeLeft]);

  // Validation
  const isValid = task.type === 'MCQ' 
    ? selectedOption !== null 
    : textResponse.length >= 50 && textResponse.length <= 300;

  const progressPercent = Math.round(((currentTaskIndex) / totalTasks) * 100);

  return (
    <div className="flex flex-col h-screen bg-background text-white">
      {/* Header */}
      <div className="flex-none p-6 border-b border-white/10 bg-surface/50 backdrop-blur-md sticky top-0 z-30">
        <div className="max-w-4xl mx-auto flex items-center justify-between">
          <div>
            <div className="text-gray-500 font-display font-bold tracking-widest text-xs uppercase mb-1">
              Task {currentTaskIndex + 1} of {totalTasks}: {task.metaCluster}
            </div>
            <div className="w-48 h-1.5 bg-gray-800 rounded-full overflow-hidden">
                <motion.div 
                    className="h-full bg-gradient-to-r from-primary to-accent"
                    initial={{ width: 0 }}
                    animate={{ width: `${progressPercent}%` }}
                    transition={{ duration: 0.5 }}
                ></motion.div>
            </div>
          </div>
          
          <div className="flex items-center space-x-4">
             {isOvertime && (
                 <span className="text-xs text-red-500 font-bold animate-pulse flex items-center border border-red-500/20 bg-red-500/10 px-2 py-1 rounded">
                    <AlertTriangle size={12} className="mr-1" /> Overtime
                 </span>
             )}
             <CircularTimer duration={task.timeLimit} timeLeft={timeLeft} />
          </div>
        </div>
      </div>

      {/* Main Content */}
      <div className="flex-1 overflow-y-auto custom-scrollbar">
        <div className="max-w-2xl mx-auto p-6 pb-32">
          
          {/* Stimulus Card */}
          <div className="bg-surface rounded-xl border border-white/10 overflow-hidden mb-8 shadow-lg">
             <div className="bg-white/5 px-6 py-3 border-b border-white/5 flex items-center space-x-2">
                {task.type === 'MCQ' ? <Code size={16} className="text-primary" /> : <FileText size={16} className="text-accent" />}
                <span className="text-xs font-bold text-gray-400 uppercase tracking-wider">Stimulus</span>
             </div>
             <div className="p-6">
                <div className="text-gray-200 leading-relaxed whitespace-pre-line text-lg font-medium">
                    {task.stimulus}
                </div>
             </div>
          </div>

          {/* Question Section */}
          <div className="mb-8">
             <h2 className="text-2xl font-bold text-white mb-6 leading-snug">{task.question}</h2>
             
             {task.type === 'MCQ' ? (
                 <div className="space-y-3">
                    {task.options?.map((opt, idx) => (
                        <label 
                            key={idx}
                            className={`flex items-center p-4 rounded-xl border-2 cursor-pointer transition-all duration-200 group ${
                                selectedOption === opt 
                                ? 'bg-primary/10 border-primary shadow-[0_0_15px_rgba(99,102,241,0.2)]' 
                                : 'bg-surface border-white/5 hover:border-white/20'
                            }`}
                        >
                            <div className={`w-6 h-6 rounded-full border-2 flex items-center justify-center mr-4 transition-colors ${
                                selectedOption === opt ? 'border-primary' : 'border-gray-600 group-hover:border-gray-400'
                            }`}>
                                {selectedOption === opt && <div className="w-3 h-3 rounded-full bg-primary" />}
                            </div>
                            <span className={`text-lg ${selectedOption === opt ? 'text-white' : 'text-gray-400 group-hover:text-gray-200'}`}>
                                <input 
                                    type="radio" 
                                    name="mcq-opt" 
                                    className="hidden" 
                                    value={opt} 
                                    onChange={() => setSelectedOption(opt)}
                                />
                                {opt}
                            </span>
                        </label>
                    ))}
                 </div>
             ) : (
                 <div className="relative">
                     <textarea
                        className="w-full bg-surface border border-white/10 rounded-xl p-4 text-white placeholder-gray-600 focus:border-accent focus:ring-1 focus:ring-accent outline-none transition-all resize-none min-h-[160px] text-lg"
                        placeholder="Type your response here..."
                        value={textResponse}
                        onChange={(e) => setTextResponse(e.target.value.slice(0, 300))}
                     />
                     <div className="flex justify-between mt-2 text-xs">
                        <span className={textResponse.length < 50 ? 'text-warning' : 'text-success'}>
                            Min 50 chars
                        </span>
                        <span className="text-gray-500">
                            {textResponse.length} / 300
                        </span>
                     </div>
                 </div>
             )}
          </div>

        </div>
      </div>

      {/* Footer Actions */}
      <div className="flex-none p-6 border-t border-white/10 bg-surface z-40">
        <div className="max-w-2xl mx-auto flex items-center justify-between">
            <Button 
                variant="ghost" 
                size="sm" 
                onClick={onSkip} 
                className="text-gray-500 hover:text-white"
            >
                Skip Task <SkipForward size={16} className="ml-2" />
            </Button>

            <Button 
                variant="primary" 
                size="lg" 
                disabled={!isValid}
                onClick={onComplete}
                className="min-w-[160px]"
            >
                Submit
            </Button>
        </div>
      </div>
    </div>
  );
};

export default AssessmentTask;