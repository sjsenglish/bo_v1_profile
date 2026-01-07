import React, { useState, useEffect } from 'react';
import { AppStage, UserProfile, UniversityCourse, Scenario, VibePair, Task, CareerPath } from './types';
import Dashboard from './components/Dashboard';
import MatchesView from './components/MatchesView';
import VibeSwiper from './components/VibeSwiper';
import ScenarioSlider from './components/ScenarioSlider';
import AssessmentTask from './components/AssessmentTask';
import EnjoymentModal from './components/EnjoymentModal';
import Button from './components/Button';
import { motion } from 'framer-motion';
import { SkipForward } from 'lucide-react';

// Mock Data
const MOCK_PROFILE: UserProfile = {
  name: "Alex",
  precision: 42,
  tier: 'Foundation',
  familiarUnlocked: false,
  clusterStats: {
    stem: 85,
    humanities: 45,
    analytical: 72
  }
};

const MOCK_CAREERS: CareerPath[] = [
  {
    id: '1',
    title: 'AI Ethics Officer',
    matchScore: 96,
    description: 'Ensure artificial intelligence systems operate within ethical, legal, and social guidelines. Perfect for analytical minds with a humanities edge.',
    salary: '£55k - £85k',
    growth: 'High',
    tags: ['Policy', 'Tech', 'Philosophy']
  },
  {
    id: '2',
    title: 'Computational Linguist',
    matchScore: 91,
    description: 'Develop computer systems that can translate, understand, and generate human language. Bridges code and communication.',
    salary: '£45k - £70k',
    growth: 'High',
    tags: ['Language', 'Code', 'Research']
  },
  {
    id: '3',
    title: 'Data Journalist',
    matchScore: 85,
    description: 'Use software and statistical tools to gather and analyze data to create news stories.',
    salary: '£35k - £55k',
    growth: 'Stable',
    tags: ['Media', 'Analytics', 'Writing']
  }
];

const MOCK_COURSES: UniversityCourse[] = [
  { 
      id: '1', 
      university: 'Imperial College London', 
      course: 'Computing (Artificial Intelligence)', 
      matchScore: 94, 
      tags: ['High Intensity', 'Maths Heavy'], 
      isRussellGroup: true, 
      employmentRate: 98,
      matchReasons: [
          'Analytical score (72) aligns with AI logic requirements',
          'STEM affinity (85) suggests high engagement',
          'Preference for structured problem solving detected in scenarios'
      ],
      challenges: [
          { skill: 'Persistence', required: 90, user: 65, description: 'Workload is extremely heavy in year 2, requiring mental stamina.' },
          { skill: 'Abstract Math', required: 85, user: 72, description: 'Requires handling non-linear calculus early on.' }
      ],
      details: {
          duration: '4 years (MEng)',
          entry: 'A*A*A',
          assessment: '60% Exams, 30% Labs',
          satisfaction: '92%',
          avgSalary: '£64,000'
      }
  },
  { 
      id: '2', 
      university: 'University of Manchester', 
      course: 'Computer Science & Maths', 
      matchScore: 89, 
      tags: ['Balanced', 'Large Cohort'], 
      isRussellGroup: true, 
      employmentRate: 92,
      matchReasons: [
          'Strong correlation with interdisciplinary STEM tasks',
          'Good fit for collaborative learning environments'
      ],
      challenges: [
          { skill: 'Self-Study', required: 80, user: 60, description: 'Less contact hours means more independent work.' }
      ],
      details: {
          duration: '3 years (BSc)',
          entry: 'A*AA',
          assessment: '70% Exams, 30% Coursework',
          satisfaction: '88%',
          avgSalary: '£48,000'
      } 
  },
  { 
      id: '3', 
      university: 'University of Bristol', 
      course: 'Data Science', 
      matchScore: 82, 
      tags: ['Modern', 'Project Based'], 
      isRussellGroup: true, 
      employmentRate: 90,
      matchReasons: [
          'Detail-oriented disposition (73) matches data cleaning tasks',
          'High receptivity suits rapidly changing tech stack'
      ],
      challenges: [
          { skill: 'Public Speaking', required: 70, user: 45, description: 'Frequent presentations of data findings required.' }
      ],
      details: {
          duration: '3 years (BSc)',
          entry: 'AAA',
          assessment: '100% Coursework/Projects',
          satisfaction: '85%',
          avgSalary: '£45,000'
      }
  },
  { 
      id: '4', 
      university: 'UCL', 
      course: 'Robotics and AI', 
      matchScore: 78, 
      tags: ['Research', 'Central London'], 
      isRussellGroup: true, 
      employmentRate: 94,
      matchReasons: [
          'Enjoyment of "System Debugging" task indicates hardware affinity',
          'Thrives in urban/modern environments'
      ],
      challenges: [
          { skill: 'Physics', required: 85, user: 70, description: 'Mechanics modules are intensive.' }
      ],
      details: {
          duration: '4 years (MEng)',
          entry: 'A*A*A',
          assessment: '40% Exam, 60% Practical',
          satisfaction: '89%',
          avgSalary: '£55,000'
      } 
  },
  { 
      id: '5', 
      university: 'University of Leeds', 
      course: 'Computer Science', 
      matchScore: 75, 
      tags: ['Social', 'Campus'], 
      isRussellGroup: true, 
      employmentRate: 88,
      matchReasons: [
          'Balanced profile fits generalist curriculum',
          'Social disposition aligns with campus culture'
      ],
      challenges: [],
      details: {
          duration: '3 years (BSc)',
          entry: 'AAA',
          assessment: '50% Exam, 50% Coursework',
          satisfaction: '91%',
          avgSalary: '£38,000'
      } 
  },
];

const SCENARIOS: Scenario[] = [
  { 
    id: 1, 
    question: "It's 10pm and you're stuck on a problem set that's due tomorrow morning.", 
    optionA: "Message the group chat to see if anyone's figured it out.", 
    optionB: "Grind through it alone — you'll learn more that way." 
  },
  { 
    id: 2, 
    question: "You receive harsh feedback on a draft essay from your teacher.", 
    optionA: "Defend your approach and explain why you made those choices.", 
    optionB: "Accept it immediately and rewrite the section completely." 
  },
  { 
    id: 3, 
    question: "You have a free period in your schedule.", 
    optionA: "Go to the library to get ahead on next week's reading.", 
    optionB: "Go to the common room to relax and socialise with friends." 
  },
  { 
    id: 4, 
    question: "In a group project, two members aren't pulling their weight.", 
    optionA: "Confront them directly and demand they contribute.", 
    optionB: "Do the work yourself to ensure you get a good grade." 
  },
  { 
    id: 5, 
    question: "You have to choose an EPQ topic.", 
    optionA: "Pick something practical with a clear, definite answer.", 
    optionB: "Pick something philosophical with multiple open interpretations." 
  }
];

const VIBE_PAIRS: VibePair[] = [
  { 
    id: 1, 
    dimension: "Environment",
    question: "Which environment appeals to you more?",
    options: [
      { id: 'A', label: "Traditional Campus", description: "Traditional quad", imageUrl: "https://images.unsplash.com/photo-1541339907198-e08756dedf3f?q=80&w=600&auto=format&fit=crop" },
      { id: 'B', label: "City University", description: "Urban, modern", imageUrl: "https://images.unsplash.com/photo-1550601977-9c5938c82ebc?q=80&w=600&auto=format&fit=crop" }
    ]
  },
  { 
    id: 2, 
    dimension: "Teaching Style",
    question: "How do you prefer to learn?",
    options: [
      { id: 'A', label: "Large Lecture", description: "200+ students", imageUrl: "https://images.unsplash.com/photo-1524178232363-1fb2b075b655?q=80&w=600&auto=format&fit=crop" },
      { id: 'B', label: "Small Seminar", description: "10 students", imageUrl: "https://images.unsplash.com/photo-1517486808906-6ca8b3f04846?q=80&w=600&auto=format&fit=crop" }
    ]
  },
  { 
    id: 3, 
    dimension: "Subject Domain",
    question: "Where do you feel most at home?",
    options: [
      { id: 'A', label: "Science Laboratory", description: "Microscopes, equipment", imageUrl: "https://images.unsplash.com/photo-1532094349884-543bc11b234d?q=80&w=600&auto=format&fit=crop" },
      { id: 'B', label: "University Library", description: "Books, reading", imageUrl: "https://images.unsplash.com/photo-1521587760476-6c12a4b040da?q=80&w=600&auto=format&fit=crop" }
    ]
  },
  { 
    id: 4, 
    dimension: "Application",
    question: "What excites you more?",
    options: [
      { id: 'A', label: "Academic Research", description: "Chalkboard equations", imageUrl: "https://images.unsplash.com/photo-1635070041078-e363dbe005cb?q=80&w=600&auto=format&fit=crop" },
      { id: 'B', label: "Professional Training", description: "Hospital/office", imageUrl: "https://images.unsplash.com/photo-1537462713205-e5126c84206c?q=80&w=600&auto=format&fit=crop" }
    ]
  },
  { 
    id: 5, 
    dimension: "Assessment",
    question: "How do you prove your knowledge?",
    options: [
      { id: 'A', label: "Exam Hall", description: "Rows of desks, silent", imageUrl: "https://images.unsplash.com/photo-1560960500-1175658e4bd5?q=80&w=600&auto=format&fit=crop" },
      { id: 'B', label: "Project Work", description: "Laptop, research", imageUrl: "https://images.unsplash.com/photo-1522071820081-009f0129c71c?q=80&w=600&auto=format&fit=crop" }
    ]
  },
  { 
    id: 6, 
    dimension: "Work Mode",
    question: "How do you do your best work?",
    options: [
      { id: 'A', label: "Solo Study", description: "Student alone, focused", imageUrl: "https://images.unsplash.com/photo-1434030216411-0b793f4b4173?q=80&w=600&auto=format&fit=crop" },
      { id: 'B', label: "Group Project", description: "Team brainstorming", imageUrl: "https://images.unsplash.com/photo-1523240795612-9a054b0db644?q=80&w=600&auto=format&fit=crop" }
    ]
  }
];

const TASKS: Task[] = [
  {
    id: 1,
    metaCluster: "STEM-Technical",
    type: "MCQ",
    title: "System Debugging",
    timeLimit: 90,
    stimulus: `A smart plant watering system is failing.
Rules:
1. IF soil_moisture < 30% AND tank_level > 10% THEN activate_pump()
2. IF pump_is_active AND time > 60s THEN emergency_stop()

Current State:
soil_moisture = 25%
tank_level = 5%
pump_status = OFF`,
    question: "Why didn't the pump activate?",
    options: [
      "Soil moisture is too high",
      "Tank level is too low",
      "Emergency stop was triggered",
      "Sensor malfunction"
    ]
  },
  {
    id: 2,
    metaCluster: "STEM-Scientific",
    type: "MCQ",
    title: "Experimental Analysis",
    timeLimit: 90,
    stimulus: `You're growing bacteria in petri dishes. Dish A (control) should show normal growth. Dish B (experimental) should show reduced growth due to a new antibiotic.

Day 3 Results:
• Dish A: Dense bacterial colonies (expected)
• Dish B: Dense bacterial colonies (unexpected!)
• Dish B also has blue-green patches around edges`,
    question: "What's the most scientifically interesting next step?",
    options: [
      "Conclude the antibiotic doesn't work",
      "Investigate what the blue-green patches are",
      "Repeat the experiment with fresh materials",
      "Increase the antibiotic concentration"
    ]
  },
  {
    id: 3,
    metaCluster: "Humanities",
    type: "MCQ",
    title: "Argument Logic",
    timeLimit: 90,
    stimulus: `Historian A: "The Roman Empire fell primarily due to internal economic corruption."
Historian B: "That cannot be true; the Barbarian invasions of 476 AD were the definitive end point of the Western Empire."`,
    question: "What is the main flaw in Historian B's counter-argument?",
    options: [
      "They confuse a symptom with a cause",
      "They rely on an arbitrary date to dismiss a long-term process",
      "They ignore the Eastern Roman Empire",
      "They provide no evidence for invasions"
    ]
  },
  {
    id: 4,
    metaCluster: "Social Sciences",
    type: "SHORT_RESPONSE",
    title: "Policy Analysis",
    timeLimit: 90,
    stimulus: `A company mandates all employees work from office 5 days/week, claiming "remote work reduces productivity and team cohesion."`,
    question: "In 2-3 sentences, identify one hidden assumption in this policy.",
    options: []
  },
  {
    id: 5,
    metaCluster: "Professional",
    type: "SHORT_RESPONSE",
    title: "Triage Scenario",
    timeLimit: 90,
    stimulus: `You are a junior doctor. Two patients arrive simultaneously:
1. Elderly patient with chest pain (potential heart attack)
2. Child with a deep gash on their leg (bleeding heavily but stable)`,
    question: "Who do you assess first and why? (2-3 sentences)",
    options: []
  },
  {
    id: 6,
    metaCluster: "Creative",
    type: "SHORT_RESPONSE",
    title: "Design Trade-off",
    timeLimit: 90,
    stimulus: `You are designing a sustainable smartphone. You must choose between:
A) Biodegradable casing (durability: 2 years)
B) Recycled Aluminum casing (durability: 6 years)`,
    question: "Which do you choose for maximum sustainability? Justify considering user behaviour.",
    options: []
  }
];

const App: React.FC = () => {
  const [stage, setStage] = useState<AppStage>(AppStage.LANDING);
  const [currentScenarioIndex, setCurrentScenarioIndex] = useState(0);
  const [loadingText, setLoadingText] = useState("Analysing profile...");
  
  // Task State
  const [currentTaskIndex, setCurrentTaskIndex] = useState(0);
  const [showEnjoyment, setShowEnjoyment] = useState(false);

  // Processing Animation Effect
  useEffect(() => {
    if (stage === AppStage.PROCESSING) {
      const timers = [
        setTimeout(() => setLoadingText("Calculating cognitive affinities..."), 1500),
        setTimeout(() => setLoadingText("Matching with 28,520 courses..."), 3000),
        setTimeout(() => setStage(AppStage.DASHBOARD), 4500)
      ];
      return () => timers.forEach(clearTimeout);
    }
  }, [stage]);

  // View: Landing Page
  if (stage === AppStage.LANDING) {
    return (
      <div className="min-h-screen bg-background text-white overflow-hidden relative font-sans">
        {/* Abstract Background */}
        <div className="absolute top-0 left-0 w-full h-full overflow-hidden z-0">
          <div className="absolute top-[-20%] right-[-10%] w-[60%] h-[60%] bg-primary/20 blur-[120px] rounded-full"></div>
          <div className="absolute bottom-[-10%] left-[-10%] w-[50%] h-[50%] bg-accent/10 blur-[100px] rounded-full"></div>
        </div>

        <nav className="relative z-10 flex justify-between items-center p-6 lg:px-12">
          <div className="text-2xl font-display font-bold italic tracking-wider">EXAMRIZZ</div>
          <Button variant="secondary" size="sm" onClick={() => setStage(AppStage.DASHBOARD)}>Demo Dashboard</Button>
        </nav>

        <main className="relative z-10 flex flex-col items-center justify-center text-center mt-12 lg:mt-20 px-4">
          <motion.div 
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8 }}
          >
            <div className="inline-block px-3 py-1 mb-6 border border-white/10 rounded-full bg-white/5 text-xs tracking-widest uppercase text-indigo-300">
               Official HESA Data • Russell Group Optimised
            </div>
            <h1 className="text-5xl lg:text-7xl font-display font-bold leading-tight mb-6 drop-shadow-2xl">
              Find where you'll <span className="text-transparent bg-clip-text bg-gradient-to-r from-primaryGlow to-accent">thrive</span>, not just survive.
            </h1>
            <p className="text-lg text-gray-400 max-w-2xl mx-auto mb-10 leading-relaxed">
              AI-powered university matching based on your cognitive capacity, learning dispositions, and true potential.
            </p>
            <Button 
              size="lg" 
              variant="primary" 
              className="text-lg px-12 py-8 shadow-[0_0_30px_rgba(99,102,241,0.4)] hover:shadow-[0_0_50px_rgba(99,102,241,0.6)] transition-shadow"
              onClick={() => setStage(AppStage.ASSESSMENT_VIBE)}
            >
              Start Assessment
            </Button>
          </motion.div>

          <div className="mt-24 grid grid-cols-1 md:grid-cols-3 gap-8 max-w-5xl w-full text-left">
            {[
              { step: "01", title: "Complete Profile", desc: "Psychometric assessment takes ~6 minutes." },
              { step: "02", title: "Unlock Archetype", desc: "Discover your cognitive strengths & style." },
              { step: "03", title: "Get Matched", desc: "Instantly compare 28,000+ UK courses." }
            ].map((item, i) => (
              <motion.div 
                key={i} 
                className="bg-surface/50 border border-white/5 p-6 rounded-xl hover:bg-surface/80 transition-colors"
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                transition={{ delay: 0.2 + (i * 0.1) }}
              >
                <div className="text-accent font-display font-bold text-xl mb-2">{item.step}</div>
                <h3 className="text-xl font-bold text-white mb-2">{item.title}</h3>
                <p className="text-gray-400 text-sm">{item.desc}</p>
              </motion.div>
            ))}
          </div>
        </main>
      </div>
    );
  }

  // View: Assessment Stage 1 (Vibe Swiper)
  if (stage === AppStage.ASSESSMENT_VIBE) {
    return (
      <div className="min-h-screen bg-background flex flex-col">
        <div className="flex-1 flex items-center justify-center p-4">
          <VibeSwiper 
            pairs={VIBE_PAIRS} 
            onComplete={() => setStage(AppStage.ASSESSMENT_SCENARIO)} 
          />
        </div>
      </div>
    );
  }

  // View: Assessment Stage 2 (Scenarios)
  if (stage === AppStage.ASSESSMENT_SCENARIO) {
    const handleScenarioNext = (value: number) => {
        // Here you would capture the value (0-100)
        if (currentScenarioIndex < SCENARIOS.length - 1) {
            setCurrentScenarioIndex(prev => prev + 1);
        } else {
            setStage(AppStage.ASSESSMENT_TASKS);
        }
    };

    return (
      <div className="min-h-screen bg-background flex flex-col items-center justify-center relative">
        {/* Skip Section Button */}
        <div className="absolute top-6 right-6 z-50">
            <Button 
                variant="ghost" 
                size="sm" 
                onClick={() => setStage(AppStage.ASSESSMENT_TASKS)}
                className="text-gray-400 hover:text-white group bg-surface/50 backdrop-blur-sm border border-white/5 rounded-full px-4"
            >
                Skip Section <SkipForward size={16} className="ml-2 group-hover:translate-x-1 transition-transform" />
            </Button>
        </div>

        <ScenarioSlider 
            scenario={SCENARIOS[currentScenarioIndex]}
            currentIndex={currentScenarioIndex}
            total={SCENARIOS.length}
            onNext={handleScenarioNext}
        />
      </div>
    );
  }

  // View: Assessment Stage 3 (Timed Tasks)
  if (stage === AppStage.ASSESSMENT_TASKS) {
    const handleTaskComplete = () => {
      setShowEnjoyment(true);
    };

    const handleEnjoymentComplete = () => {
      setShowEnjoyment(false);
      
      if (currentTaskIndex < TASKS.length - 1) {
        setCurrentTaskIndex(prev => prev + 1);
      } else {
        setStage(AppStage.PROCESSING);
      }
    };
    
    const handleTaskSkip = () => {
        // Skip current task without enjoyment rating
        setShowEnjoyment(false);
        if (currentTaskIndex < TASKS.length - 1) {
            setCurrentTaskIndex(prev => prev + 1);
        } else {
            setStage(AppStage.PROCESSING);
        }
    };

    return (
      <div className="relative w-full h-full">
         <AssessmentTask 
            task={TASKS[currentTaskIndex]}
            currentTaskIndex={currentTaskIndex}
            totalTasks={TASKS.length}
            onComplete={handleTaskComplete}
            onSkip={handleTaskSkip}
         />
         {showEnjoyment && (
            <EnjoymentModal onContinue={handleEnjoymentComplete} />
         )}
      </div>
    );
  }

  // View: Processing
  if (stage === AppStage.PROCESSING) {
    return (
      <div className="min-h-screen bg-background flex flex-col items-center justify-center relative overflow-hidden">
        {/* Particle effects would go here */}
        <div className="relative z-10 text-center">
          <div className="w-24 h-24 mx-auto mb-8 relative">
             <div className="absolute inset-0 rounded-full border-4 border-primary/20"></div>
             <div className="absolute inset-0 rounded-full border-t-4 border-primary animate-spin"></div>
             <div className="absolute inset-4 rounded-full border-4 border-accent/20"></div>
             <div className="absolute inset-4 rounded-full border-b-4 border-accent animate-spin-slow"></div>
          </div>
          <h2 className="text-3xl font-display font-bold text-white mb-2 animate-pulse">{loadingText}</h2>
          <p className="text-gray-500">Do not refresh the page.</p>
        </div>
      </div>
    );
  }

  // View: Matches Analysis
  if (stage === AppStage.MATCHES) {
      return (
          <MatchesView courses={MOCK_COURSES} onNavigate={setStage} />
      );
  }

  // View: Dashboard (Default for logged in state)
  return (
    <Dashboard profile={MOCK_PROFILE} courses={MOCK_COURSES} careers={MOCK_CAREERS} onNavigate={setStage} />
  );
};

export default App;
