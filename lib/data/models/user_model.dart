part of '_models.dart';

class UserModel{
  final String uid;
  final String? email;
  UserModel({this.uid = "", this.email = ""});

  Map<String, dynamic> toJson() => _userToJson(this);

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
          email: json["email"] as String,
        );


  Map<String, dynamic> _userToJson(UserModel instance) => <String, dynamic>{
      "email" : instance.email,
      };

}