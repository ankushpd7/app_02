import 'package:app_02/create_account_screen.dart';
import 'package:app_02/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        appBar: AppBar(title: Text('Login'),),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(hintText: 'Enter Email'),
              ),
              SizedBox(
                height: 16,
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(hintText: 'Enter password'),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    login();
                  },
                  child: Text('Login')),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return CreateAccountScreen();
                    }));
                  },
                  child: Text('Create Account')),
            ],
          ),
        ),
      ),
    );
  }

  Future  login()async{
    String email = emailController.text;
    String password = passwordController.text;
    SharedPreferences sf = await SharedPreferences.getInstance();
    String? aEmail = sf.getString('user_mail');
    String? aPassowrd = sf.getString('user_password');

    if(email == aEmail && password == aPassowrd){
      sf.setBool('isLogin', true);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return HomeScreen();
      }));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Incorrect Email/Passowrd'),));
    }

  }
}
