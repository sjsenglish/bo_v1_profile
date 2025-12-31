import type { Config } from "tailwindcss";

const config: Config = {
  content: [
    "./src/pages/**/*.{js,ts,jsx,tsx,mdx}",
    "./src/components/**/*.{js,ts,jsx,tsx,mdx}",
    "./src/app/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    extend: {
      /**
       * ARCANE COLOR PALETTE
       */
      colors: {
        arcane: {
          // Background Scale
          'bg-deep': '#011c40',
          'bg-mid': '#023859',
          'bg-light': '#26658c',
          // Primary Accents
          'teal': '#54acbf',
          'ice': '#a7ebf2',
          // Semantic
          'navy': '#011c40',
          'line': '#26658c',
          'muted': '#26658c',
          // Tertiary
          'gold': '#d4a55a',
        },
      },
      
      /**
       * ARCANE FONTS
       */
      fontFamily: {
        sans: ['Inter', 'system-ui', 'sans-serif'],
        serif: ['Libre Baskerville', 'Georgia', 'serif'],
      },
      
      /**
       * ARCANE ANIMATIONS
       */
      animation: {
        // Loader Animations
        'arcane-spin-chase': 'arcane-spin-chase 2s cubic-bezier(0.4, 0, 0.2, 1) infinite',
        'arcane-spin-chase-reverse': 'arcane-spin-chase-reverse 1.5s cubic-bezier(0.4, 0, 0.2, 1) infinite',
        'arcane-pulse-glow': 'arcane-pulse-glow 3s ease-in-out infinite',
        // Card Animations
        'arcane-bounce-subtle': 'arcane-bounce-subtle 4s ease-in-out infinite',
        // Particle Animations
        'arcane-float': 'arcane-float 15s ease-in-out infinite',
        // Entrance Animations
        'arcane-fade-in': 'arcane-fade-in 0.5s ease-out',
        'arcane-slide-up': 'arcane-slide-up 0.6s ease-out',
        'arcane-scale-in': 'arcane-scale-in 0.4s ease-out',
      },
      
      keyframes: {
        'arcane-spin-chase': {
          '0%': { transform: 'rotate(0deg)' },
          '50%': { transform: 'rotate(280deg)' },
          '100%': { transform: 'rotate(360deg)' },
        },
        'arcane-spin-chase-reverse': {
          '0%': { transform: 'rotate(360deg)' },
          '50%': { transform: 'rotate(80deg)' },
          '100%': { transform: 'rotate(0deg)' },
        },
        'arcane-pulse-glow': {
          '0%, 100%': { 
            transform: 'scale(1.5) rotate(45deg)', 
            opacity: '1',
            filter: 'drop-shadow(0 0 10px #54acbf)',
          },
          '50%': { 
            transform: 'scale(1.8) rotate(45deg)', 
            opacity: '0.7',
            filter: 'drop-shadow(0 0 25px #54acbf)',
          },
        },
        'arcane-bounce-subtle': {
          '0%, 100%': { transform: 'translateY(0)' },
          '50%': { transform: 'translateY(-10px)' },
        },
        'arcane-float': {
          '0%, 100%': { 
            transform: 'translateY(0) translateX(0)',
            opacity: '0.3',
          },
          '50%': { 
            transform: 'translateY(-30px) translateX(10px)',
            opacity: '0.6',
          },
        },
        'arcane-fade-in': {
          '0%': { opacity: '0' },
          '100%': { opacity: '1' },
        },
        'arcane-slide-up': {
          '0%': { 
            opacity: '0',
            transform: 'translateY(20px)',
          },
          '100%': { 
            opacity: '1',
            transform: 'translateY(0)',
          },
        },
        'arcane-scale-in': {
          '0%': { 
            opacity: '0',
            transform: 'scale(0.95)',
          },
          '100%': { 
            opacity: '1',
            transform: 'scale(1)',
          },
        },
      },
      
      /**
       * ARCANE BOX SHADOWS
       */
      boxShadow: {
        'arcane-teal': '0 0 30px rgba(84, 172, 191, 0.4)',
        'arcane-ice': '0 0 20px rgba(167, 235, 242, 0.3)',
        'arcane-gold': '0 0 25px rgba(212, 165, 90, 0.3)',
      },
      
      /**
       * ARCANE GRADIENTS (via backgroundImage)
       */
      backgroundImage: {
        'arcane-gradient': 'linear-gradient(135deg, #011c40 0%, #023859 50%, #26658c 100%)',
        'arcane-gradient-dark': 'linear-gradient(180deg, #011c40 0%, #023859 100%)',
        'arcane-gradient-radial': 'radial-gradient(ellipse at center, #023859 0%, #011c40 70%)',
      },
    },
  },
  plugins: [],
};

export default config;
