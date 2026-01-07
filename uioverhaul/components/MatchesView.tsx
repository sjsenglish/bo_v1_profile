import React, { useState } from 'react';
import { UniversityCourse, AppStage } from '../types';
import { motion, AnimatePresence } from 'framer-motion';
import { X, Check, AlertTriangle, Clock, GraduationCap, Star, Banknote, ChevronRight, ArrowLeft, Bookmark, Ban, BookOpen, Target, Shield, Zap } from 'lucide-react';
import Button from './Button';

interface MatchesViewProps {
  courses: UniversityCourse[];
  onNavigate: (stage: AppStage) => void;
}

const MatchesView: React.FC<MatchesViewProps> = ({ courses, onNavigate }) => {
  const [selectedCourse, setSelectedCourse] = useState<UniversityCourse | null>(null);

  // Sorting logic
  const eliteMatches = [...courses]
    .filter(c => c.isRussellGroup)
    .sort((a, b) => b.matchScore - a.matchScore);

  const allMatches = [...courses]
    .sort((a, b) => b.matchScore - a.matchScore);

  // Helper for Tier/Grade Visuals
  const getTierColor = (score: number) => {
    if (score >= 95) return 'text-amber-400 border-amber-400/50 bg-amber-400/10 shadow-neon-accent';
    if (score >= 88) return 'text-cyan-400 border-cyan-400/50 bg-cyan-400/10 shadow-neon';
    return 'text-white border-white/20 bg-white/5';
  };

  const getGrade = (score: number) => {
      if (score >= 95) return 'S';
      if (score >= 88) return 'A';
      return 'B';
  }

  const CourseListItem: React.FC<{ course: UniversityCourse; rank: number; type: 'elite' | 'all' }> = ({ course, rank, type }) => (
    <motion.div 
      initial={{ opacity: 0, x: -20 }}
      animate={{ opacity: 1, x: 0 }}
      transition={{ delay: rank * 0.05 }}
      onClick={() => setSelectedCourse(course)}
      className="group relative mb-3 cursor-pointer"
    >
        {/* Background Hover Effect */}
        <div className="absolute inset-0 bg-white/5 skew-x-[-12deg] rounded-sm opacity-0 group-hover:opacity-100 transition-all duration-300 border border-white/10 group-hover:border-primary/50 group-hover:shadow-[0_0_15px_rgba(99,102,241,0.3)]"></div>
        
        {/* Active Side Bar */}
        <div className="absolute left-0 top-0 bottom-0 w-1 bg-primary scale-y-0 group-hover:scale-y-100 transition-transform duration-300 origin-bottom"></div>

        <div className="relative flex items-center justify-between p-4 z-10">
            <div className="flex items-center space-x-4">
                {/* Stylized Rank Box */}
                <div className="w-10 h-10 flex items-center justify-center bg-[#0B0F19] border border-white/10 skew-x-[-12deg]">
                    <span className="font-display font-bold text-gray-500 skew-x-[12deg] text-lg">#{rank}</span>
                </div>
                
                <div className="flex flex-col">
                    <h4 className="font-display font-bold text-xl text-white group-hover:text-primary transition-colors tracking-wide uppercase">
                        {course.university}
                    </h4>
                    <div className="flex items-center space-x-2">
                        <span className="text-xs font-mono text-gray-400 uppercase tracking-widest">{course.course}</span>
                        {course.isRussellGroup && type === 'all' && (
                            <span className="text-[9px] px-1.5 py-0.5 bg-amber-500/20 text-amber-400 border border-amber-500/30 rounded uppercase font-bold">Elite</span>
                        )}
                    </div>
                </div>
            </div>

            <div className="flex items-center space-x-4">
                 {/* Match Score Indicator */}
                 <div className={`flex flex-col items-end`}>
                    <div className="flex items-baseline space-x-1">
                        <span className={`font-display font-bold text-2xl ${course.matchScore > 90 ? 'text-green-400' : 'text-cyan-400'}`}>
                            {course.matchScore}
                        </span>
                        <span className="text-[10px] text-gray-500 uppercase">MATCH</span>
                    </div>
                 </div>
                 <ChevronRight className="text-gray-600 group-hover:text-white group-hover:translate-x-1 transition-all" size={20} />
            </div>
        </div>
    </motion.div>
  );

  return (
    <div className="min-h-screen bg-background text-white p-4 lg:p-8 font-sans relative overflow-hidden">
      
      {/* Abstract Background for Depth */}
      <div className="fixed inset-0 z-0 pointer-events-none">
         <div className="absolute top-[-10%] left-[20%] w-[500px] h-[500px] bg-primary/20 blur-[150px] rounded-full mix-blend-screen"></div>
         <div className="absolute bottom-[-10%] right-[10%] w-[600px] h-[600px] bg-purple-500/10 blur-[150px] rounded-full mix-blend-screen"></div>
         <div className="absolute inset-0 bg-[url('https://grainy-gradients.vercel.app/noise.svg')] opacity-20"></div>
         {/* Grid Lines */}
         <div className="absolute inset-0 bg-[linear-gradient(rgba(255,255,255,0.03)_1px,transparent_1px),linear-gradient(90deg,rgba(255,255,255,0.03)_1px,transparent_1px)] bg-[size:100px_100px]"></div>
      </div>

      <div className="relative z-10 max-w-7xl mx-auto">
        
        {/* Header / Nav */}
        <div className="flex flex-col md:flex-row md:items-center justify-between mb-12">
            <button 
                onClick={() => onNavigate(AppStage.DASHBOARD)}
                className="group flex items-center text-gray-400 hover:text-white transition-colors mb-4 md:mb-0"
            >
                <div className="w-8 h-8 rounded border border-white/10 flex items-center justify-center mr-3 group-hover:bg-white/10 transition-colors">
                    <ArrowLeft size={16} />
                </div>
                <span className="font-display font-bold tracking-widest uppercase text-sm">Return to Command</span>
            </button>
            
            <div className="text-right">
                <h1 className="text-4xl md:text-5xl font-display font-black uppercase tracking-tighter italic text-transparent bg-clip-text bg-gradient-to-r from-white via-gray-200 to-gray-500">
                    Match Analysis
                </h1>
                <div className="flex items-center justify-end space-x-2 text-xs font-mono text-primary">
                    <span className="animate-pulse">●</span>
                    <span>LIVE DATA FEED // HESA.24.1</span>
                </div>
            </div>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 lg:gap-12">
            
            {/* Left Panel: Elite Matches */}
            <div className="flex flex-col">
                 <div className="flex items-center justify-between mb-6 border-b border-white/10 pb-2">
                    <div className="flex items-center space-x-3">
                        <Star size={20} className="text-amber-400" />
                        <h2 className="text-xl font-display font-bold text-white uppercase tracking-wider">
                            Elite Protocol
                        </h2>
                    </div>
                    <span className="text-[10px] bg-amber-500/20 text-amber-400 px-2 py-1 border border-amber-500/30">RUSSELL GRP ONLY</span>
                 </div>
                 
                 <div className="space-y-2">
                    {eliteMatches.slice(0, 5).map((course, i) => (
                        <CourseListItem key={course.id} course={course} rank={i + 1} type="elite" />
                    ))}
                 </div>
            </div>

            {/* Right Panel: Best Fit (All) */}
            <div className="flex flex-col">
                 <div className="flex items-center justify-between mb-6 border-b border-white/10 pb-2">
                    <div className="flex items-center space-x-3">
                        <Target size={20} className="text-cyan-400" />
                        <h2 className="text-xl font-display font-bold text-white uppercase tracking-wider">
                            Global Scan
                        </h2>
                    </div>
                    <span className="text-[10px] bg-cyan-500/20 text-cyan-400 px-2 py-1 border border-cyan-500/30">ALL UNIVERSITIES</span>
                 </div>

                 <div className="space-y-2">
                    {allMatches.slice(0, 5).map((course, i) => (
                        <CourseListItem key={course.id} course={course} rank={i + 1} type="all" />
                    ))}
                 </div>
            </div>

        </div>
      </div>

      {/* GLASSMORPHIC MODAL OVERLAY */}
      <AnimatePresence>
        {selectedCourse && (
            <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
                {/* Backdrop with Blur */}
                <motion.div 
                    initial={{ opacity: 0 }}
                    animate={{ opacity: 1 }}
                    exit={{ opacity: 0 }}
                    onClick={() => setSelectedCourse(null)}
                    className="absolute inset-0 bg-black/60 backdrop-blur-md"
                />

                {/* Main Modal Card */}
                <motion.div 
                    initial={{ opacity: 0, scale: 0.95, y: 20 }}
                    animate={{ opacity: 1, scale: 1, y: 0 }}
                    exit={{ opacity: 0, scale: 0.95, y: 20 }}
                    className="relative w-full max-w-5xl bg-[#151B2B]/80 backdrop-blur-xl border border-white/10 shadow-[0_0_50px_rgba(0,0,0,0.5)] overflow-hidden flex flex-col max-h-[90vh]"
                    style={{ clipPath: 'polygon(0 0, 100% 0, 100% calc(100% - 20px), calc(100% - 20px) 100%, 0 100%)' }}
                >
                    {/* Decorative Top Line */}
                    <div className="absolute top-0 left-0 w-full h-1 bg-gradient-to-r from-primary via-accent to-primary"></div>
                    
                    {/* Modal Header */}
                    <div className="flex-none p-6 md:p-8 flex justify-between items-start border-b border-white/5 bg-gradient-to-b from-white/5 to-transparent">
                        <div>
                            <div className="flex items-center space-x-3 mb-2">
                                <span className={`flex items-center justify-center w-8 h-8 text-sm font-bold border ${getTierColor(selectedCourse.matchScore)}`}>
                                    {getGrade(selectedCourse.matchScore)}
                                </span>
                                <span className="text-xs font-mono text-gray-400 uppercase tracking-widest">
                                    // MATCH_ID: {selectedCourse.id.padStart(4, '0')}
                                </span>
                            </div>
                            <h2 className="text-3xl md:text-4xl font-display font-black text-white uppercase tracking-wide leading-none mb-1">
                                {selectedCourse.university}
                            </h2>
                            <h3 className="text-xl md:text-2xl font-display text-primary uppercase">
                                {selectedCourse.course}
                            </h3>
                        </div>
                        
                        <div className="flex items-start space-x-6">
                            <div className="text-right hidden md:block">
                                <div className="text-5xl font-display font-bold text-transparent bg-clip-text bg-gradient-to-b from-white to-gray-400">
                                    {selectedCourse.matchScore}%
                                </div>
                                <div className="text-[10px] text-gray-500 uppercase tracking-[0.3em]">Compatibility</div>
                            </div>
                            <button 
                                onClick={() => setSelectedCourse(null)}
                                className="w-10 h-10 flex items-center justify-center bg-white/5 hover:bg-red-500/20 hover:text-red-500 text-gray-400 transition-all border border-white/10 hover:border-red-500/50"
                            >
                                <X size={24} />
                            </button>
                        </div>
                    </div>

                    {/* Modal Body (Scrollable) */}
                    <div className="flex-1 overflow-y-auto p-6 md:p-8 grid grid-cols-1 lg:grid-cols-12 gap-8 custom-scrollbar">
                        
                        {/* Left: Analysis Data (8 cols) */}
                        <div className="lg:col-span-8 space-y-8">
                            
                            {/* Match Reasons */}
                            <div className="bg-white/[0.02] border border-white/5 p-6 relative overflow-hidden group">
                                <div className="absolute top-0 right-0 p-4 opacity-10 group-hover:opacity-20 transition-opacity">
                                    <Shield size={100} />
                                </div>
                                <h4 className="text-sm font-bold text-green-400 uppercase tracking-widest mb-4 flex items-center">
                                    <Check size={16} className="mr-2" /> Match Analysis
                                </h4>
                                <ul className="space-y-3 relative z-10">
                                    {selectedCourse.matchReasons.map((reason, i) => (
                                        <li key={i} className="flex items-start">
                                            <div className="mt-1.5 w-1.5 h-1.5 bg-green-400 shadow-[0_0_5px_rgba(74,222,128,0.8)] mr-3"></div>
                                            <span className="text-gray-300 text-sm leading-relaxed">{reason}</span>
                                        </li>
                                    ))}
                                </ul>
                            </div>

                            {/* Challenges Grid */}
                            <div>
                                <h4 className="text-sm font-bold text-amber-400 uppercase tracking-widest mb-4 flex items-center">
                                    <AlertTriangle size={16} className="mr-2" /> Tactical Advisories
                                </h4>
                                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                                    {selectedCourse.challenges.map((challenge, i) => (
                                        <div key={i} className="bg-amber-500/5 border border-amber-500/20 p-4 relative overflow-hidden">
                                            {/* Decorative diagonal lines */}
                                            <div className="absolute bottom-0 right-0 border-b-[20px] border-r-[20px] border-b-transparent border-r-amber-500/10"></div>
                                            
                                            <div className="flex justify-between items-center mb-2">
                                                <span className="text-amber-200 font-bold text-sm uppercase">{challenge.skill}</span>
                                                <div className="px-2 py-0.5 bg-black/40 rounded text-[10px] font-mono border border-amber-500/20">
                                                    GAP: {challenge.required - challenge.user}
                                                </div>
                                            </div>
                                            <p className="text-xs text-gray-400 leading-relaxed mb-3">{challenge.description}</p>
                                            
                                            {/* Stat Bar */}
                                            <div className="w-full h-1 bg-gray-800 flex">
                                                <div className="bg-gray-600 h-full" style={{ width: `${challenge.user}%` }}></div>
                                                <div className="bg-amber-500 h-full animate-pulse" style={{ width: `${challenge.required - challenge.user}%` }}></div>
                                            </div>
                                            <div className="flex justify-between text-[9px] font-mono text-gray-500 mt-1">
                                                <span>YOU: {challenge.user}</span>
                                                <span>REQ: {challenge.required}</span>
                                            </div>
                                        </div>
                                    ))}
                                </div>
                            </div>
                        </div>

                        {/* Right: Stats Panel (4 cols) */}
                        <div className="lg:col-span-4 space-y-4">
                            <div className="bg-surface border border-white/10 p-5">
                                <h4 className="text-xs font-bold text-gray-500 uppercase tracking-widest mb-4 pb-2 border-b border-white/5">
                                    Course Intel
                                </h4>
                                <div className="space-y-4">
                                    <StatRow icon={<Clock size={16} />} label="Duration" value={selectedCourse.details.duration} />
                                    <StatRow icon={<GraduationCap size={16} />} label="Entry" value={selectedCourse.details.entry} highlight />
                                    <StatRow icon={<BookOpen size={16} />} label="Assessment" value={selectedCourse.details.assessment} />
                                    <div className="pt-4 border-t border-white/5">
                                        <div className="flex justify-between items-center mb-1">
                                            <div className="flex items-center text-gray-400 text-sm">
                                                <Star size={16} className="mr-2 text-primary" /> Satisfaction
                                            </div>
                                            <span className="text-white font-mono">{selectedCourse.details.satisfaction}</span>
                                        </div>
                                        <div className="w-full bg-gray-800 h-1.5">
                                            <div className="bg-primary h-full shadow-[0_0_10px_rgba(99,102,241,0.5)]" style={{ width: selectedCourse.details.satisfaction }}></div>
                                        </div>
                                    </div>
                                    <div className="flex items-center justify-between pt-2">
                                        <div className="flex items-center text-gray-400 text-sm">
                                            <Banknote size={16} className="mr-2 text-green-400" /> Salary
                                        </div>
                                        <span className="font-mono text-green-400 font-bold">{selectedCourse.details.avgSalary}</span>
                                    </div>
                                </div>
                            </div>

                            <div className="grid grid-cols-2 gap-3 pt-4">
                                <Button variant="secondary" size="sm" className="w-full text-xs">
                                    <Bookmark size={14} className="mr-2" /> Save
                                </Button>
                                <Button variant="ghost" size="sm" className="w-full text-xs text-gray-500 hover:text-red-400 border border-transparent hover:border-red-500/20">
                                    <Ban size={14} className="mr-2" /> Dismiss
                                </Button>
                            </div>
                            <Button variant="primary" className="w-full shadow-neon">
                                INITIATE APPLICATION <ChevronRight size={16} className="ml-2" />
                            </Button>
                        </div>

                    </div>
                </motion.div>
            </div>
        )}
      </AnimatePresence>
    </div>
  );
};

// Helper Subcomponent for Stat Rows
const StatRow: React.FC<{ icon: React.ReactNode; label: string; value: string; highlight?: boolean }> = ({ icon, label, value, highlight }) => (
    <div className="flex items-center justify-between">
        <div className="flex items-center text-gray-400 text-sm">
            <span className="mr-2 opacity-70">{icon}</span> {label}
        </div>
        <span className={`font-mono text-sm ${highlight ? 'text-white bg-white/10 px-2 py-0.5 rounded border border-white/10' : 'text-gray-200'}`}>
            {value}
        </span>
    </div>
);

export default MatchesView;
