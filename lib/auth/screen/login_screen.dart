import 'package:flutter/material.dart';
import 'package:flutter_practice/auth/screen/signup_screen.dart';
import 'package:flutter_practice/widgets/my_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                    onTap: () {}, buttonText: "Login", color: Colors.blueAccent),
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
