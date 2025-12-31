// src/app/assessment/capacity/components/BinaryRapid.tsx
'use client';

import { useState } from 'react';
import ReactMarkdown from 'react-markdown';

interface BinaryRapidProps {
  question: string;
  stimulus?: string;
  options: string[];
  onResponse: (response: string) => void;
  disabled: boolean;
}

export default function BinaryRapid({
  question,
  stimulus,
  options,
  onResponse,
  disabled,
}: BinaryRapidProps) {
  const [selected, setSelected] = useState<string | null>(null);

  const handleSelect = (option: string) => {
    if (disabled || selected) return;
    setSelected(option);
    onResponse(option);
  };

  // Determine button styling based on option content
  const getButtonStyle = (option: string, index: number) => {
    const isSelected = selected === option;
    const baseClasses = `
      flex-1 py-6 px-8 rounded-lg border-2 text-xl font-semibold
      transition-all duration-200 
      disabled:cursor-not-allowed
    `;

    if (isSelected) {
      return `${baseClasses} bg-[#54acbf] border-[#54acbf] text-[#011c40] shadow-[0_0_30px_rgba(84,172,191,0.4)]`;
    }

    // Left option (index 0) - typically positive/yes
    if (index === 0) {
      return `${baseClasses} bg-transparent border-[#54acbf]/60 text-[#54acbf] hover:border-[#54acbf] hover:bg-[#54acbf]/10`;
    }

    // Right option (index 1) - typically negative/no
    return `${baseClasses} bg-transparent border-[#54acbf]/60 text-[#54acbf] hover:border-[#54acbf] hover:bg-[#54acbf]/10`;
  };

  return (
    <div className="space-y-6">
      {/* Stimulus (if present) */}
      {stimulus && (
        <div className="bg-[#011c40]/50 border border-[#54acbf]/20 rounded-lg p-4">
          <div className="prose prose-invert prose-sm max-w-none text-[#f8f5f0]/90">
            <ReactMarkdown>{stimulus}</ReactMarkdown>
          </div>
        </div>
      )}

      {/* Question */}
      <div className="text-center">
        <h3 className="text-xl text-[#f8f5f0] leading-relaxed">{question}</h3>
      </div>

      {/* Binary Options */}
      <div className="flex gap-4 mt-8">
        {options.map((option, index) => (
          <button
            key={option}
            onClick={() => handleSelect(option)}
            disabled={disabled || selected !== null}
            className={getButtonStyle(option, index)}
          >
            {option}
          </button>
        ))}
      </div>

      {/* Hint */}
      {!selected && !disabled && (
        <p className="text-center text-[#54acbf]/50 text-sm mt-4">
          Tap your answer quickly
        </p>
      )}
    </div>
  );
}
