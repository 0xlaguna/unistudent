class User {
  final String token;
  final String userId;

  User({this.token, this.userId});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      token: json['token'],
      userId: json['userId']
    );
  }
}