import React, { useState, useEffect, useRef } from 'react';
import { Scenario } from './types';
import Button from './Button';
import { motion, AnimatePresence } from 'framer-motion';
import { ArrowRight } from 'lucide-react';

interface ScenarioSliderProps {
    scenario: Scenario;
    currentIndex: number;
    total: number;
    onNext: (value: number) => void;
}

const ScenarioSlider: React.FC<ScenarioSliderProps> = ({ scenario, currentIndex, total, onNext }) => {
    const [value, setValue] = useState(50);
    const [hasInteracted, setHasInteracted] = useState(false);

    // Reset state when scenario changes
    useEffect(() => {
        setValue(50);
        setHasInteracted(false);
    }, [scenario.id]);

    const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        setValue(Number(e.target.value));
        setHasInteracted(true);
    };

    const handleNext = () => {
        if (hasInteracted) {
            onNext(value);
        }
    };

    // Calculate percentage for progress bar
    const progressPercent = Math.round(((currentIndex) / total) * 100);

    // Helper to determine active state of labels
    const isNeutral = Math.abs(value - 50) <= 10;
    const isLeft = value < 50;
    const isStrongLeft = value < 25;
    const isStrongRight = value > 75;

    return (
        <div className="w-full max-w-2xl mx-auto px-6 flex flex-col h-full justify-center min-h-[600px]">

            {/* Header Info */}
            <div className="flex justify-between items-end mb-8">
                <div>
                    <span className="text-gray-500 font-display font-bold tracking-widest text-sm uppercase">
                        Question {currentIndex + 1} of {total}
                    </span>
                </div>
                <div className="flex items-center space-x-2">
                    <div className="w-32 h-2 bg-surfaceHighlight rounded-full overflow-hidden border border-white/5">
                        <div
                            className="h-full bg-gradient-to-r from-primary to-accent transition-all duration-500"
                            style={{ width: `${progressPercent}%` }}
                        ></div>
                    </div>
                    <span className="text-xs font-mono text-gray-500">{progressPercent}%</span>
                </div>
            </div>

            <AnimatePresence mode="wait">
                <motion.div
                    key={scenario.id}
                    initial={{ opacity: 0, y: 20 }}
                    animate={{ opacity: 1, y: 0 }}
                    exit={{ opacity: 0, y: -20 }}
                    transition={{ duration: 0.3 }}
                    className="space-y-8"
                >
                    {/* Scenario Question */}
                    <h2 className="text-2xl md:text-3xl font-bold text-white leading-relaxed text-center">
                        {scenario.question}
                    </h2>

                    {/* Option A Box */}
                    <div
                        className={`p-6 rounded-xl border-2 transition-all duration-300 text-center transform ${hasInteracted && isLeft && !isNeutral
                            ? 'bg-gradient-to-br from-[#FF4D6D]/20 to-transparent border-[#FF4D6D] shadow-[0_0_20px_rgba(255,77,109,0.2)] scale-105'
                            : 'bg-surface border-white/10 scale-100'
                            }`}
                    >
                        <p className={`text-lg transition-colors ${hasInteracted && isLeft && !isNeutral ? 'text-white font-medium' : 'text-gray-300'}`}>
                            {scenario.options[0].label}
                        </p>
                    </div>

                    {/* Slider Interaction */}
                    <div className="relative py-6 px-2">
                        {/* Custom Range Input Styling */}
                        <style>{`
              input[type=range]::-webkit-slider-thumb {
                -webkit-appearance: none;
                height: 40px;
                width: 40px;
                border-radius: 50%;
                background: #FFFFFF;
                cursor: grab;
                margin-top: -14px; /* (40px thumb - 12px track) / 2 * -1 = -14px */
                box-shadow: 0 4px 12px rgba(0,0,0,0.5);
                position: relative;
                z-index: 20;
              }
              input[type=range]::-moz-range-thumb {
                height: 40px;
                width: 40px;
                border-radius: 50%;
                background: #FFFFFF;
                cursor: grab;
                border: none;
                box-shadow: 0 4px 12px rgba(0,0,0,0.5);
                position: relative;
                z-index: 20;
              }
              input[type=range]:active::-webkit-slider-thumb {
                cursor: grabbing;
                transform: scale(1.1);
              }
            `}</style>

                        {/* Track Container */}
                        <div className="relative h-3 w-full rounded-full" style={{
                            background: 'linear-gradient(90deg, #FF4D6D 0%, #FFB800 50%, #00D9FF 100%)'
                        }}>
                            {/* Ticks for confidence levels */}
                            <div className="absolute left-[25%] top-1/2 -translate-y-1/2 w-0.5 h-4 bg-black/30 z-0"></div>
                            <div className="absolute left-[50%] top-1/2 -translate-y-1/2 w-0.5 h-6 bg-white/50 z-0"></div>
                            <div className="absolute left-[75%] top-1/2 -translate-y-1/2 w-0.5 h-4 bg-black/30 z-0"></div>
                        </div>

                        <input
                            type="range"
                            min="0"
                            max="100"
                            value={value}
                            onChange={handleChange}
                            className="absolute top-1/2 left-0 -translate-y-1/2 w-full h-3 bg-transparent appearance-none cursor-pointer z-10 focus:outline-none m-0 p-0"
                            aria-label="Preference slider"
                            aria-valuetext={`Preference value: ${value}`}
                        />

                        {/* Confidence Labels */}
                        <div className="flex justify-between items-start mt-6 select-none px-1">
                            <div className={`flex flex-col items-start transition-all duration-300 ${isLeft && !isNeutral ? 'opacity-100 transform scale-105' : 'opacity-40 grayscale'}`}>
                                <span className={`text-[10px] md:text-xs font-bold uppercase tracking-widest ${isStrongLeft ? 'text-[#FF4D6D]' : 'text-gray-400'}`}>Strongly Prefer</span>
                            </div>

                            <div className={`flex flex-col items-center transition-all duration-300 ${isNeutral ? 'opacity-100 transform scale-110' : 'opacity-40 grayscale'}`}>
                                <span className="text-[10px] md:text-xs font-bold uppercase tracking-widest text-[#FFB800]">Neutral</span>
                            </div>

                            <div className={`flex flex-col items-end transition-all duration-300 ${!isLeft && !isNeutral ? 'opacity-100 transform scale-105' : 'opacity-40 grayscale'}`}>
                                <span className={`text-[10px] md:text-xs font-bold uppercase tracking-widest ${isStrongRight ? 'text-[#00D9FF]' : 'text-gray-400'}`}>Strongly Prefer</span>
                            </div>
                        </div>

                        {/* Drag Hint - Only show for first question */}
                        {!hasInteracted && currentIndex === 0 && (
                            <div className="absolute top-[50px] left-1/2 transform -translate-x-1/2 text-center pointer-events-none animate-bounce z-30">
                                <div className="w-0 h-0 border-l-[6px] border-l-transparent border-r-[6px] border-r-transparent border-b-[8px] border-b-white mx-auto mb-1"></div>
                                <span className="text-xs text-background bg-white font-bold uppercase tracking-wider px-2 py-1 rounded shadow-lg">Drag to choose</span>
                            </div>
                        )}
                    </div>

                    {/* Option B Box */}
                    <div
                        className={`p-6 rounded-xl border-2 transition-all duration-300 text-center transform ${hasInteracted && !isLeft && !isNeutral
                            ? 'bg-gradient-to-br from-[#00D9FF]/20 to-transparent border-[#00D9FF] shadow-[0_0_20px_rgba(0,217,255,0.2)] scale-105'
                            : 'bg-surface border-white/10 scale-100'
                            }`}
                    >
                        <p className={`text-lg transition-colors ${hasInteracted && !isLeft && !isNeutral ? 'text-white font-medium' : 'text-gray-300'}`}>
                            {scenario.options[1].label}
                        </p>
                    </div>

                </motion.div>
            </AnimatePresence>

            <div className="mt-12 flex justify-center">
                <Button
                    variant={hasInteracted ? 'primary' : 'secondary'}
                    size="lg"
                    onClick={handleNext}
                    disabled={!hasInteracted}
                    className={`w-40 transition-all duration-300 ${!hasInteracted ? 'opacity-50 grayscale' : 'opacity-100 shadow-neon'}`}
                >
                    Next <ArrowRight size={18} className="ml-2" />
                </Button>
            </div>

        </div>
    );
};

export default ScenarioSlider;
