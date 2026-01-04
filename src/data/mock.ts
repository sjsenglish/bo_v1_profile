import { UserProfile, CareerPath, UniversityCourse, Scenario, VibePair, Task } from '../components/uioverhaul/types';

export const MOCK_PROFILE: UserProfile = {
    id: "8842-A",
    name: "Candidate", // Default name
    tier: "Elite",
    precision: 94.2,
    clusterStats: {
        stem: 88,
        humanities: 45,
        business: 72,
        creative: 60,
        analytical: 92
    },
    familiarName: "The Observer",
    familiarUnlocked: true // For demo purposes
};

export const MOCK_CAREERS: CareerPath[] = [
    {
        id: "cp-1",
        title: "FinTech Product Lead",
        matchScore: 96,
        salary: "£65k - £120k",
        growth: "High",
        tags: ["Strategy", "Tech", "Finance"],
        description: "Lead the development of next-gen financial algorithms and user experiences."
    },
    {
        id: "cp-2",
        title: "Data Science Consultant",
        matchScore: 92,
        salary: "£55k - £90k",
        growth: "High",
        tags: ["Analytics", "Big Data", "Consulting"],
        description: "Solve complex business problems using large datasets and machine learning."
    },
    {
        id: "cp-3",
        title: "Quantitative Analyst",
        matchScore: 89,
        salary: "£70k - £150k",
        growth: "Stable",
        tags: ["Maths", "Finance", "Modelling"],
        description: "Apply mathematical models to financial markets and risk management."
    }
];

export const MOCK_COURSES: UniversityCourse[] = [
    {
        id: "uc-1",
        university: "Imperial College London",
        course: "Computing (AI & ML)",
        matchScore: 98,
        isRussellGroup: true,
        tags: ["World Class", "Intense", "Research"],
        challenges: [
            { skill: "Advanced Calculus", user: 70, required: 90, description: "Course demands exceptional fluency in multivariate calculus." },
            { skill: "Abstract Logic", user: 85, required: 95, description: "Requires handling highly abstract computational theories." }
        ],
        matchReasons: [
            "Your analytical cluster score (92%) aligns perfectly with the curriculum.",
            "High persistence traits match the rigorous workload.",
            "Interest in 'Systems' maps to core modules."
        ],
        details: {
            duration: "4 Years (MEng)",
            entry: "A*A*A",
            assessment: "60% Exam / 40% Coursework",
            satisfaction: "92%",
            avgSalary: "£52,000"
        },
        employmentRate: 96
    },
    {
        id: "uc-2",
        university: "UCL",
        course: "Data Science BSc",
        matchScore: 94,
        isRussellGroup: true,
        tags: ["stats", "London", "Industry Links"],
        challenges: [
            { skill: "Statistical Theory", user: 75, required: 85, description: "Heavy focus on theoretical probability." }
        ],
        matchReasons: [
            "Strong intersection with your STEM and Business interests.",
            "London location matches your preference for dynamic environments."
        ],
        details: {
            duration: "3 Years",
            entry: "A*AA",
            assessment: "50% Exam / 50% Project",
            satisfaction: "89%",
            avgSalary: "£45,000"
        },
        employmentRate: 94
    },
    {
        id: "uc-3",
        university: "University of Warwick",
        course: "MORSE",
        matchScore: 91,
        isRussellGroup: true,
        tags: ["Maths", "Econ", "Stats"],
        challenges: [],
        matchReasons: ["Excellent fit for multidisciplinary quantitative aptitude."],
        details: {
            duration: "3/4 Years",
            entry: "A*A*A",
            assessment: "Mostly Exams",
            satisfaction: "88%",
            avgSalary: "£48,000"
        },
        employmentRate: 95
    },
    {
        id: "uc-4",
        university: "King's College London",
        course: "Computer Science with Management",
        matchScore: 88,
        isRussellGroup: true,
        tags: ["Tech", "Business", "Central"],
        challenges: [],
        matchReasons: ["Good balance of your technical and leadership traits."],
        details: {
            duration: "3 Years",
            entry: "A*AA",
            assessment: "Mixed",
            satisfaction: "85%",
            avgSalary: "£42,000"
        },
        employmentRate: 92
    },
    {
        id: "uc-5",
        university: "University of Manchester",
        course: "Artificial Intelligence",
        matchScore: 85,
        isRussellGroup: true,
        tags: ["Practical", "Innovation", "Campus"],
        challenges: [],
        matchReasons: ["Solid match for your interest in emerging tech."],
        details: {
            duration: "3 Years",
            entry: "AAA",
            assessment: "Project Based",
            satisfaction: "87%",
            avgSalary: "£40,000"
        },
        employmentRate: 90
    }
];

export const SCENARIOS: Scenario[] = [
    {
        id: 1,
        title: "The Group Project Dilemma",
        description: "You are leading a project. A team member is talented but misses deadlines. The final deadline is in 2 days. Do you cover for them (Risk burnout) or report them (Risk conflict)?",
        options: [
            { label: "Cover for them", value: 0, color: "#ef4444" },
            { label: "Report them", value: 100, color: "#3b82f6" }
        ],
        trait: "Agreeableness vs Assertiveness"
    },
    {
        id: 2,
        title: "New Information",
        description: "You have spent 2 weeks researching a topic for an essay. You find a new source that contradicts your main argument 1 day before the deadline.",
        options: [
            { label: "Stick to plan", value: 0, color: "#eab308" },
            { label: "Rewrite essay", value: 100, color: "#a855f7" }
        ],
        trait: "Rigidity vs Openness"
    },
    {
        id: 3,
        title: "The Weekend Plan",
        description: "Your friends invite you to a last-minute road trip, but you had planned to study for an upcoming mock exam that isn't for another week.",
        options: [
            { label: "Go on trip", value: 0, color: "#10b981" },
            { label: "Stay & Study", value: 100, color: "#6366f1" }
        ],
        trait: "Spontaneity vs Conscientiousness"
    }
];

export const VIBE_PAIRS: VibePair[] = [
    {
        id: "TRA_01",
        dimension: "Transfer",
        question: "You're stuck on a problem. You could try applying an approach from a different subject, but it might not work and you'd lose time. Or you could look up the specific method.",
        optionA: { id: 'A', label: "Try the cross-subject approach first. Even if it fails, I might learn something.", indicates: "high_transfer" },
        optionB: { id: 'B', label: "Look up the right method. No point reinventing the wheel.", indicates: "low_transfer" }
    },
    {
        id: "TRA_02",
        dimension: "Transfer",
        question: "You've just learned something new and it clicks. What happens next?",
        optionA: { id: 'A', label: "I start noticing how it connects to other things I already know.", indicates: "high_transfer" },
        optionB: { id: 'B', label: "I focus on practising it until I've properly locked it in.", indicates: "low_transfer" }
    },
    {
        id: "REC_01",
        dimension: "Receptivity",
        question: "Your mock results are lower than expected. A teacher offers to go through your paper with you.",
        optionA: { id: 'A', label: "Take them up on it. Quicker than figuring it out alone.", indicates: "high_receptivity" },
        optionB: { id: 'B', label: "Look through it myself first. I'll ask if I get stuck.", indicates: "low_receptivity" }
    },
    {
        id: "REC_02",
        dimension: "Receptivity",
        question: "You've finished a draft of your personal statement. A family member offers to read it and give honest feedback.",
        optionA: { id: 'A', label: "Let them read it. Another perspective might catch something I can't see.", indicates: "high_receptivity" },
        optionB: { id: 'B', label: "Hold off. I'd rather get it to a place I'm happy with first.", indicates: "low_receptivity" }
    },
    {
        id: "TOL_01",
        dimension: "Tolerance",
        question: "You've been stuck on a problem for 20 minutes with no progress. You could keep going or move on and come back later.",
        optionA: { id: 'A', label: "Keep going. Sometimes it clicks right after the frustrating bit.", indicates: "high_tolerance" },
        optionB: { id: 'B', label: "Move on. I'll come back with fresh eyes.", indicates: "low_tolerance" }
    },
    {
        id: "TOL_02",
        dimension: "Tolerance",
        question: "You're working through a difficult topic and it's not making sense. You could push through the chapter or switch to something easier and return tomorrow.",
        optionA: { id: 'A', label: "Push through. I don't like leaving things half-understood.", indicates: "high_tolerance" },
        optionB: { id: 'B', label: "Switch for now. Forcing it rarely works for me.", indicates: "low_tolerance" }
    },
    {
        id: "PRE_01",
        dimension: "Precision",
        question: "You've finished an assignment due in 20 minutes and spot a small inconsistency near the end. Fixing it properly would take 15 minutes, leaving no time to check anything else.",
        optionA: { id: 'A', label: "Fix it. I'd rather submit with one thing done properly.", indicates: "high_precision" },
        optionB: { id: 'B', label: "Leave it and check the rest. One small error probably matters less than something bigger I haven't spotted.", indicates: "low_precision" }
    },
    {
        id: "PRE_02",
        dimension: "Precision",
        question: "You're in an exam with 10 minutes left and 3 questions unanswered.",
        optionA: { id: 'A', label: "Focus on one and answer it properly.", indicates: "high_precision" },
        optionB: { id: 'B', label: "Attempt all three at surface level. Partial marks add up.", indicates: "low_precision" }
    },
    {
        id: "CAL_01",
        dimension: "Calibration",
        question: "You've just submitted a piece of coursework. A friend asks how you think you did.",
        optionA: { id: 'A', label: "I give a specific prediction. I usually have a sense.", indicates: "high_calibration" },
        optionB: { id: 'B', label: "I say I don't know. I've been wrong too many times.", indicates: "low_calibration" }
    },
    {
        id: "CAL_02",
        dimension: "Calibration",
        question: "You're about to hand in a test. You can review your answers or leave early.",
        optionA: { id: 'A', label: "Review. Even if I feel good, I might catch something.", indicates: "low_calibration" },
        optionB: { id: 'B', label: "Leave. If I second-guess myself I'll probably change right answers to wrong ones.", indicates: "high_calibration" }
    },
    {
        id: "DEP_01",
        dimension: "Depth",
        question: "You're choosing a research topic for your EPQ. You could go narrow and specific or broad and exploratory.",
        optionA: { id: 'A', label: "Go narrow. I can actually become an expert on something specific.", indicates: "high_depth" },
        optionB: { id: 'B', label: "Go broad. I'll discover more connections and it's more interesting.", indicates: "low_depth" }
    },
    {
        id: "DEP_02",
        dimension: "Depth",
        question: "You're interested in a topic but the syllabus only covers the basics. You could explore further or move on to other subjects.",
        optionA: { id: 'A', label: "Go deeper. I want to properly understand it, not just pass the exam.", indicates: "high_depth" },
        optionB: { id: 'B', label: "Move on. I'll come back to it after exams if I'm still curious.", indicates: "low_depth" }
    },
    {
        id: "STR_01",
        dimension: "Structure",
        question: "You're starting a new project with no set format. You could plan it out first or dive in and shape it as you go.",
        optionA: { id: 'A', label: "Plan first. I work better knowing where I'm heading.", indicates: "high_structure" },
        optionB: { id: 'B', label: "Dive in. I'll figure out the structure once I see what I've got.", indicates: "low_structure" }
    },
    {
        id: "STR_02",
        dimension: "Structure",
        question: "Two teachers explain the same topic differently. One gives clear steps to follow, the other lets you work it out yourself.",
        optionA: { id: 'A', label: "I prefer clear steps. I can focus on learning rather than guessing what to do.", indicates: "high_structure" },
        optionB: { id: 'B', label: "I prefer working it out. I remember it better when I find my own way.", indicates: "low_structure" }
    },
    {
        id: "SOC_01",
        dimension: "Social",
        question: "You're stuck on a problem the night before it's due.",
        optionA: { id: 'A', label: "Message someone to talk it through. Explaining it often unsticks me.", indicates: "high_social" },
        optionB: { id: 'B', label: "Keep working alone. I focus better without back-and-forth.", indicates: "low_social" }
    },
    {
        id: "SOC_02",
        dimension: "Social",
        question: "You're revising for a big exam. A friend suggests a study group.",
        optionA: { id: 'A', label: "Join. I revise better when I can discuss and test each other.", indicates: "high_social" },
        optionB: { id: 'B', label: "Decline. I cover more ground on my own.", indicates: "low_social" }
    },
    {
        id: "CON_01",
        dimension: "Consistency",
        question: "It's a free weekend with no deadlines. You could do some work ahead or take the time off.",
        optionA: { id: 'A', label: "Do some work. I like staying on top of things even when there's no pressure.", indicates: "high_consistency" },
        optionB: { id: 'B', label: "Take it off. I work best when there's a real deadline.", indicates: "low_consistency" }
    },
    {
        id: "CON_02",
        dimension: "Consistency",
        question: "Your productivity varies a lot day to day. Someone suggests a fixed daily schedule.",
        optionA: { id: 'A', label: "Worth trying. I'd probably get more done overall.", indicates: "high_consistency" },
        optionB: { id: 'B', label: "Wouldn't suit me. I work in bursts and that's fine.", indicates: "low_consistency" }
    },
    {
        id: "RET_01",
        dimension: "Retrieval",
        question: "You're revising a topic you covered last month. You could reread your notes or test yourself without looking.",
        optionA: { id: 'A', label: "Test myself. It's harder but I'll know what I've actually forgotten.", indicates: "high_retrieval" },
        optionB: { id: 'B', label: "Reread first. I want to refresh my memory before testing.", indicates: "low_retrieval" }
    },
    {
        id: "RET_02",
        dimension: "Retrieval",
        question: "You've got a set of flashcards and a set of summary notes for the same topic.",
        optionA: { id: 'A', label: "Flashcards. Active recall works better for me.", indicates: "high_retrieval" },
        optionB: { id: 'B', label: "Summary notes. I prefer seeing everything laid out together.", indicates: "low_retrieval" }
    }
];

export const TASKS: Task[] = [
    {
        id: 1, // STEM_TECH_01
        metaCluster: "Computing, Engineering, Maths", // MAPPED from markdown "Meta-cluster"
        type: "MCQ",
        title: "STEM-Technical",
        timeLimit: 90,
        stimulus: "A student builds an automatic plant watering system:\n- Moisture sensor checks soil every hour\n- If soil is dry, pump activates for 10 seconds\n- Pump draws water from tank\n- Tank has a float sensor that shows empty/not empty\n- If tank is empty, warning light turns on and pump won't activate\n\nProblem: The soil is dry, the tank is full, but the pump never activates. The warning light is off.",
        question: "Which component is most likely faulty?",
        options: [
            "Moisture sensor",
            "Pump",
            "Float sensor",
            "Warning light"
        ],
        correctAnswerIndex: 0
    },
    {
        id: 2, // STEM_SCI_01
        metaCluster: "Physical Sciences, Life Sciences",
        type: "MCQ",
        title: "STEM-Scientific",
        timeLimit: 90,
        stimulus: "You're growing bacteria for a lab project. You've set up three identical petri dishes with the same bacteria and nutrients.\n\nAfter 48 hours, two dishes have normal growth. The third has almost no growth, but you notice a small patch of mould in the corner.",
        question: "What's your next step?",
        options: [
            "Discard the third dish and report results from the two successful ones",
            "Repeat the entire experiment. Something went wrong.",
            "Investigate the mould. It might be producing something that kills bacteria.",
            "Report all three dishes and note the anomaly for the supervisor"
        ],
        correctAnswerIndex: 2
    },
    {
        id: 3, // HUM_01
        metaCluster: "History, Languages, Philosophy, English",
        type: "MCQ",
        title: "Humanities",
        timeLimit: 90,
        stimulus: "A historian writes:\n\n\"The factory workers of 1830s Manchester lived in appalling conditions. Contemporary accounts describe overcrowded housing, poor sanitation, and widespread disease. This proves that industrialisation was a disaster for the working class.\"",
        question: "A tutor asks: \"What's the problem with this argument?\"",
        options: [
            "The sources might be biased. Reformers had reasons to exaggerate.",
            "\"Appalling\" is subjective. Conditions might have been normal for the time.",
            "It only describes Manchester. Other industrial cities might have been different.",
            "It doesn't compare to conditions before industrialisation. Workers might have been worse off in rural areas."
        ],
        correctAnswerIndex: 3
    },
    {
        id: 4, // SOC_SCI_01
        metaCluster: "Psychology, Sociology, Politics, Economics",
        type: "SHORT_RESPONSE", // Changed to SHORT_RESPONSE
        title: "Social Sciences",
        timeLimit: 90,
        stimulus: "Research shows that employees who work from home report higher job satisfaction. A company mandates work-from-home for all staff to improve morale.",
        question: "In one sentence, why might this backfire?",
        options: [], // Empty for short response
        gradingCriteria: {
            "0": "No reasoning or misses the point",
            "1": "Vague ('not everyone likes working from home')",
            "2": "Identifies self-selection (people who chose it liked it, forcing is different)",
            "3": "Explains self-selection AND considers who loses out (extroverts, new staff, those with poor home setups)"
        }
    },
    {
        id: 5, // PROF_01
        metaCluster: "Law, Business, Medicine, Education",
        type: "SHORT_RESPONSE",
        title: "Professional",
        timeLimit: 90,
        stimulus: "A junior doctor is running behind schedule. The next patient has been waiting 45 minutes for a routine check-up. The current patient, an elderly woman, is medically fine but clearly lonely and wants to keep talking.",
        question: "What should the doctor do, and why?",
        options: [],
        gradingCriteria: {
            "0": "Just picks an action with no reasoning",
            "1": "Picks an action with basic justification",
            "2": "Acknowledges the tension between competing duties",
            "3": "Weighs trade-offs, considers both patients' perspectives, shows awareness that both options have costs"
        }
    },
    {
        id: 6, // CREA_01
        metaCluster: "Art, Design, Media, Architecture",
        type: "SHORT_RESPONSE",
        title: "Creative",
        timeLimit: 90,
        stimulus: "You're designing a poster for a charity event. The client wants it to be:\n\n1. Eye-catching\n2. Include all event details\n3. Feel welcoming and not overwhelming\n\nYou can only fully achieve two.",
        question: "Which two do you prioritise, and what do you sacrifice?",
        options: [],
        gradingCriteria: {
            "0": "Doesn't make a choice or ignores the constraint",
            "1": "Picks two, single basic reason",
            "2": "Picks two, gives reasoning for each choice",
            "3": "Picks two, gives strong reasoning for each AND explains what's lost by sacrificing the third"
        }
    }
];
