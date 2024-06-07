import 'dart:convert';

class TarefaModel {
  final String id;
  final String title;
  final bool isCompleted;

  TarefaModel({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });

  factory TarefaModel.fromJson(Map<String, dynamic> Json){
    return TarefaModel(
      id: json['id'],
      title: json['title'],
      isCompleted: json['isCompleted'], 
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'id' : id,
      'title' : title,
      'isCompleted' : isCompleted,
    };
  }


}