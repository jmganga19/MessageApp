import 'package:cloud_firestore/cloud_firestore.dart';
import 'message.dart';

class MessageDao{
  final CollectionReference collection =FirebaseFirestore.instance.collection('messages');
  //TODO: Add saveMessage

  void SaveMessage(Message message){
    collection.add(message.toJson());
  }
  //TODO: Add getMessageStream
  //this is method that retrieve data
  Stream<QuerySnapshot> getMessageStream(){
    return collection.snapshots();
  }
}