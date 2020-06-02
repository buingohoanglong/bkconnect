import 'package:bkconnect/UserInfo.dart';
import 'package:http/http.dart' as http;
import 'UserInfo.dart';


class Authentication {
  Future<http.Response> signUp(UserInfo info) async {
    var body = info.toJson();
    var header = {"Content-Type": "application/json"};
    final url = 'https://bkconnect.serveo.net/register/';
    return await http.post(url,headers: header, body: body);
  }

  Future<http.Response> signIn(UserInfo info) async {
    var body = info.toJson();
    var header = {"Content-Type": "application/json"};
    final url = 'https://bkconnect.serveo.net/login/';
    return await http.post(url,headers: header, body: body);
  }
}