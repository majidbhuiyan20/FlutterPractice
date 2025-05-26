import 'package:flutter/material.dart';
import 'package:flutter_practice/auth/service/auth_service.dart';
import 'package:flutter_practice/widgets/my_button.dart';

import '../../widgets/snack_bar.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? _emailError;
  String? _passwordError;
  final AuthService _authService = AuthService();
  bool isLoadin = false;
  bool isPasswordHidden = true;
  void _signUp() async{
    setState(() {
      _emailError = null;
      _passwordError = null;
    });
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();
    // if(!email.contains(".com")){
    //   showSnackBar(context, "Invalid Email. It must contain .com", color: Colors.red);
    // }
    final result = await _authService.signUp(email, password);
    if(result==null){
      //Success Case
      showSnackBar(context, "Sign Up Successful and Turned to Login", color: Colors.green);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }else{
      //Error Case
      showSnackBar(context, result);
    }


  }



  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                "Sign Up",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  errorText: _emailError,
                  labelText: "Enter Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  errorText: _passwordError,
                  labelText: "Enter Password",
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      isPasswordHidden = !isPasswordHidden;
                    });
                  }, icon: Icon(isPasswordHidden ? Icons.visibility_off:Icons.visibility)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: isPasswordHidden,
              ),
              SizedBox(height: 20,),

              isLoadin ? Center(child: CircularProgressIndicator()) :
              SizedBox(
                width: double.infinity,
                child: MyButton(
                    onTap: () {_signUp();}, buttonText: "Sign Up", color: Colors.blueAccent),
              ),
              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already Have an account?", style: TextStyle(color: Colors.grey, fontSize: 18),),
                  TextButton(onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  }, child: Text("Login", style: TextStyle(color: Colors.blueAccent,fontSize: 18, fontWeight: FontWeight.bold ),))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
