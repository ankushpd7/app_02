import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        appBar: AppBar(title: Text('Create Account'),),
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
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    createAccount();

                  },
                  child: Text('Create Account')),
            ],
          ),
        ),
      ),
    );
  }

  Future createAccount()async{
    String email = emailController.text;
    String password = passwordController.text;

    SharedPreferences sf = await  SharedPreferences.getInstance();
    sf.setString('user_mail', email);
    sf.setString('user_password', password);
    print('Account created successfully');
    Navigator.pop(context);
  }

}
