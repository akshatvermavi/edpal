
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Edpal'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/image/android/drawable-hdpi/aboutpage.jpg', // Update with your image file path
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'EDPAL is one of the world’s largest communities for students of all grades, subjects, and geophysical locations. When a student joins EDPAL, they gain the acquaintance of fellow pals with a similar background, access to tons of subject-related information, career guidance, and other details that would help them learn more and grow further.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Why EDPAL?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Every nook and corner of a society has students who may or may not know each other but should be connected as students to know each other’s school/education, new techniques, etc. Currently, there is no platform exclusively for connecting students. There are a few that connect teachers and students, but none exclusively for students, where the presence of teachers is optional. This platform can be leveraged by students to share knowledge/notes, post new education-related materials, new courses, and other school-related activities.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Student’s Benefits-',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'A student, once onboarded, would get:',
                style: TextStyle(fontSize: 16),
              ),
              // Add bullet points
              const ListTile(
                leading: Icon(Icons.check),
                title: Text('A platform to share their knowledge with others as knowledge multiplies by sharing and EDPAL thrives on sharing the knowledge.'),
              ),
              const ListTile(
                leading: Icon(Icons.check),
                title: Text('A platform to get connected with fellow students who are either studying in the same school, studying a similar subject in any other school, student within a 5/10 KMs vicinity of his residence, etc.'),
              ),
              const ListTile(
                leading: Icon(Icons.check),
                title: Text('A platform to receive notes from school/teacher and share notes with others.'),
              ),
              // Add more bullet points as needed
              const SizedBox(
                height: 20,
              ),
              const Text(
                'School’s Benefits-',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'The process of joining for a student is via the school. EDPAL will be a gold standard for any onboarded school which would give a good presence in the virtual world for the school. EDPAL would provide the school with:',
                style: TextStyle(fontSize: 16),
              ),
              // Add bullet points for school benefits
              const ListTile(
                leading: Icon(Icons.check),
                title: Text('A platform for sharing school announcements/notes/updates with students.'),
              ),
              const ListTile(
                leading: Icon(Icons.check),
                title: Text('A platform for sharing school-related updates/student’s results of assessments/exams with parents.'),
              ),
              const ListTile(
                leading: Icon(Icons.check),
                title: Text('A platform for appreciating a student in terms of his knowledge, perseverance, and other features which would be a value add to the student during further educational endeavors.'),
              ),
              const ListTile(
                leading: Icon(Icons.check),
                title: Text('Surveys to know if a student understood a particular topic, seeking feedback from students, psychological analysis of student’s current mindset.'),
              ),
              // Add more bullet points as needed
            ],
          ),
        ),
      ),
    );
  }
}
