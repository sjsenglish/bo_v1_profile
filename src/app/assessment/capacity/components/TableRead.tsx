// src/app/assessment/capacity/components/TableRead.tsx
'use client';

import { useState } from 'react';
import ReactMarkdown from 'react-markdown';

interface TableReadProps {
  question: string;
  stimulus?: string;
  options: string[];
  onResponse: (response: string) => void;
  disabled: boolean;
}

export default function TableRead({
  question,
  stimulus,
  options,
  onResponse,
  disabled,
}: TableReadProps) {
  const [selected, setSelected] = useState<string | null>(null);

  const handleSelect = (option: string) => {
    if (disabled || selected) return;
    setSelected(option);
    onResponse(option);
  };

  return (
    <div className="space-y-6">
      {/* Table/Stimulus */}
      {stimulus && (
        <div className="bg-[#011c40]/50 border border-[#54acbf]/20 rounded-lg p-4 overflow-x-auto">
          <div className="prose prose-invert prose-sm max-w-none text-[#f8f5f0]/90
            prose-table:border-collapse 
            prose-th:border prose-th:border-[#54acbf]/30 prose-th:bg-[#54acbf]/10 prose-th:p-2 prose-th:text-[#54acbf]
            prose-td:border prose-td:border-[#54acbf]/20 prose-td:p-2 prose-td:text-[#f8f5f0]/80
          ">
            <ReactMarkdown>{stimulus}</ReactMarkdown>
          </div>
        </div>
      )}

      {/* Question */}
      <div className="text-center">
        <h3 className="text-xl text-[#f8f5f0] leading-relaxed">{question}</h3>
      </div>

      {/* Options Grid */}
      <div className="grid grid-cols-2 gap-3 mt-6">
        {options.map((option) => {
          const isSelected = selected === option;
          
          return (
            <button
              key={option}
              onClick={() => handleSelect(option)}
              disabled={disabled || selected !== null}
              className={`
                py-4 px-6 rounded-lg border-2 text-left
                transition-all duration-200
                disabled:cursor-not-allowed
                ${isSelected
                  ? 'bg-[#54acbf] border-[#54acbf] text-[#011c40] shadow-[0_0_20px_rgba(84,172,191,0.4)]'
                  : 'bg-transparent border-[#54acbf]/40 text-[#f8f5f0] hover:border-[#54acbf] hover:bg-[#54acbf]/10'
                }
              `}
            >
              {option}
            </button>
          );
        })}
      </div>

      {/* Hint */}
      {!selected && !disabled && (
        <p className="text-center text-[#54acbf]/50 text-sm mt-4">
          Read the table carefully, then select your answer
        </p>
      )}
    </div>
  );
}
