import 'package:cloud_firestore/cloud_firestore.dart';

class Message{
  final String text;
  final DateTime date;
  final String? email;

  DocumentReference? reference;

  Message({
    required this.date,
    required this.text,
    this.email,
    this.reference

  });
  //TODO: Add JSON converters

  //this transform json into message 
  factory Message.fromJson(Map<dynamic,dynamic> json) => Message(
    text: json['text'] as String, 
    date: DateTime.parse(json['date'] as String),
    email: json['email'] as String?
    );
//this transform message to json for saving
    Map<String,dynamic> toJson() => <String,dynamic>{
      'date' : date.toString(),
      'text' : text,
      'email' : email,
    };

    //TODO: Add from sanapshot
//this take firestore snapshot and convert into message
    factory Message.fromSnapshot(DocumentSnapshot snapshot){
      final message = Message.fromJson(snapshot.data() as Map<String,dynamic>);
      message.reference = snapshot.reference;
      return message;
    }

}