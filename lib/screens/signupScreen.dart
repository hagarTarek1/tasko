
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled24/screens/login.dart';
import 'package:untitled24/screens/taskScreen.dart';
import '../classes/custompainter.dart';
import '../cubit/loginCubit/loginCubit.dart';
import '../cubit/loginCubit/loginState.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(builder: (context, state) {
      var cubit = LoginCubit.get(context);
      return Scaffold(
        backgroundColor: Colors.grey[50],
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  CustomPaint(
                    painter: AppBarPainter(),
                    size: Size(500, 400),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 17),
                    child: Image.asset("assets/233.png"),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Welcome in Tasko",
                style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(52, 118, 79, 0.8)),
                ),
              SizedBox(
                height: 10,
              ),
              Form(
                key: LoginCubit.formState,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      TextFormField(
                        //onChanged: (value){
                          //cubit.emailController.text=value;
                        //},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please enter your Email";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        controller: cubit.emailController,
                        style: TextStyle(
                          color: Color.fromRGBO(52, 118, 79, 0.8),
                        ),
                        cursorColor: Color.fromRGBO(52, 118, 79, 0.8),
                        //validator: cubit.validatorEmail(cubit.emailController),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(
                              color: Color.fromRGBO(52, 118, 79, 0.8),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(52, 118, 79, 0.8))),
                            filled: true,
                            fillColor: Colors.white,
                            label: Text(
                              "Email",
                              style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(52, 118, 79, 0.8)),
                              ),
                            suffixIcon: Icon(
                              Icons.email_outlined,
                              color: Color.fromRGBO(52, 118, 79, 0.8),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(52, 118, 79, 0.8)),
                                borderRadius: BorderRadius.circular(35))),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        //onChanged: (value){
                          //cubit.passwordController.text=value;
                        //},
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please enter your password";
                            }
                            return null;
                          },
                          obscureText: cubit.isObscure,
                          controller: cubit.passwordController,
                          style:  TextStyle(
                                color: Color.fromRGBO(52, 118, 79, 0.8)),
                          cursorColor: Color.fromRGBO(52, 118, 79, 0.8),
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              errorStyle: TextStyle(
                                  color: Color.fromRGBO(52, 118, 79, 0.8)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(52, 118, 79, 0.8))),
                              filled: true,
                              fillColor: Colors.white,
                              label: Text(
                                "Password",
                                style:  TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(52, 118, 79, 0.8)),
                                ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  cubit.showPassword();
                                },
                                icon: Icon(cubit.isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                color: Color.fromRGBO(52, 118, 79, 0.8),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(52, 118, 79, 0.8)),
                                  borderRadius: BorderRadius.circular(35)))),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 100,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                              Color.fromRGBO(52, 118, 79, 0.8)),
                          onPressed: () {
                            cubit.data();
                            cubit.passwordAndEmailAuth();
                          },
                          child: Text(
                            "SignUp",
                            style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      "Already have an account",
                      style:  TextStyle(
                              color: Color.fromRGBO(52, 118, 79, 0.8))),

                    TextButton(
                        onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));},
                        child: Text("Login",
                            style:TextStyle(
                                  color: Colors.orange[900],
                                )))
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }, listener: (context, state) {
      if (state is PasswordAndEmailAuthSuccess) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => TaskScreen()));
      } else if (state is PasswordAndEmailAuthError){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please try again")));
      }
    });
  }
}