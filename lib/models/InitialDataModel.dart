class InitialDataModel {
  String imgb64;
  String fullName;
  String email;

  InitialDataModel.fromJson(Map<String, dynamic> parsedJson){
    imgb64 = parsedJson['simgb64'];
    fullName = parsedJson['fullname'];
  }
}