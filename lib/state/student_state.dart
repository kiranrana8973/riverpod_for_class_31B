import 'package:riverpod_for_class/model/student.dart';

class StudentState {
  final bool isLoading;
  final List<Student> lstStudents;

  StudentState({required this.isLoading, required this.lstStudents});

  factory StudentState.inital() {
    return StudentState(isLoading: false, lstStudents: []);
  }

  StudentState copyWith({
    bool? isLoading,
    Student? student,
  }) {
    return StudentState(
      isLoading: isLoading ?? this.isLoading,
      // Add student to lststudent
      lstStudents: student != null ? [...lstStudents, student] : lstStudents,
    );
  }
}
