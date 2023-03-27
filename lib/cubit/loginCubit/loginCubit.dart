

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'loginState.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit():super(InitState());
  static LoginCubit get(context)=>BlocProvider.of<LoginCubit>(context);
  static var formState=GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool remember=false;
  bool isObscure=true;
  String get firstLetter => emailController.text.substring(0,2).toUpperCase();
  validatorEmail(emailController){
    if (emailController.isEmpty){
      return "please enter your email";
    }  return null;
  }
  passwordAndEmailAuth () async {
    try {
    UserCredential user=await FirebaseAuth.instance.createUserWithEmailAndPassword(email:emailController.text , password: passwordController.text);
 emit(PasswordAndEmailAuthSuccess());}
        catch (e){
      print(e);
      emit(PasswordAndEmailAuthError());
        }
  }
  void rememberMe (){
    remember = !remember;
    print(remember);
    emit(RememberMe());
  }
  void showPassword(){
    isObscure =! isObscure;
    emit(IsObscure());
  }
  data() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      print("valid");
      emit(DataSuccess());
    }
    print("invalid");
    emit(DataError());
  }
  loginUser ()async{
    try{
      UserCredential user=await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
   emit(PasswordAndEmailSignInSuccess());
    }
    catch (e){
      emit(PasswordAndEmailSignInError());
    }
  }


}