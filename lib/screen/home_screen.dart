import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:unistudent/blocs/StudentDataBloc.dart';
import 'package:unistudent/models/InitialDataModel.dart';
import 'package:unistudent/services/UserStore.dart';
import 'package:unistudent/models/StudentModel.dart';
import 'package:http/http.dart' as Http;
import 'dart:convert';
import 'dart:typed_data';

class HomeScreen extends StatefulWidget {
  final InitialDataModel model;

  const HomeScreen({this.model});

  @override
  _HomeScreen createState() => _HomeScreen(initialModel: model);
} 

class _HomeScreen extends State<HomeScreen> {
  final InitialDataModel initialModel;
  String email;

  _HomeScreen({this.initialModel});

  @override
  void initState(){
    super.initState();
    //Get email
    (() async {
      email = await UserStore().getUserEmail();
    })();

    //Fetch studentData
    //studentInfoBloc.fetchAllStudentData();

    //Decode img

  }

  @override 
  void dispose() {
    studentInfoBloc.dispose();
    super.dispose();
  }
  /*Future<String> getPpBase() async {
      var email = await UserStore().getUserEmail();
      var password = await UserStore().getUserPassword();
      var url = 'http://192.168.1.7:3000/user/student';
      final response = await Http.post(url, body: {'email': email, 'password': password});

      if(response.statusCode == 200){
        var body = json.decode(response.body);
        return Future.value(base64.encode(body['Img64']));
      } else {
        return Future.error("Error");
      }
  }*/

  Widget loadingIndicator() {
    return Center(
      child: SpinKitWave(color: Colors.pink, type: SpinKitWaveType.start,),
    );
  }

  //Mal uso de recursos fucking nigger
  Widget drawerLoading() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: SpinKitWave(color: Colors.pink, type: SpinKitWaveType.start,),
          ),
        ],
      ),
    );
  }

  Widget getImg(){
    Uint8List bytes = base64.decode(initialModel.imgb64);
    return Image.memory(bytes);
  }

  Widget drawer(){
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(initialModel.fullName),
            accountEmail: Text(initialModel.email),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: ClipOval(child: getImg(),),
              radius: 30.0,
            ),
          ),
          ListTile(
            title: Text("Estudiante"),
            onTap: (){
              //something
            },
          ),
          ListTile(
            title: Text("Regristro de notas"),
            onTap: () {

            },
          ),
          ListTile(
            title: Text("Hoja de matricula"),
            onTap: () {
              
            },
          ),
          ListTile(
            title: Text("Horario de clases"),
            onTap: () {
              
            },
          ),
          ListTile(
            title: Text("Plan de estudios"),
            onTap: () {
              
            },
          ),
          Divider(
            height: 40.0, 
            color: Colors.purple,
            indent: 10.0,
          ),
          AboutListTile(
            icon: ClipOval(child: Text("<>"),),
            applicationName: "UNISTUDENT",
            applicationVersion: "0.5-beta1",
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFFFCE4EC),
      appBar: AppBar(
        title: Text("Unistudent"),
      ),
      body: StreamBuilder(
        stream: studentInfoBloc.allStudentData,
        builder: (context, AsyncSnapshot<StudentModel> snapshot) {
          if(snapshot.hasData){
            return Center(
              child: Text("Data loaded!")
            );
          } else if(snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return loadingIndicator();
        },
      ),
      drawer: drawer(),
    );
  }
}