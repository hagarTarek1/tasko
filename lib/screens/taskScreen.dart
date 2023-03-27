import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled24/components/taskview.dart';
import 'package:untitled24/screens/editTask.dart';
import '../classes/custompainter.dart';
import '../cubit/loginCubit/loginCubit.dart';
import '../cubit/taskCubit/task_cubit.dart';
import '../cubit/taskCubit/task_state.dart';
import 'addtask.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(value: TaskCubit.get(context)..getTasks(),
      child:
      BlocConsumer<TaskCubit,TaskState>(builder: (context,state){
      var cubit= TaskCubit.get(context);
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          splashColor: Colors.orange[900],
          focusElevation: 10,
          heroTag: 'GFG Tag',
          backgroundColor: Color.fromRGBO(52, 118, 79, 0.8),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> AddTask()));
          },child: Icon(Icons.add,size: 30,),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),),
        backgroundColor: Colors.grey[50],
        body: SingleChildScrollView( scrollDirection: Axis.vertical,
          child: Column(children: [
            Stack(children:[
              CustomPaint(
                painter: AppBarPainter(),
                size: Size(400, 150),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 30,top: 50),
                child: Row(children: [
                  Stack(
                    children:[ CircleAvatar( radius: 30.r,backgroundColor: Colors.white,
                    ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5,top: 5),
                        child: CircleAvatar(radius: 25.r,backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0bPNa0OZDxkqEdBYTzW2Wchj8mY_S3bDzWPKgQHFoCJxJQhIpu1eJPZ55gvVTur7ZHOI&usqp=CAU")),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top:32,left: 30),
                          child: IconButton(onPressed: (){

                          },icon: CircleAvatar(
                            backgroundColor: Colors.orange[900],
                            child: Icon(Icons.edit),),))
                    ],
                  ),
                  SizedBox(width: 10.w,),
                  Text("Hello,\n${LoginCubit.get(context).firstLetter}", style: GoogleFonts.acme(textStyle:
                  TextStyle(fontSize: 22.sp,
                      color:Colors.white,fontWeight: FontWeight.bold),),),
                  Spacer(),
                  Text("Task List", style: GoogleFonts.acme(textStyle:
                  TextStyle(fontSize: 30.sp,
                      color:Colors.white),),),
                ],),
              )
            ],),
            (cubit.tasks ?? []).isEmpty ?
                Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Lottie.network("https://assets9.lottiefiles.com/packages/lf20_f6lrrw9s.json",fit: BoxFit.cover,
                width: 200,
              ),
            ),
            Text("add your Task", style: GoogleFonts
                .acme(textStyle:
            TextStyle(fontWeight: FontWeight.bold,
              fontSize: 50,
              color: Color.fromRGBO(52, 118, 79, 0.8),)))],)
               :
                ListView.separated(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                      itemBuilder: (context,index){
                      return
        InkWell( splashColor: Colors.white,
        onTap: (){ cubit.changeCurrentIndex(index);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>EditTask(index: index)));},
        child:TaskView(taskModel: cubit.tasks[index]));
                  }, separatorBuilder: (context,index)=> Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                    child: Divider(height:15,thickness: 5, color: Color.fromRGBO(52, 118, 79, 0.8),),
                  ), itemCount: cubit.tasks.length),
          ],),
        ),
      );
    }, listener: (context,state){}),);
  }
}
