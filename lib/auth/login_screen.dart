import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoping_app/api/repository.dart';

import '../api/model_auth.dart';
import '../pref/shared_pref_controller.dart';
import '../wedgits/constant.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Repository repository= Repository();
  late ModelAuth modelAuth;
  bool _obsecureText= true;
  bool _isLoggedIn = false;
  var formKey = GlobalKey<FormState>();
  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;

  Future<void> login()async {
    await repository.login(
        email: emailTextController.text,
        password: passwordTextController.text
    ).then((value) async {
      if(value.status == true)
      {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLoggedIn', true);
        modelAuth=value;
        log(modelAuth.message);
        Navigator.pushNamed(context, mainScreen);
      }
      else{
        log(modelAuth.message);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('خطأ في تسجيل الدخول'),
              content: Text('تعذر التحقق من معلومات تسجيل الدخول.'),
              actions: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    } ,
                    child: Text('موافق'),)
              ],
            );
          },
        );
      }
    }).catchError((error)
    {
      log('error : ${error.toString()}');
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailTextController=TextEditingController();
    passwordTextController=TextEditingController();
    //login();
  }
  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Login',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          key:formKey ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Welcome Back...',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Login to start using app',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black38,
                  ),
                ),
              ),
              SizedBox(height: 30,),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailTextController,
                validator: (email)
                {
                  if(email!.isEmpty)
                  {
                    return 'This Field is required';
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Enter Your Email',
                  prefixIcon: Icon(Icons.email),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: passwordTextController,
                validator: (password)
                {
                  if(password!.isEmpty)
                  {
                    return 'This Field is required';
                  }
                },
                obscureText: _obsecureText,
                decoration: InputDecoration(
                  hintText: 'Enter Your Password',
                  prefixIcon: Icon(Icons.lock),
                  //suffixIcon: Icon(Icons.remove_red_eye),
                  suffixIcon:IconButton(
                      onPressed: (){
                        setState(() {
                          _obsecureText=!_obsecureText;
                        });
                      }, icon: Icon(_obsecureText ? Icons.visibility_off :Icons.visibility)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: //_performLogin,
                      ()async{
                    if(formKey.currentState!.validate()){
                      await login();
                      //Navigator.pushNamed(context, mainScreen);
                    }
                  },
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
  // void _performLogin(){
  //   if(_checkData()){
  //     _login();
  //   }
  // }
  //
  // bool _checkData(){
  //   if(emailTextController.text.isNotEmpty&& passwordTextController.text.isNotEmpty){
  //     return true;
  //   }
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(
  //       content: Text(
  //           'Enter email & password'
  //       ),
  //       backgroundColor: Colors.red,
  //       behavior: SnackBarBehavior.floating,
  //     ),
  //   );
  //   return false;
  // }
  //
  // void _login() async{
  //   await SharedPrefController().save(email: emailTextController.text);
  //   // Navigator.pushReplacementNamed(context, '/wallet_screen');
  //
  //   ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('logged in successfully'),
  //         behavior: SnackBarBehavior.floating,
  //         backgroundColor: Colors.green,
  //       )).closed.then((value) => Navigator.pushReplacementNamed(context,mainScreen ));
  // }
}
