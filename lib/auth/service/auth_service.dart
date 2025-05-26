import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService{
  final supabase = Supabase.instance.client;

  //Sign up function
  Future<String?> signUp(String email, String password) async{
    try{
      final response = await supabase.auth.signUp(
          email:email,
          password: password
      );
      if(response.user!=null){
        return null; // It's Indicate Success
      }
      return "An Unknown Error";

    }on AuthException catch(e){
      return e.message;
    }
    catch(e){
      return "Error: $e";
    }
  }

  //Login Function

  Future<String?> logIn(String email, String password) async{
    try{
      final response = await supabase.auth.signInWithPassword(
          email:email,
          password: password
      );
      if(response.user!=null){
        return null; // It's Indicate Success
      }
      return "Invalid Email or Password";

    }on AuthException catch(e){
      return e.message;
    }
    catch(e){
      return "Error: $e";
    }
  }

}