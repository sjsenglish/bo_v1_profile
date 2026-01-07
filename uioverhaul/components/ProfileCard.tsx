import React from 'react';
import { UserProfile } from '../types';
import { Lock, Zap, Star, Activity, Eye } from 'lucide-react';
import { motion } from 'framer-motion';

interface ProfileCardProps {
  profile: UserProfile;
}

const ProfileCard: React.FC<ProfileCardProps> = ({ profile }) => {
  const isLocked = !profile.familiarUnlocked;

  // Radar Data
  const nodes = [
    { id: 'stem', label: 'STEM', value: profile.clusterStats.stem, angle: 270, color: '#22d3ee' }, // Top
    { id: 'huma', label: 'Humanities', value: profile.clusterStats.humanities, angle: 30, color: '#a855f7' }, // Right-Top
    { id: 'collab', label: 'Collab', value: 65, angle: 90, color: '#4ade80' }, // Right
    { id: 'creative', label: 'Creative', value: 55, angle: 150, color: '#fbbf24' }, // Right-Bot
    { id: 'analyt', label: 'Analytical', value: profile.clusterStats.analytical, angle: 210, color: '#f472b6' }, // Left-Bot
    { id: 'detail', label: 'Detail', value: 73, angle: 330, color: '#94a3b8' }, // Left-Top
  ];

  const sortedNodes = [...nodes].sort((a, b) => b.value - a.value);
  const topTraits = sortedNodes.slice(0, 2);

  const radius = 80;
  const center = 100;
  
  const getCoordinates = (value: number, angleDegrees: number) => {
    const angleRad = (angleDegrees * Math.PI) / 180;
    const distance = 20 + (value / 100) * (radius - 20); // Min radius 20
    return {
      x: center + distance * Math.cos(angleRad),
      y: center + distance * Math.sin(angleRad),
    };
  };

  return (
    <div className="w-full bg-[#0B0F19] rounded-xl border border-white/10 shadow-2xl overflow-hidden relative group">
      {/* 1x3 Grid Layout */}
      <div className="grid grid-cols-1 lg:grid-cols-3 min-h-[280px] divide-y lg:divide-y-0 lg:divide-x divide-white/5">
        
        {/* LEFT COLUMN: Identity & Precision */}
        <div className="p-6 flex flex-col justify-between bg-gradient-to-b from-white/[0.02] to-transparent relative overflow-hidden">
           <div className="absolute top-0 right-0 p-4 opacity-10">
                <Zap size={120} />
           </div>
           
           <div className="relative z-10">
             <div className="flex items-center justify-between mb-3">
                <span className={`px-2 py-0.5 text-[10px] font-bold uppercase tracking-wider rounded border ${
                    profile.tier === 'Foundation' ? 'bg-slate-800/50 border-slate-600 text-slate-300' :
                    profile.tier === 'Standard' ? 'bg-indigo-900/50 border-indigo-500 text-indigo-300' :
                    'bg-amber-900/50 border-amber-500 text-amber-300'
                }`}>
                    {profile.tier}
                </span>
                {profile.familiarUnlocked && (
                    <span className="text-[10px] text-accent font-bold flex items-center bg-accent/10 px-2 py-0.5 rounded-full">
                        <Star size={8} className="mr-1 fill-accent" /> Unlocked
                    </span>
                )}
             </div>
             <h2 className="text-3xl font-display font-bold text-white tracking-wide">{profile.name}</h2>
             <p className="text-xs text-gray-500 mt-1">Student ID: 8842-A</p>
           </div>

           <div className="relative z-10 mt-6">
              <span className="text-indigo-400 text-[10px] font-bold uppercase tracking-widest block mb-1 flex items-center">
                <Zap size={10} className="mr-1" /> Precision Score
              </span>
              <div className="flex items-baseline space-x-1">
                 <span className="text-6xl font-display font-bold text-white tracking-tighter drop-shadow-lg">
                    {profile.precision}
                 </span>
                 <span className="text-2xl text-gray-600 font-display">%</span>
              </div>
              
              <div className="w-full bg-gray-800/50 h-1.5 mt-4 rounded-full overflow-hidden">
                <div className="h-full bg-gradient-to-r from-indigo-500 to-accent w-[42%] relative">
                    <div className="absolute right-0 top-0 bottom-0 w-[2px] bg-white shadow-[0_0_10px_white]"></div>
                </div>
              </div>
              <p className="text-[10px] text-gray-500 mt-2 font-mono">Top 12% of applicants</p>
           </div>
        </div>

        {/* CENTER COLUMN: Spirit Familiar (Valorant Style) */}
        <div className="relative flex flex-col items-center justify-center overflow-hidden bg-[#0D111C] group/familiar cursor-pointer">
           
           {/* Background decorative elements */}
           <div className="absolute inset-0 bg-[url('https://grainy-gradients.vercel.app/noise.svg')] opacity-20 pointer-events-none"></div>
           <div className="absolute top-0 right-0 w-32 h-32 bg-primary/10 blur-[50px] rounded-full"></div>
           <div className="absolute bottom-0 left-0 w-full h-1/2 bg-gradient-to-t from-black/50 to-transparent z-0"></div>
           
           {/* Diagonal slash background for style */}
           <div className="absolute top-[-50%] left-[-50%] w-[200%] h-[200%] bg-gradient-to-tr from-transparent via-white/[0.03] to-transparent transform rotate-45 pointer-events-none"></div>

           {/* Content Container */}
           <div className="relative z-10 flex flex-col items-center w-full h-full p-6 justify-between">
                
                {/* Top Label */}
                <div className="w-full flex justify-between items-start">
                    <div className="flex flex-col">
                        <span className="text-[10px] text-gray-500 font-bold uppercase tracking-[0.2em]">Guild</span>
                        <span className="text-xs font-display font-bold text-indigo-400 uppercase tracking-wider">?</span>
                    </div>
                    {/* Faction/Class Icon */}
                    <div className="w-6 h-6 border border-white/20 rounded-sm flex items-center justify-center bg-white/5">
                        <Eye size={14} className="text-gray-300" />
                    </div>
                </div>

                {/* Main Visual - The "Agent" Icon */}
                <div className="relative w-32 h-32 my-4 transform transition-transform duration-500 group-hover/familiar:scale-110">
                    {isLocked ? (
                        <div className="w-full h-full flex items-center justify-center border-2 border-dashed border-gray-700 rounded-full">
                             <Lock className="text-gray-600 w-8 h-8" />
                        </div>
                    ) : (
                        <svg viewBox="0 0 100 100" className="w-full h-full filter drop-shadow-[0_0_15px_rgba(99,102,241,0.4)]">
                            <defs>
                                <linearGradient id="obsGrad" x1="0%" y1="0%" x2="100%" y2="100%">
                                    <stop offset="0%" stopColor="#fff" />
                                    <stop offset="100%" stopColor="#6366F1" />
                                </linearGradient>
                            </defs>
                            
                            {/* Geometric "Observer" Eye Symbol - Valorant Style Sharpness */}
                            <path d="M50,20 L85,50 L50,80 L15,50 Z" fill="none" stroke="url(#obsGrad)" strokeWidth="2" />
                            <path d="M50,30 L70,50 L50,70 L30,50 Z" fill="#6366F1" opacity="0.3" />
                            <circle cx="50" cy="50" r="12" fill="#fff" />
                            <circle cx="50" cy="50" r="5" fill="#0B0F19" />
                            
                            {/* Tech Accents */}
                            <path d="M10,40 L10,60" stroke="#6366F1" strokeWidth="2" strokeLinecap="square" />
                            <path d="M90,40 L90,60" stroke="#6366F1" strokeWidth="2" strokeLinecap="square" />
                            <rect x="48" y="10" width="4" height="6" fill="#fff" />
                            <rect x="48" y="84" width="4" height="6" fill="#fff" />
                        </svg>
                    )}
                </div>

                {/* Bottom Name Plate */}
                <div className="text-center w-full">
                     <div className="uppercase tracking-[0.3em] text-[9px] text-gray-500 mb-1 font-bold">Familiar Discovered</div>
                     <h3 className={`text-2xl font-display font-black uppercase tracking-wide transform -skew-x-6 ${isLocked ? 'text-gray-700' : 'text-white'}`}>
                        {isLocked ? "LOCKED" : (profile.familiarName || "THE OBSERVER")}
                     </h3>
                     <div className={`h-1 w-24 mx-auto mt-2 ${isLocked ? 'bg-gray-800' : 'bg-primary'}`}></div>
                </div>
           </div>
           
           {/* Border Hover Effect */}
           <div className="absolute inset-0 border-2 border-primary/0 group-hover/familiar:border-primary/30 transition-all duration-300 pointer-events-none"></div>
        </div>

        {/* RIGHT COLUMN: Mini Constellation Radar */}
        <div className="flex flex-col bg-[#0A0C12] h-full min-h-[280px] relative group/radar overflow-hidden">
            {/* Hover Background Glow */}
            <div className="absolute inset-0 bg-indigo-500/0 group-hover/radar:bg-indigo-500/5 transition-colors duration-700 pointer-events-none"></div>

            <div className="px-5 py-3 border-b border-white/5 flex items-center justify-between bg-white/[0.02]">
                <div className="flex items-center space-x-2 text-indigo-400">
                    <Activity size={12} />
                    <span className="text-[10px] font-bold uppercase tracking-widest">Disposition Constellation</span>
                </div>
                <div className="flex space-x-1">
                    <div className="w-1.5 h-1.5 rounded-full bg-white/20"></div>
                    <div className="w-1.5 h-1.5 rounded-full bg-white/20"></div>
                </div>
            </div>

            <div className="flex-1 relative flex flex-col items-center justify-center p-2">
                <div className="relative w-[200px] h-[200px]">
                    {/* Rotating Scanner Effect */}
                    <motion.div 
                        className="absolute inset-0 rounded-full"
                        style={{ background: 'conic-gradient(from 0deg at 50% 50%, rgba(99, 102, 241, 0) 0deg, rgba(99, 102, 241, 0) 300deg, rgba(99, 102, 241, 0.15) 360deg)' }}
                        animate={{ rotate: 360 }}
                        transition={{ duration: 4, repeat: Infinity, ease: "linear" }}
                    />

                    <svg width="200" height="200" viewBox="0 0 200 200" className="overflow-visible relative z-10">
                        <defs>
                            <filter id="mini-glow" x="-50%" y="-50%" width="200%" height="200%">
                                <feGaussianBlur stdDeviation="2" result="coloredBlur" />
                                <feMerge>
                                    <feMergeNode in="coloredBlur" />
                                    <feMergeNode in="SourceGraphic" />
                                </feMerge>
                            </filter>
                        </defs>
                        {/* Rings - Animated Rotation */}
                        {[25, 50, 75].map((r, i) => (
                            <motion.circle 
                                key={i} 
                                cx={center} 
                                cy={center} 
                                r={r} 
                                fill="none" 
                                stroke="white" 
                                strokeOpacity="0.05" 
                                strokeDasharray="3 3"
                                animate={{ rotate: i % 2 === 0 ? 360 : -360 }}
                                transition={{ duration: 30 + i * 10, repeat: Infinity, ease: "linear" }}
                                style={{ originX: "100px", originY: "100px" }}
                            />
                        ))}
                        
                        {/* Constellation Path */}
                        <motion.path
                            d={nodes.map((node, i) => {
                                const coords = getCoordinates(node.value, node.angle);
                                return `${i === 0 ? 'M' : 'L'} ${coords.x} ${coords.y}`;
                            }).join(' ') + ' Z'}
                            fill="rgba(99, 102, 241, 0.1)"
                            stroke="#6366f1"
                            strokeWidth="1.5"
                            strokeOpacity="0.6"
                            initial={{ pathLength: 0, opacity: 0 }}
                            animate={{ pathLength: 1, opacity: 1 }}
                            transition={{ duration: 1.5 }}
                        />

                        {/* Nodes with Pulse */}
                        {nodes.map((node) => {
                            const coords = getCoordinates(node.value, node.angle);
                            return (
                                <g key={node.id}>
                                    <motion.circle 
                                        cx={coords.x} 
                                        cy={coords.y} 
                                        r="3" 
                                        fill={node.color} 
                                        filter="url(#mini-glow)"
                                        animate={{ r: [3, 4, 3], opacity: [0.7, 1, 0.7] }}
                                        transition={{ duration: 2, repeat: Infinity, ease: "easeInOut", delay: Math.random() }}
                                    />
                                </g>
                            );
                        })}
                    </svg>

                    {/* Strongest Trait Indicators */}
                    {topTraits.map((trait, i) => {
                        const coords = getCoordinates(trait.value, trait.angle);
                        // Push label away from center
                        const labelX = center + (radius + 25) * Math.cos((trait.angle * Math.PI) / 180);
                        const labelY = center + (radius + 20) * Math.sin((trait.angle * Math.PI) / 180);
                        
                        return (
                            <motion.div
                                key={trait.id}
                                initial={{ opacity: 0 }}
                                animate={{ opacity: 1 }}
                                transition={{ delay: 1 + i * 0.2 }}
                                className="absolute text-[9px] font-bold text-white bg-[#0A0C12]/80 backdrop-blur-md px-1.5 py-0.5 rounded border border-white/10 whitespace-nowrap"
                                style={{
                                    left: labelX,
                                    top: labelY,
                                    transform: 'translate(-50%, -50%)'
                                }}
                            >
                                <span style={{ color: trait.color }}>•</span> {trait.label}
                            </motion.div>
                        );
                    })}
                </div>
            </div>
            
            {/* Footer Summary */}
            <div className="w-full px-4 py-2 border-t border-white/5 bg-white/[0.02]">
                <div className="flex justify-between items-center text-[10px] text-gray-500">
                    <span className="uppercase tracking-wider font-bold">Primary</span>
                    <span className="text-white font-mono">{topTraits[0].label} & {topTraits[1].label}</span>
                </div>
            </div>
        </div>

      </div>
    </div>
  );
};

export default ProfileCard;