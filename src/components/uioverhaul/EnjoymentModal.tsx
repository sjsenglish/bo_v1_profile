import React, { useState } from 'react';
import { motion } from 'framer-motion';
import Button from './Button';

interface EnjoymentModalProps {
    onContinue: () => void;
}

const EnjoymentModal: React.FC<EnjoymentModalProps> = ({ onContinue }) => {
    const [taskRating, setTaskRating] = useState<string | null>(null);
    const [dailyRating, setDailyRating] = useState<string | null>(null);

    const taskOptions = [
        { value: 'hated', emoji: '😫', label: 'Hated it' },
        { value: 'fine', emoji: '😐', label: 'Fine' },
        { value: 'loved', emoji: '😊', label: 'Loved it' },
    ];

    const dailyOptions = [
        { value: 'no', emoji: '😫', label: 'No way' },
        { value: 'maybe', emoji: '😐', label: 'Maybe' },
        { value: 'yes', emoji: '😊', label: 'Definitely' },
    ];

    const RatingGroup = ({ title, options, selected, onSelect }: any) => (
        <div className="mb-8">
            <h4 className="text-gray-300 font-medium mb-4">{title}</h4>
            <div className="flex justify-center space-x-3">
                {options.map((opt: any) => (
                    <button
                        key={opt.value}
                        onClick={() => onSelect(opt.value)}
                        className={`flex flex-col items-center justify-center w-20 h-20 rounded-full border-2 transition-all duration-200 group ${selected === opt.value
                                ? 'bg-white/10 border-accent scale-110 shadow-neon-accent'
                                : 'bg-black/20 border-white/5 hover:border-white/20 hover:bg-white/5'
                            }`}
                    >
                        <span className="text-2xl mb-1 transition-transform group-hover:scale-110">{opt.emoji}</span>
                        <span className={`text-[10px] font-bold uppercase tracking-wide ${selected === opt.value ? 'text-white' : 'text-gray-500'}`}>
                            {opt.label}
                        </span>
                    </button>
                ))}
            </div>
        </div>
    );

    return (
        <div className="absolute inset-0 z-50 flex items-center justify-center bg-black/90 backdrop-blur-md p-4">
            <motion.div
                initial={{ opacity: 0, scale: 0.9, y: 20 }}
                animate={{ opacity: 1, scale: 1, y: 0 }}
                className="bg-surface border border-white/10 rounded-3xl shadow-2xl p-8 max-w-md w-full text-center relative overflow-hidden"
            >
                <div className="absolute top-0 left-0 w-full h-1 bg-gradient-to-r from-transparent via-accent to-transparent"></div>

                <h3 className="text-2xl font-display font-bold text-white mb-8">Feedback</h3>

                <RatingGroup
                    title="How did you find that task?"
                    options={taskOptions}
                    selected={taskRating}
                    onSelect={setTaskRating}
                />

                <div className="w-full h-px bg-white/5 mb-8"></div>

                <RatingGroup
                    title="Could you see yourself doing this daily?"
                    options={dailyOptions}
                    selected={dailyRating}
                    onSelect={setDailyRating}
                />

                <Button
                    variant="accent"
                    size="lg"
                    className="w-full mt-4"
                    disabled={!taskRating || !dailyRating}
                    onClick={onContinue}
                >
                    Continue
                </Button>

            </motion.div>
        </div>
    );
};

export default EnjoymentModal;
