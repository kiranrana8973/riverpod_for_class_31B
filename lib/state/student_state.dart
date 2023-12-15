import 'package:riverpod_for_class/model/student.dart';

class StudentState {
  final List<Student> lstStudents;
  final bool isLoading;

  // Cons
  StudentState({
    required this.lstStudents,
    required this.isLoading,
  });

  // Const
  factory StudentState.inital() {
    return StudentState(lstStudents: [], isLoading: false);
  }

  // Copy with
  StudentState copyWith({Student? student, bool? isLoading}) {
    return StudentState(
      lstStudents: student != null ? [...lstStudents, student] : lstStudents,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

// lstStudent =  []
// lstStudent =  ['Kiran']
// lstStudent =  ['Kiran','Katrina']

