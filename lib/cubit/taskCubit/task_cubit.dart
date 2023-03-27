import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled24/cubit/taskCubit/task_state.dart';
import 'package:flutter/material.dart';
import 'package:untitled24/models/tasksModel.dart';
class TaskCubit extends Cubit<TaskState> {
  TaskCubit():super(InitState());
  static TaskCubit get(context)=> BlocProvider.of<TaskCubit>(context);
  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  TextEditingController startController=TextEditingController();
  TextEditingController endController=TextEditingController();
  List<TaskModel> tasks=[];
  TaskModel? taskModel;
  addTasks (){
    try{
    FirebaseFirestore.instance.collection('tasks').add({
      'title':titleController.text,
      'description':descriptionController.text,
      'startDate':startController.text,
      'endDate':endController.text,
    });
    emit(AddTaskSuccess());}
        catch(e){emit(AddTaskError());}
  }
  getTasks(){
    emit(GetTaskLoading());
    FirebaseFirestore.instance.collection('tasks').snapshots().listen((value) {
      tasks=[];
      value.docs.forEach((element) {
        TaskModel currentIndex=TaskModel.fromJson(element.data());
        currentIndex.id= element.id;
        tasks.add(currentIndex);
        print(element.data());
      });
      emit(GetTaskSuccess());
    }).onError((e){
      print(e);
      emit(GetTaskError());
    });

  }
  clearText (){
    titleController.clear();
    descriptionController.clear();
    startController.clear();
    endController.clear();
    emit(ClearTextSuccess());
  }
  editTask (){
    TaskModel task =TaskModel(
      title: titleController.text,
      description: descriptionController.text,
      startDate: startController.text,
      endDate: endController.text
    );
    FirebaseFirestore.instance.collection('tasks').doc(tasks[currentIndex!].id).update(task.toJson()).then((value) {
      emit(EditTaskSuccess());
    }).catchError((onError){
      print(onError);
      emit(EditTaskError());
    });
  }
  int? currentIndex;
  void changeCurrentIndex(index){
    currentIndex=index;
    emit(ChangeIndexSuccess());
  }
  void indexController (){
    titleController.text= tasks[currentIndex!].title ??"";
    descriptionController.text= tasks[currentIndex!].description ??"";
    startController.text= tasks[currentIndex!].startDate ??"";
    endController.text= tasks[currentIndex!].endDate ??"";
    emit(IndexControllerSuccess());
  }
  deleteTask (){
    FirebaseFirestore.instance.collection('tasks').doc(tasks[currentIndex!].id).delete().then((value) {
      emit(DeleteSuccess());
    });
  }
}