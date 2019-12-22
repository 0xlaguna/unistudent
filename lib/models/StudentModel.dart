import 'dart:developer';

class StudentModel {
  String imgb64;
  PersonalData personalData;
  CareerData careerData;

  StudentModel.fromJson(Map<String, dynamic> parsedJson){
    imgb64 = parsedJson['simgb64'];
    var psdata = parsedJson['psdata'];
    var csdata = parsedJson['csdata'];
    List<String> listSdata = List.from(psdata);
    List<String> listCdata = List.from(csdata);
    personalData = PersonalData.fromJson(listSdata);
    careerData = CareerData.fromJson(listCdata);
  }
}

class PersonalData {
  String noCarnet;
  String nombres;
  String apellidos;
  String fechaNac;
  String sexo;
  String estadoCivil;
  String direccion;
  String telefono1;
  String telefono2;
  String correo;
  String celular;


  PersonalData.fromJson(List<String> parsedJson){
    noCarnet = parsedJson[0];
    nombres = parsedJson[1];
    apellidos = parsedJson[2];
    fechaNac = parsedJson[3];
    sexo = parsedJson[4];
    estadoCivil = parsedJson[5];
    direccion = parsedJson[6];
    telefono1 = parsedJson[7];
    telefono2 = parsedJson[8];
    correo = parsedJson[9];
    celular = parsedJson[10];
  }
}

class CareerData {
  String facultad;
  String carrera;
  String planStudio;
  String turno;
  String estado;
  String anioIngreso;

  CareerData.fromJson(List<String> parsedJson){
    facultad = parsedJson[0];
    carrera = parsedJson[1];
    planStudio = parsedJson[2];
    turno = parsedJson[3];
    estado = parsedJson[4];
    anioIngreso = parsedJson[5];
  }
}