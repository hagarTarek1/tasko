import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled24/screens/taskScreen.dart';

import '../classes/custompainter.dart';
import '../cubit/taskCubit/task_cubit.dart';
import '../cubit/taskCubit/task_state.dart';
class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit,TaskState>(builder: (context,state){
      var cubit=TaskCubit.get(context);
      //cubit.clearText();
      return Scaffold(backgroundColor: Colors.grey[50],
          body: Center(
            child: Hero(tag: 'GFG Tag', child: SingleChildScrollView(
                child: Column(children: [
                  Stack(children: [
                    CustomPaint(
                      painter: AppBarPainter(),
                      size: Size(400, 250),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 80,left: 190),
                      child: Text("Save your time\nAdd your tasks", style: GoogleFonts
                          .acme(textStyle:
                      TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: Colors.white,))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40,left: 10),
                      child: Image.asset("assets/h.png",fit: BoxFit.cover,width: 160.w,),
                    ),
                  ],),
                  SizedBox(height: 15.h,),
                  Column(children: [
                    Container( margin: EdgeInsets.only(right: 15,left: 15,bottom: 5),
                      decoration: BoxDecoration(color: Colors.orange[900],borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),bottomRight: Radius.circular(20.r))),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Tittle :",style: GoogleFonts
                                .acme(textStyle:
                            TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                              color: Colors.white,))),
                            SizedBox(height: 5.h,),
                            TextFormField( style: TextStyle(color: Colors.orange[900]),
                                controller: cubit.titleController,
                                decoration: InputDecoration(
                                errorStyle: TextStyle(color: Colors.orange[900]),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepOrange)),
                                fillColor: Colors.white,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepOrange),
                                    borderRadius: BorderRadius.circular(35.r)),
                                hintText: "Tittle",
                                hintStyle: GoogleFonts
                                    .acme(textStyle:
                                TextStyle(
                                  fontSize: 20.sp,
                                  color: Colors.orange[900],)))),
                          ],),
                      ),),
                    Container( margin: EdgeInsets.only(top: 10,right: 15,left: 15,bottom: 5),
                      decoration: BoxDecoration(color: Color.fromRGBO(52, 118, 79, 0.8),borderRadius: BorderRadius.only(topRight: Radius.circular(20.r),bottomLeft: Radius.circular(20.r))),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Description :",style: GoogleFonts
                                .acme(textStyle:
                            TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                              color: Colors.white,))),
                            SizedBox(height: 5.h,),
                            TextFormField( style: TextStyle(color: Color.fromRGBO(52, 118, 79, 0.8)),
                                controller: cubit.descriptionController,
                                decoration: InputDecoration(
                                errorStyle: TextStyle(color: Colors.orange[900]),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(52, 118, 79, 0.8))),
                                fillColor: Colors.white,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(52, 118, 79, 0.8)),
                                    borderRadius: BorderRadius.circular(35.r)),
                                hintText: "Description",
                                hintStyle: GoogleFonts
                                    .acme(textStyle:
                                TextStyle(
                                  fontSize: 20.sp,
                                  color: Color.fromRGBO(52, 118, 79, 0.8),)))),
                          ],),
                      ),),
                    Container( margin: EdgeInsets.only(top:10,right: 15,left: 15,bottom: 5),
                      decoration: BoxDecoration(color: Colors.orange[900],borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),bottomRight: Radius.circular(20.r))),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Start Date :",style: GoogleFonts
                                .acme(textStyle:
                            TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                              color: Colors.white,))),
                            SizedBox(height: 5.h,),
                            TextFormField( style: TextStyle(color: Colors.orange[900]),
                                controller:cubit.startController,
                                keyboardType: TextInputType.none,
                                onTap: (){showDatePicker(builder: (context, child) {
                                  return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: ColorScheme.light(
                                          primary: Color.fromRGBO(52, 118, 79, 0.8), // header background color
                                          onPrimary: Colors.white, // header text color
                                          onSurface: Colors.orange.shade900, // body text color
                                        ),), child: child! );},
                                  context: context, initialDate: DateTime.now(), firstDate:DateTime(2023) , lastDate: DateTime(2024),

                                ).then((value) {print(value.toString());
                                return cubit.startController.text=value.toString() ?? "";});},

                                decoration: InputDecoration(
                                    errorStyle: TextStyle(color: Colors.orange[900]),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.deepOrange)),
                                    fillColor: Colors.white,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.deepOrange),
                                        borderRadius: BorderRadius.circular(35.r)),
                                    hintText: "StartDate",
                                    hintStyle: GoogleFonts
                                        .acme(textStyle:
                                    TextStyle(
                                      fontSize: 20.sp,
                                      color: Colors.orange[900],)))),
                          ],),
                      ),),
                    Container( margin: EdgeInsets.only(top: 10,right: 15,left: 15),
                      decoration: BoxDecoration(color: Color.fromRGBO(52, 118, 79, 0.8),borderRadius: BorderRadius.only(topRight: Radius.circular(20.r),bottomLeft: Radius.circular(20.r))),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("End Date:",style: GoogleFonts
                                .acme(textStyle:
                            TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                              color: Colors.white,))),
                            SizedBox(height: 5.h,),
                            TextFormField( style: TextStyle(color: Color.fromRGBO(52, 118, 79, 0.8)),
                                controller: cubit.endController,
                                keyboardType: TextInputType.none,
                                onTap: (){showDatePicker(builder: (context, child) {
                                  return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: ColorScheme.light(
                                          primary: Color.fromRGBO(52, 118, 79, 0.8), // header background color
                                          onPrimary: Colors.white, // header text color
                                          onSurface: Colors.orange.shade900, // body text color
                                        ),), child: child! );},
                                  context: context, initialDate: DateTime.now(), firstDate:DateTime(2023) , lastDate: DateTime(2024),

                                ).then((value){print(value.toString());
                                return cubit.endController.text=value.toString() ?? "";});},
                                decoration: InputDecoration(
                                    errorStyle: TextStyle(color: Colors.orange[900]),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(52, 118, 79, 0.8))),
                                    fillColor: Colors.white,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(52, 118, 79, 0.8)),
                                        borderRadius: BorderRadius.circular(35.r)),
                                    hintText: "EndDate",
                                    hintStyle: GoogleFonts
                                        .acme(textStyle:
                                    TextStyle(
                                      fontSize: 20.sp,
                                      color: Color.fromRGBO(52, 118, 79, 0.8),)))),
                          ],),
                      ),),
                    SizedBox(height: 10.h,),
                    ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.orange[900] ),
                        onPressed: (){ cubit.addTasks();
                      cubit.getTasks();
                      cubit.clearText();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>  TaskScreen()));}, child: Text("save",style: GoogleFonts
                            .acme(textStyle:
                        TextStyle(
                          fontSize: 25.sp,))))
                  ],),
                ],)
            ),),));
    }, listener: (context,state){});
  }
}