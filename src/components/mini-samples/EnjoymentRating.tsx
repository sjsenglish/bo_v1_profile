// src/components/mini-samples/EnjoymentRating.tsx
'use client';

import { useState } from 'react';

interface EnjoymentRatingProps {
  onSubmit: (rating: number, feedback?: string) => void;
}

const RATINGS = [
  { value: 1, emoji: '😫', label: 'Not for me' },
  { value: 2, emoji: '😐', label: 'Okay' },
  { value: 3, emoji: '😊', label: 'I liked this' },
];

export default function EnjoymentRating({ onSubmit }: EnjoymentRatingProps) {
  const [selectedRating, setSelectedRating] = useState<number | null>(null);
  const [feedback, setFeedback] = useState('');

  const handleSubmit = () => {
    if (selectedRating) {
      onSubmit(selectedRating, feedback.trim() || undefined);
    }
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-[#011c40]/90 backdrop-blur-sm">
      <div className="w-full max-w-md mx-4 p-8 bg-[#011c40] border-2 border-[#26658c] rounded-xl shadow-2xl">

        {/* Header */}
        <h3 className="text-2xl font-bold text-[#a7ebf2] text-center mb-2">
          How did that feel?
        </h3>
        <p className="text-[#54acbf] text-sm text-center mb-8">
          Your honest feedback helps us match you better
        </p>

        {/* Emoji Buttons */}
        <div className="flex justify-center gap-4 mb-8">
          {RATINGS.map((rating) => (
            <button
              key={rating.value}
              onClick={() => setSelectedRating(rating.value)}
              className={`
                flex flex-col items-center gap-2 p-4 rounded-xl
                border-2 transition-all duration-200
                ${selectedRating === rating.value
                  ? 'bg-[#54acbf]/20 border-[#54acbf] scale-110'
                  : 'bg-transparent border-[#26658c] hover:border-[#54acbf]'
                }
              `}
            >
              <span className="text-4xl">{rating.emoji}</span>
              <span className={`
                text-xs uppercase tracking-wider
                ${selectedRating === rating.value ? 'text-[#a7ebf2]' : 'text-[#54acbf]'}
              `}>
                {rating.label}
              </span>
            </button>
          ))}
        </div>

        {/* Optional Feedback */}
        <div className="mb-6">
          <textarea
            value={feedback}
            onChange={(e) => setFeedback(e.target.value.slice(0, 100))}
            placeholder="Any quick thoughts? (optional)"
            maxLength={100}
            className="
              w-full p-3 rounded-lg
              bg-[#011c40] border-2 border-[#26658c]
              text-[#a7ebf2] placeholder-[#26658c]
              focus:outline-none focus:border-[#54acbf]
              resize-none
            "
            rows={2}
          />
          <p className="text-right text-xs text-[#26658c] mt-1">
            {feedback.length}/100
          </p>
        </div>

        {/* Submit Button */}
        <button
          onClick={handleSubmit}
          disabled={!selectedRating}
          className={`
            w-full py-4 rounded-lg font-bold uppercase tracking-wider
            transition-all duration-200
            ${selectedRating
              ? 'bg-[#54acbf] text-[#011c40] hover:bg-[#a7ebf2]'
              : 'bg-[#26658c]/30 text-[#26658c] cursor-not-allowed'
            }
          `}
        >
          Continue
        </button>

      </div>
    </div>
  );
}
