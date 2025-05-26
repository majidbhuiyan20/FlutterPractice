import 'package:flutter/material.dart';
import 'package:flutter_practice/auth/screen/signup_screen.dart';
import 'package:flutter_practice/view/home_screen.dart';
import 'package:flutter_practice/widgets/my_button.dart';
import 'package:flutter_practice/widgets/snack_bar.dart';
import 'package:flutter_practice/auth/service/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? _emailError;
  String? _passwordError;
  final AuthService _authService = AuthService();
  bool isLoadin = false;
  bool isPasswordHidden = true;
  void _logIn() async{
    setState(() {
      _emailError = null;
      _passwordError = null;
    });
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();
    // if(!email.contains(".com")){
    //   showSnackBar(context, "Invalid Email. It must contain .com", color: Colors.red);
    // }
    if(!mounted)return;
    setState(() {
      isLoadin = true;
    });
    final result = await _authService.logIn(email, password);
    if(result==null){
      //Success Case
      setState(() {
        isLoadin = false;
      });
      showSnackBar(context, "Sign Up Successful and Turned to Login", color: Colors.green);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
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
                "LogIn",
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
                  labelText: "Enter Password",
                  suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.visibility)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: MyButton(
                    onTap: () {
                      _logIn();
                    }, buttonText: "Login", color: Colors.blueAccent),
              ),
              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't Have an account?", style: TextStyle(color: Colors.grey, fontSize: 18),),
                  TextButton(onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                  }, child: Text("Sign Up", style: TextStyle(color: Colors.blueAccent,fontSize: 18, fontWeight: FontWeight.bold ),))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
