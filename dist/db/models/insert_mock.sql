-- Inserting data into the teacher table
INSERT INTO
    `teacher` (`name`, `title`, `image`, `bio`)
VALUES
    (
        'Emily Davis',
        'Computer Science Lecturer',
        'teacher01.jpg',
        'Emily Davis is passionate about teaching computer science concepts.'
    ),
    (
        'John Doe',
        'Senior Lecturer',
        'teacher02.jpg',
        'John Doe is an experienced educator with a passion for teaching.'
    ),
    (
        'Jon Smith',
        'Mathematics Instructor',
        'teacher03.jpg',
        'Jon Smith specializes in teaching advanced mathematics courses.'
    ),
    (
        'Mark Johnson',
        'Physics Professor',
        'teacher04.jpg',
        'Mark Johnson is an expert in theoretical and applied physics.'
    ),
    (
        'Sarah Wilson',
        'Art Teacher',
        'teacher05.jpg',
        'Sarah Wilson brings creativity and passion to her art classes.'
    );

-- Inserting data into the student table
INSERT INTO
    `student` (
        `name`,
        `username`,
        `password`,
        `recommended`
    )
VALUES
    (
        'Bob Smith',
        'bob123',
        '$2y$10$Sui4BFncfmrndjYs.zJ3TO3SbmF53EGnvcMeXdKcZNCoDVulngcaG',  -- 1234
        'Programming'
    ),
    (
        'Alice Johnson',
        'alice456',
        '$2y$10$Sui4BFncfmrndjYs.zJ3TO3SbmF53EGnvcMeXdKcZNCoDVulngcaG', -- 1234
        'Mathematics'
    ),
    (
        'Charlie Brown',
        'charlie789',
        '$2y$10$Sui4BFncfmrndjYs.zJ3TO3SbmF53EGnvcMeXdKcZNCoDVulngcaG', -- 1234
        'Art'
    );

-- Inserting data into the course table
INSERT INTO
    `course` (
        `name`,
        `summary`,
        `description`,
        `image`,
        `price`,
        `type`,
        `level`,
        `category`,
        `teacher_id`,
        `created_at`,
        `learn_items`
    )
VALUES
    (
        'Advanced Data Science with Python',
        'Explore advanced techniques for data analysis using Python.',
        'This course dives deep into data manipulation, visualization, and machine learning with Python.',
        'course02.jpg',
        0,
        'Workshop',
        'Advanced',
        'Data Science',
        1,
        CURRENT_TIMESTAMP(),
        '["Advanced data manipulation techniques", "Data visualization with Matplotlib and Seaborn", "Machine learning algorithms and models"]'
    ),
    (
        'Algebra Fundamentals',
        'Build a strong foundation in algebra.',
        'This course covers essential algebraic concepts and problem-solving strategies.',
        'course03.jpg',
        0,
        'Course',
        'Intermediate',
        'Mathematics',
        2,
        CURRENT_TIMESTAMP(),
        '["Solving linear equations and inequalities", "Factoring polynomials", "Graphing linear and quadratic functions"]'
    ),
    (
        'Calculus for Beginners',
        'Master the fundamentals of calculus.',
        'This course introduces differential and integral calculus concepts with practical examples.',
        'course04.jpg',
        89,
        'Course',
        'Beginner',
        'Mathematics',
        2,
        CURRENT_TIMESTAMP(),
        '["Limits and continuity", "Derivatives and their applications", "Integration and area under curves"]'
    ),
    (
        'Introduction to Chemistry',
        'Explore the basics of chemistry.',
        'This course covers atomic structure, chemical bonding, and reactions.',
        'course05.jpg',
        79,
        'Course',
        'Beginner',
        'Science',
        3,
        CURRENT_TIMESTAMP(),
        '["Atomic structure and periodic table", "Chemical bonding and molecular geometry", "Types of chemical reactions and stoichiometry"]'
    ),
    (
        'Art History',
        'Discover the evolution of art through history.',
        'This course explores various art movements, styles, and artists.',
        'course06.jpg',
        59,
        'Course',
        'Intermediate',
        'Art',
        4,
        CURRENT_TIMESTAMP(),
        '["Renaissance art and its impact", "Impressionism and Post-Impressionism", "Modern and contemporary art movements"]'
    ),
    (
        'Introduction to Music Theory',
        'Learn the fundamentals of music theory.',
        'This course covers notation, scales, chords, and basic harmony.',
        'course07.jpg',
        69,
        'Course',
        'Beginner',
        'Music',
        4,
        CURRENT_TIMESTAMP(),
        '["Note reading and music notation", "Major and minor scales", "Chord construction and progression"]'
    ),
    (
        'Web Development Fundamentals',
        'Master the basics of web development.',
        'This course covers HTML, CSS, and JavaScript for building web pages.',
        'course08.jpg',
        89,
        'Bootcamp',
        'Intermediate',
        'Programming',
        1,
        CURRENT_TIMESTAMP(),
        '["HTML5 structure and elements", "CSS3 styling and layout techniques", "Introduction to JavaScript and DOM manipulation"]'
    ),
    (
        'Photography Essentials',
        'Learn the essentials of photography.',
        'This course covers camera settings, composition, and lighting techniques.',
        'course09.jpg',
        69,
        'Course',
        'Beginner',
        'Photography',
        5,
        CURRENT_TIMESTAMP(),
        '["Understanding exposure: aperture, shutter speed, ISO", "Composition techniques: rule of thirds, leading lines", "Lighting fundamentals: natural and artificial lighting"]'
    ),
    (
        'Introduction to Physics',
        'Explore fundamental concepts in physics.',
        'This course covers mechanics, thermodynamics, and electromagnetism.',
        'course10.jpg',
        79,
        'Course',
        'Beginner',
        'Science',
        3,
        CURRENT_TIMESTAMP(),
        '["Mechanics: kinematics and dynamics", "Thermodynamics: laws of thermodynamics", "Electromagnetism: electric fields and magnetic fields"]'
    ),
    (
        'Graphic Design Basics',
        'Learn the principles of graphic design.',
        'This course covers typography, color theory, and layout design.',
        'course01.jpg',
        79,
        'Course',
        'Intermediate',
        'Design',
        4,
        CURRENT_TIMESTAMP(),
        '["Typography fundamentals", "Color theory and psychology", "Layout design principles"]'
    ),
    (
        'Introduction to World History',
        'Discover key events and civilizations throughout history.',
        'This course covers ancient civilizations, world wars, and modern history.',
        'course02.jpg',
        59,
        'Course',
        'Beginner',
        'History',
        4,
        CURRENT_TIMESTAMP(),
        '["Ancient civilizations: Mesopotamia, Egypt, Greece, Rome", "World Wars I and II", "Modern history: Cold War, globalization"]'
    ),
    (
        'Introduction to Python for Data Science',
        'Learn Python programming for data analysis.',
        'This course covers Python basics, data manipulation, and visualization.',
        'course03.jpg',
        99,
        'Course',
        'Beginner',
        'Data Science',
        1,
        CURRENT_TIMESTAMP(),
        '["Python basics: variables, data types, control structures", "Data manipulation with pandas", "Data visualization with matplotlib and seaborn"]'
    ),
    (
        'English Literature',
        'Explore classic and modern works of English literature.',
        'This course covers novels, poetry, and literary analysis.',
        'course04.jpg',
        69,
        'Course',
        'Intermediate',
        'Literature',
        4,
        CURRENT_TIMESTAMP(),
        '["Classic novels: Shakespeare, Austen, Dickens", "Modern literature: Hemingway, Woolf, Morrison", "Literary analysis techniques"]'
    ),
    (
        'Digital Marketing Fundamentals',
        'Master the basics of digital marketing.',
        'This course covers SEO, social media marketing, and email campaigns.',
        'course05.jpg',
        89,
        'Course',
        'Intermediate',
        'Marketing',
        4,
        CURRENT_TIMESTAMP(),
        '["Search engine optimization (SEO)", "Social media marketing strategies", "Email marketing best practices"]'
    ),
    (
        'Introduction to Economics',
        'Learn fundamental principles of economics.',
        'This course covers microeconomics, macroeconomics, and economic theories.',
        'course06.jpg',
        79,
        'Course',
        'Beginner',
        'Economics',
        3,
        CURRENT_TIMESTAMP(),
        '["Supply and demand", "Gross Domestic Product (GDP)", "Keynesian and neoclassical economics"]'
    ),
    (
        'Spanish Language Basics',
        'Learn basic Spanish vocabulary and grammar.',
        'This course covers greetings, numbers, and everyday expressions in Spanish.',
        'course07.jpg',
        59,
        'Course',
        'Beginner',
        'Language',
        4,
        CURRENT_TIMESTAMP(),
        '["Greetings and introductions", "Numbers and counting", "Common phrases for everyday situations"]'
    ),
    (
        'Machine Learning Foundations',
        'Introduction to machine learning algorithms.',
        'This course covers supervised learning, unsupervised learning, and model evaluation.',
        'course08.jpg',
        99,
        'Course',
        'Intermediate',
        'Data Science',
        1,
        CURRENT_TIMESTAMP(),
        '["Supervised learning algorithms: regression, classification", "Unsupervised learning techniques: clustering, dimensionality reduction", "Model evaluation and validation"]'
    ),
    (
        'Introduction to Drawing',
        'Learn the basics of drawing.',
        'This course covers line, shape, shading, and perspective drawing techniques.',
        'course09.jpg',
        69,
        'Course',
        'Beginner',
        'Art',
        5,
        CURRENT_TIMESTAMP(),
        '["Basic drawing tools and materials", "Fundamental drawing techniques", "Perspective drawing fundamentals"]'
    ),
    (
        'Introduction to Cryptocurrency',
        'Explore the world of cryptocurrencies.',
        'This course covers blockchain technology, Bitcoin, and altcoins.',
        'course10.jpg',
        89,
        'Course',
        'Beginner',
        'Finance',
        3,
        CURRENT_TIMESTAMP(),
        '["Blockchain technology basics", "Introduction to Bitcoin and Ethereum", "Overview of popular altcoins"]'
    ),
    (
        'Introduction to Cognitive Psychology',
        'Explore the mind and behavior.',
        'This course covers perception, memory, learning, and cognition.',
        'course01.jpg',
        79,
        'Course',
        'Intermediate',
        'Psychology',
        3,
        CURRENT_TIMESTAMP(),
        '["Perception and sensation", "Memory and forgetting", "Learning theories", "Cognitive processes"]'
    ),
    (
        'Introduction to Environmental Science',
        'Learn about the environment and human impacts.',
        'This course covers ecosystems, pollution, and conservation.',
        'course02.jpg',
        79,
        'Course',
        'Beginner',
        'Science',
        3,
        CURRENT_TIMESTAMP(),
        '["Ecosystems and biodiversity", "Pollution and environmental degradation", "Conservation and sustainability"]'
    ),
    (
        'Introduction to Graphic Illustration',
        'Learn the basics of graphic illustration.',
        'This course covers digital illustration tools and techniques.',
        'course03.jpg',
        69,
        'Course',
        'Beginner',
        'Design',
        5,
        CURRENT_TIMESTAMP(),
        '["Introduction to digital illustration software", "Drawing tools and techniques", "Coloring and shading techniques"]'
    ),
    (
        'Introduction to Philosophy',
        'Explore philosophical ideas and theories.',
        'This course covers metaphysics, ethics, and logic.',
        'course04.jpg',
        69,
        'Course',
        'Intermediate',
        'Philosophy',
        3,
        CURRENT_TIMESTAMP(),
        '["Metaphysical concepts", "Ethical theories", "Logic and critical thinking"]'
    ),
    (
        'Introduction to Game Development',
        'Learn the basics of game development.',
        'This course covers game design, programming, and game engines.',
        'course05.jpg',
        89,
        'Course',
        'Intermediate',
        'Programming',
        1,
        CURRENT_TIMESTAMP(),
        '["Game design principles", "Programming languages for game development", "Game engines and development environments"]'
    ),
    (
        'Introduction to Human Anatomy',
        'Explore the structure of the human body.',
        'This course covers the skeletal, muscular, and nervous systems.',
        'course06.jpg',
        79,
        'Course',
        'Beginner',
        'Science',
        3,
        CURRENT_TIMESTAMP(),
        '["Skeletal system", "Muscular system", "Nervous system"]'
    ),
    (
        'Creative Writing Workshop',
        'Develop your creative writing skills.',
        'This course covers fiction, poetry, and storytelling techniques.',
        'course07.jpg',
        69,
        'Course',
        'Intermediate',
        'Writing',
        4,
        CURRENT_TIMESTAMP(),
        '["Fiction writing techniques", "Poetry writing styles", "Storytelling fundamentals"]'
    ),
    (
        'Introduction to Astrophysics',
        'Explore the universe and celestial bodies.',
        'This course covers stars, galaxies, black holes, and cosmology.',
        'course08.jpg',
        79,
        'Course',
        'Beginner',
        'Science',
        3,
        CURRENT_TIMESTAMP(),
        '["Stellar classification", "Galaxy formation", "Black holes and wormholes", "The Big Bang theory"]'
    ),
    (
        'Fashion Design Fundamentals',
        'Learn the basics of fashion design.',
        'This course covers fashion sketching, fabric selection, and garment construction.',
        'course09.jpg',
        69,
        'Course',
        'Beginner',
        'Fashion',
        5,
        CURRENT_TIMESTAMP(),
        '["Fashion sketching techniques", "Fabric types and properties", "Garment construction methods"]'
    ),
    (
        'Introduction to Artificial Intelligence',
        'Explore the fundamentals of AI.',
        'This course covers AI algorithms, machine learning, and neural networks.',
        'course10.jpg',
        99,
        'Course',
        'Intermediate',
        'Technology',
        1,
        CURRENT_TIMESTAMP(),
        '["Introduction to AI", "Machine learning algorithms", "Neural network architectures"]'
    ),
    (
        'Introduction to Digital Photography',
        'Learn digital photography techniques.',
        'This course covers camera settings, composition, and post-processing.',
        'course02.jpg',
        69,
        'Course',
        'Beginner',
        'Photography',
        5,
        CURRENT_TIMESTAMP(),
        '["Camera settings and controls", "Composition techniques", "Photo editing basics"]'
    ),
    (
        'Introduction to Business Management',
        'Learn the basics of business management.',
        'This course covers planning, organizing, leading, and controlling.',
        'course03.jpg',
        79,
        'Course',
        'Beginner',
        'Business',
        4,
        CURRENT_TIMESTAMP(),
        '["Business planning", "Organizational structure", "Leadership styles", "Controlling operations"]'
    ),
    (
        'Introduction to Neurobiology',
        'Explore the biology of the nervous system.',
        'This course covers neurons, synapses, neurotransmitters, and brain functions.',
        'course04.jpg',
        79,
        'Course',
        'Beginner',
        'Science',
        3,
        CURRENT_TIMESTAMP(),
        '["Neuron structure and function", "Synaptic transmission", "Neurotransmitter systems", "Brain regions and functions"]'
    ),
    (
        'Creative Digital Media',
        'Learn digital media production techniques.',
        'This course covers video editing, graphic design, and multimedia storytelling.',
        'course05.jpg',
        69,
        'Course',
        'Intermediate',
        'Media',
        1,
        CURRENT_TIMESTAMP(),
        '["Video editing techniques", "Graphic design principles", "Multimedia storytelling methods"]'
    ),
    (
        'Introduction to Political Science',
        'Understand political systems and theories.',
        'This course covers democracy, authoritarianism, and international relations.',
        'course06.jpg',
        79,
        'Course',
        'Beginner',
        'Political Science',
        3,
        CURRENT_TIMESTAMP(),
        '["Political ideologies", "Government systems", "International diplomacy"]'
    ),
    (
        'Introduction to Interior Design',
        'Learn the principles of interior design.',
        'This course covers space planning, color theory, and interior styling.',
        'course07.jpg',
        69,
        'Course',
        'Beginner',
        'Design',
        5,
        CURRENT_TIMESTAMP(),
        '["Space planning techniques", "Color psychology", "Interior decoration principles"]'
    ),
    (
        'Introduction to Quantum Mechanics',
        'Explore the principles of quantum physics.',
        'This course covers wave-particle duality, quantum states, and entanglement.',
        'course08.jpg',
        89,
        'Course',
        'Intermediate',
        'Science',
        3,
        CURRENT_TIMESTAMP(),
        '["Quantum wave functions", "Particle-wave duality", "Quantum entanglement"]'
    ),
    (
        'Introduction to Marketing Analytics',
        'Learn data analysis techniques for marketing.',
        'This course covers customer segmentation, campaign analysis, and ROI measurement.',
        'course09.jpg',
        89,
        'Course',
        'Intermediate',
        'Marketing',
        4,
        CURRENT_TIMESTAMP(),
        '["Customer segmentation methods", "Campaign performance analysis", "ROI measurement techniques"]'
    ),
    (
        'Introduction to Linguistics',
        'Understand language structure and meaning.',
        'This course covers phonetics, syntax, semantics, and language acquisition.',
        'course10.jpg',
        79,
        'Course',
        'Beginner',
        'Language',
        3,
        CURRENT_TIMESTAMP(),
        '["Phonetic transcription", "Syntactic analysis", "Semantic interpretation", "Language acquisition theories"]'
    ),
    (
        'Introduction to Robotics',
        'Explore the world of robotics.',
        'This course covers robot design, kinematics, sensors, and programming.',
        'course01.jpg',
        89,
        'Course',
        'Intermediate',
        'Technology',
        1,
        CURRENT_TIMESTAMP(),
        '["Robot design principles", "Kinematics and dynamics", "Sensor technologies", "Robot programming languages"]'
    ),
    (
        'Introduction to Archaeology',
        'Discover the study of ancient civilizations.',
        'This course covers excavation methods, artifact analysis, and cultural heritage.',
        'course02.jpg',
        79,
        'Course',
        'Beginner',
        'History',
        3,
        CURRENT_TIMESTAMP(),
        '["Excavation techniques", "Artifact classification", "Cultural heritage preservation"]'
    );

-- Inserting data into the lesson table
INSERT INTO
    `lesson` (`title`, `description`, `video`, `course_id`)
VALUES
    (
        'Introduction to Python',
        'Basic concepts of Python.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        1
    ),
    (
        'Lists',
        'Understanding lists in Python.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        1
    ),
    (
        'Dictionary',
        'Introduction to dictionaries in Python.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        1
    ),
    (
        'Error Handling in Python',
        'Learn about error handling techniques in Python.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        1
    ),
    (
        'File Handling in Python',
        'Explore file handling concepts in Python.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        1
    ),
    (
        'Introduction to Cybersecurity',
        'Basic concepts of cybersecurity.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        2
    ),
    (
        'Cybersecurity Threats and Attacks',
        'Understanding common cybersecurity threats and attack vectors.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        2
    ),
    (
        'Network Security',
        'Introduction to network security principles and practices.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        2
    ),
    (
        'Cryptography Basics',
        'Fundamentals of cryptography and encryption techniques.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        2
    ),
    (
        'Security Policies and Procedures',
        'Learn about security policies and procedures for maintaining cybersecurity.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        2
    ),
    (
        'Introduction to Probability',
        'Basic concepts of probability theory.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        5
    ),
    (
        'Conditional Probability',
        'Understanding conditional probability.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        5
    ),
    (
        'Probability Distributions',
        'Introduction to probability distributions.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        5
    ),
    (
        'Hypothesis Testing',
        'Basics of hypothesis testing in statistics.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        5
    ),
    (
        'Correlation and Regression',
        'Understanding correlation and regression analysis.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        5
    ),
    (
        'Sampling Techniques',
        'Different sampling techniques in statistics.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        5
    ),
    (
        'ANOVA',
        'Introduction to analysis of variance.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        5
    ),
    (
        'Central Limit Theorem',
        'Understanding the central limit theorem.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        5
    ),
    (
        'Introduction to R Programming',
        'Basic concepts of R programming language.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        5
    ),
    (
        'Data Wrangling in R',
        'Manipulating data with R programming.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        5
    ),
    (
        'Data Visualization in R',
        'Creating visualizations using R packages.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        5
    ),
    (
        'Introduction to SQL',
        'Basic SQL commands and queries.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        6
    ),
    (
        'Joins and Subqueries',
        'Understanding joins and subqueries in SQL.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        6
    ),
    (
        'Aggregate Functions',
        'Using aggregate functions in SQL.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        6
    ),
    (
        'Database Design',
        'Principles of database design.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        6
    ),
    (
        'Introduction to NoSQL',
        'Overview of NoSQL databases.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        6
    ),
    (
        'MongoDB Basics',
        'Basic operations in MongoDB.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        6
    ),
    (
        'Indexing in MongoDB',
        'Optimizing queries with indexing in MongoDB.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        6
    ),
    (
        'Data Modeling in MongoDB',
        'Designing data models in MongoDB.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        6
    ),
    (
        'Introduction to Big Data',
        'Understanding big data concepts.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        7
    ),
    (
        'Hadoop Fundamentals',
        'Introduction to Apache Hadoop.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        7
    ),
    (
        'MapReduce',
        'Basics of MapReduce programming.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        7
    ),
    (
        'Hive and Pig',
        'Working with Hive and Pig for data processing.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        7
    ),
    (
        'Introduction to Spark',
        'Overview of Apache Spark.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        7
    ),
    (
        'Spark RDDs',
        'Working with Resilient Distributed Datasets in Spark.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        7
    ),
    (
        'Spark DataFrames',
        'Introduction to Spark DataFrames.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        7
    ),
    (
        'Spark Streaming',
        'Real-time data processing with Spark Streaming.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        7
    ),
    (
        'Introduction to Machine Learning',
        'Basic concepts of machine learning.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        8
    ),
    (
        'Supervised Learning',
        'Introduction to supervised learning algorithms.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        8
    ),
    (
        'Unsupervised Learning',
        'Introduction to unsupervised learning algorithms.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        8
    ),
    (
        'Regression Analysis',
        'Understanding regression analysis techniques.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        8
    ),
    (
        'Classification Algorithms',
        'Overview of classification algorithms.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        8
    ),
    (
        'Clustering Algorithms',
        'Overview of clustering algorithms.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        8
    ),
    (
        'Dimensionality Reduction',
        'Techniques for dimensionality reduction.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        8
    ),
    (
        'Model Evaluation',
        'Evaluating machine learning models.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        8
    ),
    (
        'Introduction to Deep Learning',
        'Basic concepts of deep learning.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        8
    ),
    (
        'Neural Networks Basics',
        'Introduction to neural networks.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        8
    ),
    (
        'Convolutional Neural Networks',
        'Understanding convolutional neural networks.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        8
    ),
    (
        'Recurrent Neural Networks',
        'Understanding recurrent neural networks.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        8
    ),
    (
        'Transfer Learning',
        'Introduction to transfer learning.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        8
    ),
    (
        'Introduction to Natural Language Processing',
        'Basic concepts of NLP.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        8
    ),
    (
        'Text Preprocessing',
        'Preprocessing text data for NLP tasks.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        8
    ),
    (
        'Word Embeddings',
        'Understanding word embeddings.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        8
    ),
    (
        'Text Classification',
        'Classification of text documents.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        8
    ),
    (
        'Named Entity Recognition',
        'Extracting named entities from text.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        8
    ),
    (
        'Sentiment Analysis',
        'Analyzing sentiment in text data.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        8
    ),
    (
        'Topic Modeling',
        'Discovering topics in text documents.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        8
    ),
    (
        'Introduction to Computer Vision',
        'Basic concepts of computer vision.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        8
    ),
    (
        'Image Processing Basics',
        'Basic operations in image processing.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        8
    ),
    (
        'Feature Extraction',
        'Extracting features from images.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        8
    ),
    (
        'Object Detection',
        'Detecting objects in images.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        8
    ),
    (
        'Image Classification',
        'Classifying images into categories.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        8
    ),
    (
        'Semantic Segmentation',
        'Segmenting images into semantic regions.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        8
    ),
    (
        'Image Captioning',
        'Generating captions for images.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        8
    ),
    (
        'Introduction to Reinforcement Learning',
        'Basic concepts of reinforcement learning.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        8
    ),
    (
        'Markov Decision Processes',
        'Understanding Markov decision processes.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        8
    ),
    (
        'Q-Learning',
        'Introduction to Q-learning algorithm.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        8
    ),
    (
        'Deep Q-Networks',
        'Understanding deep Q-networks.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        8
    ),
    (
        'Policy Gradient Methods',
        'Introduction to policy gradient methods.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        8
    ),
    (
        'Actor-Critic Methods',
        'Understanding actor-critic methods.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        8
    ),
    (
        'Introduction to Robotics',
        'Basic concepts of robotics.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        9
    ),
    (
        'Robot Kinematics',
        'Understanding robot kinematics.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        9
    ),
    (
        'Robot Dynamics',
        'Introduction to robot dynamics.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        9
    ),
    (
        'Motion Planning',
        'Planning motion for robots.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        9
    ),
    (
        'Robot Control',
        'Control strategies for robots.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        9
    ),
    (
        'Sensors and Perception',
        'Sensors used in robotics and perception.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        9
    ),
    (
        'Localization and Mapping',
        'Robot localization and mapping techniques.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        9
    ),
    (
        'Robot Manipulation',
        'Manipulation techniques for robots.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        9
    ),
    (
        'Introduction to Autonomous Vehicles',
        'Basic concepts of autonomous vehicles.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        9
    ),
    (
        'Sensing and Localization',
        'Sensing and localization in autonomous vehicles.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        9
    ),
    (
        'Path Planning',
        'Planning paths for autonomous vehicles.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        9
    ),
    (
        'Control Systems',
        'Control systems for autonomous vehicles.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        9
    ),
    (
        'Decision Making',
        'Decision-making algorithms for autonomous vehicles.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        9
    ),
    (
        'Simultaneous Localization and Mapping',
        'SLAM techniques for autonomous vehicles.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        9
    ),
    (
        'Introduction to Blockchain Technology',
        'Basic concepts of blockchain technology.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        10
    ),
    (
        'Cryptographic Hash Functions',
        'Understanding cryptographic hash functions.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        10
    ),
    (
        'Public Key Cryptography',
        'Introduction to public key cryptography.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        10
    ),
    (
        'Digital Signatures',
        'Understanding digital signatures.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        10
    ),
    (
        'Consensus Mechanisms',
        'Overview of consensus mechanisms.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        10
    ),
    (
        'Smart Contracts',
        'Introduction to smart contracts.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        10
    ),
    (
        'Decentralized Applications',
        'Developing decentralized applications.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        10
    ),
    (
        'Introduction to Ethereum',
        'Basic concepts of the Ethereum platform.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        10
    ),
    (
        'Introduction to Cybersecurity',
        'Basic concepts of cybersecurity.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        10
    ),
    (
        'Cryptography Basics',
        'Understanding cryptographic techniques.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        10
    ),
    (
        'Network Security',
        'Securing computer networks.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        10
    ),
    (
        'Web Application Security',
        'Securing web applications.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        10
    ),
    (
        'Cloud Security',
        'Securing cloud computing environments.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        10
    ),
    (
        'Incident Response',
        'Responding to cybersecurity incidents.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        10
    ),
    (
        'Introduction to Malware Analysis',
        'Understanding malware analysis techniques.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        10
    ),
    (
        'Digital Forensics',
        'Basic concepts of digital forensics.',
        'https://www.youtube.com/embed/fc6o1gwqZuA',
        10
    );

-- Inserting data into the learning_status table
INSERT INTO
    `learning_status` (
        `student_username`,
        `course_id`,
        `lesson_id`,
        `status`
    )
VALUES
    ('bob123', 1, 1, 1),
    ('bob123', 1, 2, 1),
    ('bob123', 1, 3, 1),
    ('bob123', 1, 4, 1),
    ('bob123', 1, 5, 1),
    ('bob123', 2, 6, 0),
    ('bob123', 2, 7, 0),
    ('bob123', 2, 8, 0),
    ('bob123', 2, 9, 0),
    ('bob123', 2, 10, 0);
