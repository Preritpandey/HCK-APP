import 'package:hck_app/data/data_model.dart';

// void main() {
// Sample data for a college class
CollegeClass collegeClass = CollegeClass(
  studentName: 'John Doe',
  className: 'Computer Science',
  dailyClasses: [
    ClassDetails(
      className: 'Introduction to Programming',
      startTime: '9:00 AM',
      endTime: '11:00 AM',
      venue: 'Room 101',
      teacherName: 'Prof. Smith',
    ),
    ClassDetails(
      className: 'Data Structures and Algorithms',
      startTime: '11:30 AM',
      endTime: '1:30 PM',
      venue: 'Room 203',
      teacherName: 'Prof. Johnson',
    ),
  ],
  extraEvents: ['Guest Lecture', 'Workshop'],
  emailId: 'johndoe@example.com',
  programDetails: [
    ProgramDetails(
      programName: 'Bachelor of Science in Computer Science',
      subjectList: ['Programming', 'Data Structures', 'Algorithms'],
      creditHours: 120,
    ),
    ProgramDetails(
      programName: 'Bachelor of Arts in Mathematics',
      subjectList: ['Calculus', 'Linear Algebra', 'Statistics'],
      creditHours: 130,
    ),
  ],
  notifications: [
    Notification(
      title: 'Important Announcement',
      description:
          'The class schedule for next week has been updated. Please check your email for details.',
    ),
    Notification(
      title: 'Reminder',
      description:
          'Don\'t forget about the workshop on Friday at 2:00 PM in Room 105.',
    ),
  ],
);
