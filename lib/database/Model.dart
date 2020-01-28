import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Model {
  FirebaseDatabase _database;
  FirebaseStorage _storage;
  FirebaseAuth _auth;
  FirebaseUser _user;
  Model(){
    _database=FirebaseDatabase.instance;
    _storage=FirebaseStorage.instance;
    _auth=FirebaseAuth.instance;
  }
  Future<bool> registerNewUser(String email,String pass,String mob) async
  {
   AuthResult result= await _auth.createUserWithEmailAndPassword(email:email, password:pass,);
   _user=result.user;
     await _auth.verifyPhoneNumber(phoneNumber: mob,
         timeout: Duration(seconds: 30),
         verificationCompleted: (cre){
           _auth.signInWithCredential(cre);
           return true;
           },
         verificationFailed: (exce){
         },
         codeSent:(str,[i]){
         print(str);
         return false;
         },
         codeAutoRetrievalTimeout:(str){
       print("Time out "+str);
         });
     return false;
  }
  Future<bool> LogIn(String email,String pass) async
  {
    var re=await _auth.signInWithEmailAndPassword(email: email, password: pass);
    _user=re.user;
    if(_user!=null){
      if(!_user.isEmailVerified) {
        _user.sendEmailVerification();
       if(await Future<bool>.delayed(Duration(seconds:1),(){
         if(_user.isEmailVerified)
            return true;
       return false;
       }))
        return true;
      }
      else
        {
          print("sign in successfully");
          return true;
        }
    }
  return false;
  }
  Logout()
  {
    _auth.signOut();
    print("sign out");
  }
}