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
        id: 1,
        question: "Which environment do you thrive in?",
        optionA: { id: 'chaos', label: 'Ordered Chaos', image: 'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80', description: 'Beauty in complexity' },
        optionB: { id: 'structure', label: 'Rigid Structure', image: 'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80', description: 'Beauty in order' }
    },
    {
        id: 2,
        question: "What drives your curiosity?",
        optionA: { id: 'nature', label: 'Organic Growth', image: 'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80', description: 'Natural evolution' },
        optionB: { id: 'tech', label: 'Digital Precision', image: 'https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80', description: 'Engineered perfection' }
    },
    {
        id: 3,
        question: "How do you view the world?",
        optionA: { id: 'detail', label: 'Micro Details', image: 'https://images.unsplash.com/photo-1580927752452-89d86da3fa0a?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80', description: 'Focus on the small' },
        optionB: { id: 'bigpicture', label: 'Macro Vision', image: 'https://images.unsplash.com/photo-1451187580459-43490279c0fa?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80', description: 'Focus on the whole' }
    },
    {
        id: 4,
        question: "Which learning style fits you?",
        optionA: { id: 'theory', label: 'Abstract Theory', image: 'https://images.unsplash.com/photo-1635070041078-e363dbe005cb?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80', description: 'Conceptual understanding' },
        optionB: { id: 'practice', label: 'Practical Application', image: 'https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80', description: 'Hands-on learning' }
    }
];

export const TASKS: Task[] = [
    {
        id: 1,
        metaCluster: "STEM",
        type: "MCQ",
        title: "Pattern Recognition",
        timeLimit: 60,
        stimulus: "Sequence: 2, 4, 8, 16, ...",
        question: "What comes next?",
        options: ["30", "32", "24", "64"]
    },
    {
        id: 2,
        metaCluster: "STEM",
        type: "MCQ",
        title: "Scientific Method",
        timeLimit: 90,
        stimulus: "You observe that a bacterial culture stops growing in the presence of a specific mold. You see blue-green patches.",
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
    },
    {
        id: 7,
        metaCluster: "Business",
        type: "MCQ",
        title: "Market Strategy",
        timeLimit: 60,
        stimulus: "A luxury brand wants to launch a budget product line under the same logo.",
        question: "What is the primary risk of this strategy?",
        options: [
            "Brand Dilution",
            "Supply Chain Complexity",
            "Increased Marketing Costs",
            "Regulatory Hurdles"
        ]
    },
    {
        id: 8,
        metaCluster: "STEM",
        type: "MCQ",
        title: "Probability Logic",
        timeLimit: 60,
        stimulus: "A coin is flipped 5 times and lands on Heads every time.",
        question: "What is the probability the next flip is Heads?",
        options: [
            "50%",
            "Less than 50% (due to regression)",
            "More than 50% (hot streak)",
            "Depends on the wind"
        ]
    },
    {
        id: 9,
        metaCluster: "Creative",
        type: "MCQ",
        title: "Visual composition",
        timeLimit: 45,
        stimulus: "In color theory, complementary colors create high contrast.",
        question: "Which of these color combinations creates the highest visual contrast?",
        options: [
            "Blue & Orange",
            "Red & Pink",
            "Green & Blue",
            "White & Grey"
        ]
    },
    {
        id: 10,
        metaCluster: "Humanities",
        type: "SHORT_RESPONSE",
        title: "Ethical Dilemma",
        timeLimit: 120,
        stimulus: "An autonomous car must choose between hitting a pedestrian or swerving into a wall, injuring the passenger.",
        question: "Propose a guiding principle for coding this decision.",
        options: []
    },
    {
        id: 11,
        metaCluster: "STEM",
        type: "MCQ",
        title: "Data Interpretation",
        timeLimit: 60,
        stimulus: "Graph shows: Ice cream sales increase as forest fires increase.",
        question: "What is the most likely variable causing this correlation?",
        options: [
            "Temperature / Summer Heat",
            "People eating ice cream cause fires",
            "Fire smoke makes people hungry",
            "Pure coincidence"
        ]
    },
    {
        id: 12,
        metaCluster: "Business",
        type: "MCQ",
        title: "Investment Logic",
        timeLimit: 60,
        stimulus: "Sunk Cost Fallacy Example:",
        question: "Which scenario best describes the Sunk Cost Fallacy?",
        options: [
            "Continuing a failing project because you already spent £1M on it",
            "Selling a stock because it dropped 10%",
            "Investing in a startup because you like the founder",
            "Buying a house because rent is expensive"
        ]
    },
    {
        id: 13,
        metaCluster: "Technology",
        type: "MCQ",
        title: "System Design",
        timeLimit: 60,
        stimulus: "You need to store passwords for users.",
        question: "What is the industry standard method?",
        options: [
            "Hashing and Salting",
            "Encryption with a master key",
            "Plaintext in a secure database",
            "Encoding in Base64"
        ]
    },
    {
        id: 14,
        metaCluster: "Creative",
        type: "SHORT_RESPONSE",
        title: "Narrative Arc",
        timeLimit: 90,
        stimulus: "A story begins with the protagonist achieving their goal immediately.",
        question: "What is the likely narrative consequence of this opening?",
        options: []
    },
    {
        id: 15,
        metaCluster: "Humanities",
        type: "MCQ",
        title: "Source Analysis",
        timeLimit: 60,
        stimulus: "A diary entry from 1914 vs a history textbook written in 1990.",
        question: "The diary entry is an example of:",
        options: [
            "Primary Source",
            "Secondary Source",
            "Tertiary Source",
            "Fabricated Source"
        ]
    },
    {
        id: 16,
        metaCluster: "STEM",
        type: "MCQ",
        title: "Physics Intuition",
        timeLimit: 45,
        stimulus: "A feather and a bowling ball are dropped in a vacuum.",
        question: "Which hits the ground first?",
        options: [
            "They hit at the same time",
            "The bowling ball",
            "The feather",
            "Impossible to say"
        ]
    },
    {
        id: 17,
        metaCluster: "Business",
        type: "SHORT_RESPONSE",
        title: "Negotiation",
        timeLimit: 90,
        stimulus: "Your supplier raises prices by 20% without notice.",
        question: "Draft your opening sentence for the negotiation email.",
        options: []
    },
    {
        id: 18,
        metaCluster: "Social Sciences",
        type: "MCQ",
        title: "Cognitive Bias",
        timeLimit: 60,
        stimulus: "You only read news that confirms your existing beliefs.",
        question: "What is this bias called?",
        options: [
            "Confirmation Bias",
            "Availability Heuristic",
            "Dunning-Kruger Effect",
            "Anchoring Bias"
        ]
    },
    {
        id: 19,
        metaCluster: "Technology",
        type: "MCQ",
        title: "AI Ethics",
        timeLimit: 60,
        stimulus: "An AI generates art based on scraped images.",
        question: "What is the primary legal/ethical concern?",
        options: [
            "Copyright and Artist Compensation",
            "Energy consumption",
            "It's too easy to make",
            "The art isn't 'real'"
        ]
    },
    {
        id: 20,
        metaCluster: "General",
        type: "MCQ",
        title: "Logic Puzzle",
        timeLimit: 90,
        stimulus: "If All Bloops are Razzes, and No Razzes are Zorgs...",
        question: "Which statement is true?",
        options: [
            "No Bloops are Zorgs",
            "Some Bloops are Zorgs",
            "All Zorgs are Bloops",
            "All Razzes are Bloops"
        ]
    }
];
