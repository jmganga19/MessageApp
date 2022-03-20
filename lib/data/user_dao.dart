import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';


class UserDao extends ChangeNotifier{
  final auth = FirebaseAuth.instance;
  //TODO: Add helper methods
  bool isLoggenIn(){
    //return true if user are logged in,null if loggedout
    return auth.currentUser != null;
  }
  String? userId(){
    return auth.currentUser?.uid;
  }
  String? email(){
    return auth.currentUser?.email;
  }
  //TODO: Add signup
  void signup(String email,String password) async {
    try{
      await auth.createUserWithEmailAndPassword(
        email: email, 
        password: password,
        );
        notifyListeners();
    } on FirebaseAuthException catch(e){
      if(e.code == 'weak-password'){
        print('The password provided is too weak.');

      }else if(e.code == 'email-already-in-use'){
        print('The account already exists for that email.');
      }
    } catch (e){
      print(e);
    }
  } //TODO: Add login
  void login(String email,String password) async {
    try{
      await auth.signInWithEmailAndPassword(
        email: email,
         password: password,
         );
         notifyListeners();
    }on FirebaseAuthException catch(e){
      if(e.code == 'weak-password'){
        print('The password provided is too weak.');

      }else if(e.code == 'email-already-in-use'){
        print('The account already exists for that email.');
      }
    } catch (e){
      print(e);
    }
  }
  //TODO: Add logout
  void logout() async{
    await auth.signOut();
    notifyListeners();
  }
}

