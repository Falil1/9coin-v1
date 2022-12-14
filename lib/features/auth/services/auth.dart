import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ninecoin/model/auth/login/login_response.dart';
import '../../../config/config.dart';
import '../../../config/helper/auth_helper/auth_helper.dart';
import '../../../model/auth/register/register_response.dart';
import '../../../model/auth/register/user_register.dart';

Future<RegisterResponse> registerUser(
    {required UserRegister registerUser}) async {
  String url = Api.register;
  var uri = Uri.parse(url);

  var response = await http.post(
    uri,
    headers: {"Content-Type": "application/json"},
    body: json.encode(registerUser.toMap()),
  );
  if (response.statusCode == 200 || response.statusCode == 201) {
    RegisterResponse user =
        RegisterResponse.fromJson(json.decode(response.body));
    setUser(user);
    return user;
  } else {
    throw json.decode(response.body)["error"];
  }
}

Future<String> loginUser(
    {required String email, required String password}) async {
  String url = Api.login;
  var uri = Uri.parse(url);

  var response = await http.post(uri,
      headers: {"Content-Type": "application/json"},
      body: json.encode({"email": email, "password": password}));
  if (response.statusCode == 200 || response.statusCode == 201) {
    LoginResponse user =
        LoginResponse.fromJson(json.decode(response.body));
    setLoginUserInfo(user);
    return "Success";
  } else {
    throw json.decode(response.body)["error"];
  }
}
