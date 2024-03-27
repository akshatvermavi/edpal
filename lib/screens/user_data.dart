//
// class UserData extends ChangeNotifier {
//   String schoolName = "";
//   String studentName = "";
//   String className = "";
//   String registrationNumber = "";
//
//   void updateProfile({
//     required String schoolName,
//     required String studentName,
//     required String className,
//     required String registrationNumber,
//   }) {
//     this.schoolName = schoolName;
//     this.studentName = studentName;
//     this.className = className;
//     this.registrationNumber = registrationNumber;
//     notifyListeners();
//   }
// }
class UserData {
  final String name;
  final String username;
  final String email;
  final String school;
  final String address;
  final String? subject; // Only applicable for teachers
  final String? studentClass; // Only applicable for students
  final String? rollNumber; // Only applicable for students
  final String registrationNumber; // Common for all

  UserData({
    required this.name,
    required this.username,
    required this.email,
    required this.school,
    required this.address,
    this.subject, // Nullable for teachers
    this.studentClass, // Nullable for students
    this.rollNumber, // Nullable for students
    required this.registrationNumber,
  });
}
