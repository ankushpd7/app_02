import 'package:app_02/home_screen.dart';
import 'package:app_02/my_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    takeDecision();
    super.initState();
  }

  Future takeDecision()async{
    SharedPreferences sf = await SharedPreferences.getInstance();
   bool? isLogin =  sf.getBool('isLogin');
   if(isLogin == true){
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
       return HomeScreen();
     }));
   }else{
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
       return LoginScreen();
     }));
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('App 2'),),
    );
  }
}
