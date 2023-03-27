import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled24/cubit/taskCubit/task_cubit.dart';
import 'package:untitled24/cubit/taskCubit/task_state.dart';
import 'package:untitled24/models/tasksModel.dart';
class TaskView extends StatelessWidget {
  TaskModel? taskModel;
  TaskView({required this.taskModel,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit,TaskState>(builder: (context,state){
      return Container(
        decoration: BoxDecoration(color: Colors.orange[900],borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20.r),topRight: Radius.circular(20.r))),
        margin: EdgeInsets.only(left: 15,right: 15),
        padding: EdgeInsets.all(12),
        child: Column( mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(taskModel?.title ??"error",style: GoogleFonts.acme(textStyle:
            TextStyle(fontSize: 22.sp,fontWeight: FontWeight.bold,
                color:Colors.white),),),

            Text(taskModel?.description ??"error",style: GoogleFonts.acme(textStyle:
            TextStyle(fontSize: 20.sp,
                color:Colors.white),),),
            SizedBox(height: 5,),
            Row(children: [
              Container( width: 120.w,height: 20.h,
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15.r)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(taskModel?.startDate ?? "",style: GoogleFonts.acme(textStyle:
                  TextStyle(fontSize: 15.sp,
                      color:Color.fromRGBO(52, 118, 79, 0.8)),)),
                ),),
              Spacer(),
              Container( decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15.r)),
                width: 120.w,height: 20.h,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(taskModel?.endDate ?? "",style: GoogleFonts.acme(textStyle:
                  TextStyle(fontSize: 15.sp,
                      color:Color.fromRGBO(52, 118, 79, 0.8)),)),),),
            ],)
          ],),
      );
    }, listener: (context,state){});
  }
}
