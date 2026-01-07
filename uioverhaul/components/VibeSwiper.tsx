import React, { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { VibePair, VibeOption } from '../types';
import Button from './Button';
import { ChevronRight } from 'lucide-react';

interface VibeSwiperProps {
  pairs: VibePair[];
  onComplete: () => void;
}

const VibeSwiper: React.FC<VibeSwiperProps> = ({ pairs, onComplete }) => {
  const [currentIndex, setCurrentIndex] = useState(0);
  
  const currentPair = pairs[currentIndex];
  const progressPercentage = Math.round(((currentIndex) / pairs.length) * 100);

  const handleSelect = (optionId: string) => {
    // In a real app, save the choice here
    advance();
  };

  const advance = () => {
    if (currentIndex >= pairs.length - 1) {
      onComplete();
    } else {
      setCurrentIndex(prev => prev + 1);
    }
  };

  const OptionCard: React.FC<{ option: VibeOption, onClick: () => void }> = ({ option, onClick }) => (
    <motion.div 
      className="relative group cursor-pointer overflow-hidden rounded-2xl border-2 border-white/5 bg-surface hover:border-primary/50 transition-all duration-300 w-full h-[300px] md:h-[400px]"
      whileHover={{ scale: 1.02 }}
      whileTap={{ scale: 0.98 }}
      onClick={onClick}
    >
        {/* Background Image */}
        <div className="absolute inset-0">
            <img 
                src={option.imageUrl} 
                alt={option.label} 
                className="w-full h-full object-cover opacity-60 group-hover:opacity-80 transition-opacity duration-300"
            />
            <div className="absolute inset-0 bg-gradient-to-t from-black via-black/40 to-transparent"></div>
        </div>

        {/* Content */}
        <div className="absolute bottom-0 left-0 w-full p-6 text-left">
            <h3 className="text-2xl font-display font-bold text-white mb-1 group-hover:text-primary transition-colors">{option.label}</h3>
            <p className="text-gray-400 text-sm">{option.description}</p>
            <div className="mt-4 opacity-0 group-hover:opacity-100 transition-opacity transform translate-y-2 group-hover:translate-y-0">
                <span className="inline-block px-4 py-2 bg-primary/20 border border-primary text-primary text-xs font-bold rounded-full uppercase tracking-widest">
                    Tap to Select
                </span>
            </div>
        </div>
        
        {/* Hover Glow */}
        <div className="absolute inset-0 opacity-0 group-hover:opacity-100 transition-opacity pointer-events-none border-2 border-primary rounded-2xl shadow-[inset_0_0_40px_rgba(99,102,241,0.3)]"></div>
    </motion.div>
  );

  return (
    <div className="flex flex-col w-full max-w-5xl mx-auto px-4 h-full py-8 md:py-0 justify-center">
      
      {/* Header */}
      <div className="flex justify-between items-end mb-8 border-b border-white/10 pb-4">
        <div>
            <div className="text-sm font-display font-bold text-gray-400 uppercase tracking-widest mb-1">
                Pair {currentIndex + 1} of {pairs.length}
            </div>
            <h2 className="text-xl md:text-2xl font-bold text-white">{currentPair.question}</h2>
        </div>
        <div className="text-right">
            <div className="flex items-center space-x-1 mb-1 justify-end">
                {/* Progress Visual */}
                <div className="w-32 h-2 bg-gray-800 rounded-full overflow-hidden">
                    <motion.div 
                        className="h-full bg-gradient-to-r from-primary to-accent"
                        initial={{ width: 0 }}
                        animate={{ width: `${progressPercentage}%` }}
                        transition={{ duration: 0.5 }}
                    ></motion.div>
                </div>
                <span className="text-xs font-mono text-gray-500 w-8">{progressPercentage}%</span>
            </div>
        </div>
      </div>

      {/* Main Pair Display */}
      <div className="relative">
        <AnimatePresence mode="wait">
            <motion.div 
                key={currentPair.id}
                initial={{ opacity: 0, x: 50 }}
                animate={{ opacity: 1, x: 0 }}
                exit={{ opacity: 0, x: -50 }}
                transition={{ duration: 0.3 }}
                className="flex flex-col md:flex-row gap-6 md:gap-12 items-center justify-center relative"
            >
                {/* Option A */}
                <div className="w-full md:w-1/2">
                    <OptionCard option={currentPair.options[0]} onClick={() => handleSelect('A')} />
                </div>

                {/* VS Badge */}
                <div className="absolute left-1/2 top-1/2 transform -translate-x-1/2 -translate-y-1/2 z-10 pointer-events-none">
                    <div className="w-12 h-12 md:w-16 md:h-16 rounded-full bg-background border-2 border-white/10 flex items-center justify-center shadow-2xl">
                        <span className="font-display font-black text-gray-500 text-sm md:text-lg italic">VS</span>
                    </div>
                </div>

                {/* Option B */}
                <div className="w-full md:w-1/2">
                    <OptionCard option={currentPair.options[1]} onClick={() => handleSelect('B')} />
                </div>

            </motion.div>
        </AnimatePresence>
      </div>

      {/* Footer Controls */}
      <div className="flex justify-center mt-12">
        <button 
            onClick={advance}
            className="text-gray-500 hover:text-white text-sm font-medium tracking-wide flex items-center transition-colors group px-6 py-3 rounded-full hover:bg-white/5"
        >
            Not sure? Skip this one <ChevronRight size={14} className="ml-1 group-hover:translate-x-1 transition-transform" />
        </button>
      </div>

    </div>
  );
};

export default VibeSwiper;