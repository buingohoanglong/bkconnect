import 'package:bkconnect/UserInfo.dart';
import 'package:http/http.dart' as http;
import 'UserInfo.dart';


class Authentication {
  Future<String> signUp(UserInfo info) {
    var body = info.toJson();
    var header = {"Content-Type": "application/json"};
    final url = 'https://bkconnect.serveo.net/register/';
    http.post(url,headers: header, body: body).then((response) {
      print(response.body); 
      print("Register successfully");
      return "Register successfully";
    });
  }

  Future<String> signIn(UserInfo info) {
    var body = info.toJson();
    var header = {"Content-Type": "application/json"};
    final url = 'https://bkconnect.serveo.net/login/';
    http.post(url,headers: header, body: body).then((response) {
      print(response.body); 
      print("Login successfully");
      return "Login successfully";
    });
  }
}