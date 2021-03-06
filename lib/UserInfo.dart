import 'dart:convert';
import 'package:http/http.dart' as http;

class UserInfo {
  String _id;
  String _name;
  String _phone;
  String _email;
  String _password;

  UserInfo({String id, String name, String phone, String email, String password}) {
    _id = id;
    _name = name;
    _phone = phone;
    _email = email;
    _password = password;
  }
  void setID(String id) {_id = id;}
  void setName(String name) {_name = name;}
  void setPhone(String phone) {_phone = phone;}
  void setEmail(String email) {_email = email;}
  void setPassword(String password) {_password = password;}

  String getID() {return _id;}
  String getName() {return _name;}
  String getPhone() {return _phone;}
  String getEmail() {return _email;}
  String getPassword() {return _password;}

  static UserInfo fromMap(Map<String, dynamic> info) {
    return UserInfo(
      name: info["username"],
      id: info["id"],
      email: info["email"],
      phone: info["phone"],
      password: info["password"]
    );
  }

  Map<String, dynamic> toMap() {
    final info = {
      "username": _name,
      "id": _id,
      "email": _email,
      "phone": _phone,
      "password": _password,
    };
    return info;
  }

  static UserInfo fromJson(String jsonString) {
    final info = json.decode(jsonString);
    return UserInfo.fromMap(info);
  }

  String toJson() {
    final info = this.toMap();
    return json.encode(info);
  }
}