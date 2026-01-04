import React from 'react';
import { motion } from 'framer-motion';
import { UserProfile } from './types';

interface DispositionRadarProps {
    profile: UserProfile;
}

const DispositionRadar: React.FC<DispositionRadarProps> = ({ profile }) => {
    const nodes = [
        { id: 'stem', label: 'STEM', value: profile.clusterStats.stem, angle: 270, color: '#22d3ee' },
        { id: 'huma', label: 'Humanities', value: profile.clusterStats.humanities, angle: 30, color: '#a855f7' },
        { id: 'collab', label: 'Collab', value: 65, angle: 90, color: '#4ade80' },
        { id: 'creative', label: 'Creative', value: 55, angle: 150, color: '#fbbf24' },
        { id: 'analyt', label: 'Analytical', value: profile.clusterStats.analytical, angle: 210, color: '#f472b6' },
        { id: 'detail', label: 'Detail', value: 73, angle: 330, color: '#94a3b8' },
    ];

    const radius = 140;
    const center = 180;

    const getCoordinates = (value: number, angleDegrees: number) => {
        const angleRad = (angleDegrees * Math.PI) / 180;
        const distance = 30 + (value / 100) * (radius - 30);
        return {
            x: center + distance * Math.cos(angleRad),
            y: center + distance * Math.sin(angleRad),
        };
    };

    return (
        <div className="bg-[#0A0C12] rounded-2xl border border-white/10 p-1 shadow-2xl relative overflow-hidden h-[420px] flex flex-col">
            <div className="absolute top-0 left-0 w-full p-4 z-10 text-center border-b border-white/5 bg-gradient-to-b from-[#0A0C12] to-transparent">
                <h3 className="text-sm font-display font-bold uppercase tracking-[0.2em] text-gray-400">Disposition Constellation</h3>
                <div className="w-16 h-0.5 bg-indigo-500/30 mx-auto mt-2 rounded-full"></div>
            </div>

            <div className="flex-1 relative flex items-center justify-center mt-6">
                <svg width="360" height="360" viewBox="0 0 360 360" className="overflow-visible">
                    <defs>
                        <filter id="glow-blur" x="-50%" y="-50%" width="200%" height="200%">
                            <feGaussianBlur stdDeviation="4" result="coloredBlur" />
                            <feMerge>
                                <feMergeNode in="coloredBlur" />
                                <feMergeNode in="SourceGraphic" />
                            </feMerge>
                        </filter>
                        <radialGradient id="centerGradient" cx="50%" cy="50%" r="50%" fx="50%" fy="50%">
                            <stop offset="0%" stopColor="#06b6d4" stopOpacity="0.4" />
                            <stop offset="100%" stopColor="#06b6d4" stopOpacity="0" />
                        </radialGradient>
                    </defs>

                    {[40, 70, 100, 130].map((r, i) => (
                        <circle
                            key={i}
                            cx={center}
                            cy={center}
                            r={r}
                            fill="none"
                            stroke="white"
                            strokeOpacity={0.05 + (i * 0.02)}
                            strokeWidth="1"
                            strokeDasharray={i % 2 === 0 ? "4 4" : "none"}
                            className="transition-all duration-1000 ease-in-out"
                        />
                    ))}

                    <motion.path
                        d={nodes.map((node, i) => {
                            const coords = getCoordinates(node.value, node.angle);
                            return `${i === 0 ? 'M' : 'L'} ${coords.x} ${coords.y}`;
                        }).join(' ') + ' Z'}
                        fill="none"
                        stroke="#6366f1"
                        strokeWidth="1"
                        strokeOpacity="0.2"
                        initial={{ pathLength: 0, opacity: 0 }}
                        animate={{ pathLength: 1, opacity: 1 }}
                        transition={{ duration: 2, ease: "easeInOut" }}
                    />

                    <g>
                        <circle cx={center} cy={center} r="60" fill="url(#centerGradient)" className="animate-pulse" />
                        <circle cx={center} cy={center} r="25" fill="#0B0F19" stroke="#22d3ee" strokeWidth="2" filter="url(#glow-blur)" />
                        <text x={center} y={center} dy=".35em" textAnchor="middle" className="fill-cyan-200 font-display font-bold text-lg tracking-widest">
                            {profile.name.substring(0, 2).toUpperCase()}
                        </text>
                    </g>

                    {nodes.map((node, i) => {
                        const coords = getCoordinates(node.value, node.angle);
                        return (
                            <motion.g
                                key={node.id}
                                initial={{ opacity: 0, scale: 0 }}
                                animate={{
                                    opacity: 1,
                                    scale: 1,
                                    x: coords.x - center,
                                    y: coords.y - center
                                }}
                                transition={{ delay: i * 0.1, duration: 0.5, type: "spring" }}
                                style={{ originX: 0, originY: 0 }}
                            >
                                <motion.g
                                    initial={{ x: center, y: center }}
                                    animate={{
                                        x: coords.x,
                                        y: coords.y,
                                    }}
                                >
                                    <motion.g
                                        animate={{
                                            x: [0, 3, -3, 0],
                                            y: [0, -4, 2, 0],
                                        }}
                                        transition={{
                                            duration: 4 + i,
                                            repeat: Infinity,
                                            repeatType: "mirror",
                                            ease: "easeInOut"
                                        }}
                                    >
                                        <circle
                                            r="16"
                                            fill="none"
                                            stroke={node.color}
                                            strokeWidth="1"
                                            strokeOpacity="0.5"
                                        />
                                        <circle
                                            r="8"
                                            fill={node.color}
                                            filter="url(#glow-blur)"
                                        />
                                        <circle
                                            r="8"
                                            fill={node.color}
                                            stroke="#fff"
                                            strokeWidth="1.5"
                                            strokeOpacity="0.8"
                                        />
                                    </motion.g>
                                </motion.g>
                            </motion.g>
                        );
                    })}
                </svg>
            </div>

            <div className="grid grid-cols-2 gap-2 px-6 pb-6 pt-2">
                <div className="bg-white/5 rounded-lg p-2 border border-white/5 flex items-center justify-between">
                    <span className="text-[10px] uppercase text-gray-500 font-bold">Academic</span>
                    <span className="text-cyan-400 text-xs font-mono font-bold">Strong</span>
                </div>
                <div className="bg-white/5 rounded-lg p-2 border border-white/5 flex items-center justify-between">
                    <span className="text-[10px] uppercase text-gray-500 font-bold">Target Data</span>
                    <span className="text-purple-400 text-xs font-mono font-bold">92%</span>
                </div>
            </div>
        </div>
    );
};

export default DispositionRadar;
