import 'package:flutter/material.dart';
import 'package:tugas_1/helpers/database_helper.dart';
import 'package:tugas_1/models/users_model.dart';
import 'package:tugas_1/routes/route_names.dart';

class AuthController {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var userList = <UserModel>[];
  String username = '';
  
  Future<void> login(BuildContext context) async {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();
    if(username == "" || password == ""){
      showSnackbar(context, 'Username dan Password tidak boleh kosong', Colors.red);
      return;
    }
    UserModel? user = await _dbHelper.loginUser(username, password);
    username = usernameController.text;
    if (user != null) {
      showSnackbar(context, "Login Berhasil! Selamat Datang $username", Colors.green);
      Navigator.pushReplacementNamed(context, RouteName.menu, arguments: username);
    } else {
      showSnackbar(context, "Login Gagal! Kredential tidak valid", Colors.red);
    }
  }

  Future<void> register(BuildContext context) async {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();
    if(username.length < 6 || username == ""){
      showSnackbar(context, 'Username minimal 6 karakter', Colors.red);
      return;
    }
    else if(password.length < 8 ){
      showSnackbar(context, 'Password minimal 8 karakter', Colors.red);
      return;
    }
    UserModel? existingUser = await _dbHelper.getUserByUsername(username);
    if (existingUser != null) {
      showSnackbar(context, 'Username sudah terdaftar', Colors.red);
      return;
    }
    UserModel user = UserModel(username: username, password: password);
    await _dbHelper.registerUser(user);
    showSnackbar(context, "Register Berhasil!", Colors.green);
    usernameController.clear();
    passwordController.clear();
  }

  void showSnackbar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }
}
