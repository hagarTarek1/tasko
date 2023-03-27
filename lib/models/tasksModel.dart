import 'dart:convert';

class TaskModel {
  String? id;
  String? title;
  String? description;
  String? startDate;
  String? endDate;

  TaskModel({this.description,this.title,this.endDate,this.startDate,this.id});
  TaskModel.fromJson(Map<String,dynamic>json){
    id=json['id'];
    title=json['title'];
    description=json['description'];
    startDate=json['startDate'];
    endDate=json['endDate'];
  }
  Map<String,dynamic> toJson(){
    return {
      'title': title,
      'description': description,
      'startDate':startDate,
      'endDate': endDate,
    };
  }
}