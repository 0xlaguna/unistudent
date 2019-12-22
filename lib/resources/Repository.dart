import 'dart:async';
import 'package:unistudent/models/StudentModel.dart';
import 'package:unistudent/resources/StudentApiProvider.dart';

class Repository {
  final StudentApiProvider studentApi = StudentApiProvider();

  Future<StudentModel> fetchStudentData() => studentApi.fetchStudentData();
}