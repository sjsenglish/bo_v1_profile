import React from 'react';
import { UserProfile, UniversityCourse, AppStage, CareerPath } from '../types';
import ProfileCard from './ProfileCard';
import Button from './Button';
import { Sparkles, Brain, Code, BookOpen, ChevronRight, Activity, Zap, Timer, Lock, Briefcase, TrendingUp } from 'lucide-react';

interface DashboardProps {
  profile: UserProfile;
  courses: UniversityCourse[];
  careers: CareerPath[];
  onNavigate: (stage: AppStage) => void;
}

const ClusterCard: React.FC<{ title: string; score: number; icon: React.ReactNode; color: string }> = ({ title, score, icon, color }) => (
  <div className="bg-surface rounded-xl p-5 border border-white/5 relative overflow-hidden group hover:border-white/10 transition-all">
    <div className={`absolute top-0 right-0 p-3 opacity-20 group-hover:opacity-40 transition-opacity ${color}`}>
      {icon}
    </div>
    <div className="text-gray-400 text-xs font-bold uppercase tracking-widest mb-2">{title}</div>
    <div className="flex items-end space-x-2">
      <span className="text-3xl font-display font-bold text-white">{score}%</span>
      <span className="text-sm text-gray-500 mb-1">Affinity</span>
    </div>
    <div className="w-full bg-gray-800 h-1.5 mt-4 rounded-full overflow-hidden">
      <div className={`h-full rounded-full ${color.replace('text-', 'bg-')}`} style={{ width: `${score}%` }}></div>
    </div>
  </div>
);

const CourseCard: React.FC<{ course: UniversityCourse; onClick: () => void }> = ({ course, onClick }) => (
  <div 
    onClick={onClick}
    className="bg-surface rounded-xl border border-white/5 p-5 hover:border-primary/50 hover:shadow-neon hover:-translate-y-1 transition-all duration-300 group cursor-pointer"
  >
    <div className="flex justify-between items-start mb-3">
      <div className="bg-white/10 text-white text-[10px] font-bold px-2 py-1 rounded uppercase tracking-wider">
        {course.isRussellGroup ? 'Russell Group' : 'Modern'}
      </div>
      <div className="text-green-400 font-display font-bold text-lg">{course.matchScore}% Match</div>
    </div>
    <h3 className="text-white font-bold text-lg mb-1 group-hover:text-primary transition-colors">{course.course}</h3>
    <p className="text-gray-400 text-sm mb-4">{course.university}</p>
    
    <div className="flex flex-wrap gap-2 mb-4">
      {course.tags.slice(0, 2).map(tag => (
        <span key={tag} className="text-xs text-gray-500 bg-black/20 px-2 py-0.5 rounded border border-white/5">{tag}</span>
      ))}
    </div>

    <div className="flex justify-between items-center text-xs text-gray-500 border-t border-white/5 pt-3">
      <span>Empl. Rate: {course.employmentRate}%</span>
      <span className="flex items-center text-primary group-hover:translate-x-1 transition-transform">
        View <ChevronRight size={12} className="ml-1" />
      </span>
    </div>
  </div>
);

const CareerCard: React.FC<{ career: CareerPath }> = ({ career }) => (
    <div className="bg-surface rounded-xl border border-white/5 p-5 hover:border-accent/50 hover:shadow-neon-accent hover:-translate-y-1 transition-all duration-300 group cursor-pointer relative overflow-hidden">
        <div className="absolute top-0 right-0 p-3 opacity-10 group-hover:opacity-20 transition-opacity">
            <Briefcase size={60} />
        </div>
        <div className="relative z-10">
             <div className="flex justify-between items-start mb-2">
                 <div className="bg-white/10 text-white text-[10px] font-bold px-2 py-1 rounded uppercase tracking-wider flex items-center">
                    {career.growth === 'High' && <TrendingUp size={10} className="mr-1 text-green-400" />}
                    {career.growth} Growth
                 </div>
                 <div className="text-accent font-display font-bold text-lg">{career.matchScore}% Match</div>
             </div>
             <h3 className="text-white font-bold text-lg mb-1 group-hover:text-accent transition-colors">{career.title}</h3>
             <p className="text-gray-400 text-xs mb-4 line-clamp-2">{career.description}</p>
             
             <div className="flex flex-wrap gap-2 mb-4">
                {career.tags.map(tag => (
                    <span key={tag} className="text-[10px] text-gray-500 bg-black/20 px-2 py-0.5 rounded border border-white/5">{tag}</span>
                ))}
             </div>

             <div className="border-t border-white/5 pt-3 mt-auto">
                 <div className="flex justify-between items-center">
                    <span className="text-xs text-gray-400">Entry Salary</span>
                    <span className="font-mono text-sm font-bold text-white">{career.salary}</span>
                 </div>
             </div>
        </div>
    </div>
);

const Dashboard: React.FC<DashboardProps> = ({ profile, courses, careers, onNavigate }) => {
  const scrollToCareers = () => {
    const section = document.getElementById('careers-section');
    if (section) {
        section.scrollIntoView({ behavior: 'smooth' });
    }
  };

  return (
    <div className="min-h-screen bg-background text-white pb-20">
      {/* Header */}
      <header className="h-16 border-b border-white/5 flex items-center justify-between px-6 lg:px-12 bg-surface/50 backdrop-blur-md sticky top-0 z-50">
        <div className="flex items-center space-x-2 cursor-pointer" onClick={() => onNavigate(AppStage.DASHBOARD)}>
          <div className="w-8 h-8 bg-primary rounded-md flex items-center justify-center font-display font-bold italic transform -skew-x-12">
            E
          </div>
          <span className="font-display font-bold text-xl tracking-wide">EXAMRIZZ</span>
        </div>
        <nav className="hidden md:flex space-x-8 text-sm font-medium text-gray-400">
          <button onClick={() => onNavigate(AppStage.DASHBOARD)} className="text-white border-b-2 border-primary h-16 flex items-center">Dashboard</button>
          <button onClick={() => onNavigate(AppStage.MATCHES)} className="hover:text-white transition-colors h-16 flex items-center">Matches</button>
          <button onClick={scrollToCareers} className="hover:text-white transition-colors h-16 flex items-center">Careers</button>
        </nav>
        <div className="flex items-center space-x-4">
          <div className="w-8 h-8 rounded-full bg-surfaceHighlight border border-white/10 flex items-center justify-center">
             <Zap size={14} className="text-warning" />
          </div>
        </div>
      </header>

      <main className="max-w-7xl mx-auto px-4 md:px-6 lg:px-8 pt-8 space-y-8">
        
        {/* Top Section: Profile Banner */}
        <section className="w-full">
            <ProfileCard profile={profile} />
        </section>

        <div className="grid grid-cols-1 lg:grid-cols-12 gap-8">
          
          {/* Left Column: Stats & Indicators */}
          <div className="lg:col-span-4 space-y-8">
            
            {/* Sharpening Activities Bar */}
            <div className="space-y-3">
                <div className="flex items-center justify-between px-1">
                    <h3 className="text-xs font-bold text-gray-500 uppercase tracking-widest flex items-center">
                        <Zap size={12} className="text-primary mr-2" />
                        Sharpen Profile
                    </h3>
                    <span className="text-[10px] text-gray-600">Daily Tasks</span>
                </div>
                
                <div className="bg-surface border border-white/5 rounded-xl p-1.5 grid grid-cols-3 gap-1.5 shadow-lg">
                    {/* Active Task */}
                    <button className="relative bg-gradient-to-br from-indigo-900/50 to-surface border border-indigo-500/30 rounded-lg p-2 flex flex-col items-center justify-center text-center hover:bg-indigo-900/70 transition-all group overflow-hidden">
                        <div className="absolute top-0 right-0 p-1">
                            <div className="w-1.5 h-1.5 bg-green-500 rounded-full animate-pulse"></div>
                        </div>
                        <div className="mb-1 text-indigo-400 group-hover:scale-110 transition-transform">
                            <Brain size={18} />
                        </div>
                        <span className="text-[10px] font-bold text-white leading-tight">Logic</span>
                        <span className="text-[9px] text-green-400 font-mono">+15%</span>
                    </button>

                    {/* Locked Task */}
                    <button className="bg-white/5 border border-white/5 rounded-lg p-2 flex flex-col items-center justify-center text-center opacity-50 cursor-not-allowed">
                        <div className="mb-1 text-gray-500">
                            <Sparkles size={18} />
                        </div>
                        <span className="text-[10px] font-bold text-gray-400 leading-tight">Creative</span>
                        <span className="text-[9px] text-gray-600 font-mono"><Lock size={8} className="inline mr-0.5" /> Lvl 2</span>
                    </button>

                    {/* Locked Task */}
                    <button className="bg-white/5 border border-white/5 rounded-lg p-2 flex flex-col items-center justify-center text-center opacity-50 cursor-not-allowed">
                        <div className="mb-1 text-gray-500">
                            <Timer size={18} />
                        </div>
                        <span className="text-[10px] font-bold text-gray-400 leading-tight">Speed</span>
                        <span className="text-[9px] text-gray-600 font-mono"><Lock size={8} className="inline mr-0.5" /> Lvl 3</span>
                    </button>
                </div>
            </div>
            
            <div className="space-y-4">
              <h3 className="text-lg font-display font-bold flex items-center text-gray-200">
                <Activity className="w-5 h-5 mr-2 text-primary" />
                Early Indicators
              </h3>
              <div className="grid grid-cols-1 gap-4">
                <ClusterCard 
                  title="STEM Analysis" 
                  score={profile.clusterStats.stem} 
                  icon={<Code size={24} />}
                  color="text-cyan-400"
                />
                <ClusterCard 
                  title="Humanities" 
                  score={profile.clusterStats.humanities} 
                  icon={<BookOpen size={24} />}
                  color="text-purple-400"
                />
                <ClusterCard 
                  title="Analytical" 
                  score={profile.clusterStats.analytical} 
                  icon={<Brain size={24} />}
                  color="text-pink-400"
                />
              </div>
            </div>
          </div>

          {/* Right Column: Main Content */}
          <div className="lg:col-span-8 space-y-10">
            
            {/* Matches Section */}
            <section>
               <div className="flex justify-between items-center mb-6">
                 <div>
                    <h2 className="text-2xl font-display font-bold">Top Course Matches</h2>
                    <p className="text-gray-400 text-sm">Based on your cognitive profile and learning style.</p>
                 </div>
                 <Button variant="ghost" size="sm" onClick={() => onNavigate(AppStage.MATCHES)}>
                     See All <ChevronRight size={14} />
                 </Button>
               </div>
               
               <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5">
                 {courses.map(course => (
                   <CourseCard 
                        key={course.id} 
                        course={course} 
                        onClick={() => onNavigate(AppStage.MATCHES)} 
                    />
                 ))}
               </div>
            </section>

             {/* Career Section */}
             <section id="careers-section">
               <div className="flex justify-between items-center mb-6">
                 <div>
                    <h2 className="text-2xl font-display font-bold">Career Pathways</h2>
                    <p className="text-gray-400 text-sm">Future roles that align with your archetype.</p>
                 </div>
               </div>
               
               <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5">
                 {careers.map(career => (
                   <CareerCard key={career.id} career={career} />
                 ))}
               </div>
            </section>

          </div>
        </div>
      </main>
    </div>
  );
};

export default Dashboard;