import 'package:app_market_online/data/models/_models.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on firebaseUser
  UserModel? _userFromFirebaseUser(User? user){
    return user != null ? UserModel(uid: user.uid) : null;
  }

  // auth change user stream
 Stream<UserModel?>? get user {
    return _auth
        .authStateChanges()
        .map(_userFromFirebaseUser);
  }

  // sign in annonyme
  Future signInAnnonyme() async{
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
      
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in whith email and password
  Future signWithEmailAndPassword(String email, String password) async{
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  // register with whith email and password
  Future registerWithEmailAndPassword(String email, String password) async{
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async{
    try {
        return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}