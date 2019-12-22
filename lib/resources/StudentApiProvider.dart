import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:unistudent/models/StudentModel.dart';
import 'package:unistudent/services/UserStore.dart';

class StudentApiProvider {
  Client client = new Client();

  Future<StudentModel> fetchStudentData() async {

    String mail = await UserStore().getUserEmail();
    String pss = await UserStore().getUserPassword();

    final response = await client.post('http://192.168.1.19:3000/user/student', body: {"email": mail, "password": pss});

    if(response.statusCode == 200){
      return StudentModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Falied to load student Data");
    }
  }
}