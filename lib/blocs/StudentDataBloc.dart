
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:unistudent/models/StudentModel.dart';
import 'package:unistudent/resources/Repository.dart';

class StudentDataBloc {
  final Repository _repository = Repository();
  final _studentDataFetcher = PublishSubject<StudentModel>();

  Observable<StudentModel> get allStudentData => _studentDataFetcher.stream;

  //Get all student data
  fetchAllStudentData() async {
    StudentModel studentModel = await _repository.fetchStudentData();
    _studentDataFetcher.sink.add(studentModel);
  }

  dispose(){
    _studentDataFetcher.close();
  }
}

final studentInfoBloc = StudentDataBloc();