class Course {
  String name;
  String code;
  List<List<Map<String, String>>> coursesPerYear;

  Course(this.name, this.code, this.coursesPerYear);
}

// Creating course data for BCS
Course bcs = Course("Bachelor of Computer Science", "BCS", [
  // Year 1 courses
  [
    {"Fundamentals of Computing": "4C102"},
    {"Introductory Programming": "4C303"},
    {"Computational Mathematics": "4C212"},
    {"Computational Mathematics": "4C212"},
    {"Computational Mathematics": "4C212"},
    {"Computational Mathematics": "4C212"},
  ],
  // Year 2 courses
  [
    {"Internet Software Architecture": "4C008"},
    {"Object Oriented Programming": "4C100"},
    {"Advanced Algorithms": "4C501"},
    {"Advanced Algorithms": "4C501"},
    {"Advanced Algorithms": "4C501"},
    {"Advanced Algorithms": "4C501"},
  ],
  // Year 3 courses
  [
    {"Game Dev in Unity": "4C103"},
    {"Software Engineering": "4C503"},
    {"Database Management Systems": "4C504"},
    {"Artificial Intelligence": "4C505"},
    {"Artificial Intelligence": "4C505"},
    {"Artificial Intelligence": "4C505"},
  ]
]);

// Creating course data for BIBM
Course bibm =
    Course("Bachelor of Information and Business Management", "BIBM", [
  // Year 1 courses
  [
    {"Introduction to Business Management": "4B101"},
    {"Business Communication": "4B102"},
    {"Financial Accounting": "4B103"},
    {"Financial Accounting": "4B103"},
    {"Financial Accounting": "4B103"},
    {"Financial Accounting": "4B103"},
  ],
  // Year 2 courses
  [
    {"Information Systems in Business": "4B201"},
    {"Marketing Principles": "4B202"},
    {"Organizational Behavior": "4B203"},
    {"Organizational Behavior": "4B203"},
    {"Organizational Behavior": "4B203"},
    {"Organizational Behavior": "4B203"},
  ],
  // Year 3 courses
  [
    {"Business Law": "4B301"},
    {"Strategic Management": "4B302"},
    {"Operations Management": "4B303"},
    {"Human Resource Management": "4B304"},
    {"E-Commerce": "4B305"},
    {"E-Commerce": "4B305"},
  ]
]);

// Creating course data for MBA
Course mba = Course("Master of Business Administration", "MBA", [
  // Year 1 courses
  [
    {"Managerial Economics": "4M101"},
    {"Marketing Management": "4M102"},
    {"Organizational Behavior": "4M103"},
    {"Managerial Economics": "4M101"},
    {"Marketing Management": "4M102"},
    {"Organizational Behavior": "4M103"}
  ],
  // Year 2 courses
  [
    {"Financial Management": "4M201"},
    {"Human Resource Management": "4M202"},
    {"Business Strategy": "4M203"},
    {"Financial Management": "4M201"},
    {"Human Resource Management": "4M202"},
    {"Business Strategy": "4M203"}
  ],
  // Year 3 courses
  [
    {"Operations Management": "4M301"},
    {"Leadership Development": "4M302"},
    {"Entrepreneurship": "4M303"},
    {"Project Management": "4M304"},
    {"Global Business": "4M305"},
    {"Global Business": "4M305"},
  ]
]);
