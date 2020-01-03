import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class UserModel  extends Model {

  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;
  
  FirebaseUser firebaseUser;
  Map<String, dynamic> userData = Map();

  static UserModel of(BuildContext context) =>
  ScopedModel.of<UserModel>(context);

  @override
  void addListener(listener) {
    super.addListener(listener);

    _loadCurrentUser();
  }

  void signUp({@required Map<String, dynamic> userData, @required String password, @required VoidCallback onSuccess, @required VoidCallback onFail}) {
    isLoading = true;
    notifyListeners();

    _auth.createUserWithEmailAndPassword(
      email: userData["email"],
      password: password
    ).then((result) async {
      try {
        print("user: ");
        print(result.user);

        firebaseUser = result.user;
        print("objeto convertido: ");
        print(firebaseUser);

        await _saveUserData(userData);
        print("salvou o user");

        onSuccess();
        print("executou o success");

      } catch (e) {
        print("Ocorreu exceção: ");
        print(e.toString());
      }

      isLoading = false;
      notifyListeners();      
      print("notificou os observers");
    }).catchError((error) {
      print("vai executar o onFail");
      onFail();      
      print("executou o onFail");

      isLoading = false;
      notifyListeners();
      print("notificou os observers");
    });

  }

  void singIn({@required String email, @required String password, @required VoidCallback onSuccess, @required VoidCallback onFail}) async {
    isLoading = true;
    
    _auth.signInWithEmailAndPassword(email: email, password: password)
    .then((result) async {
      firebaseUser = result.user;

      await _loadCurrentUser();
      
      onSuccess();
      isLoading = false;
      notifyListeners();

    }).catchError((error){
      onFail();
      isLoading = false;
      notifyListeners();      
    });
    
  }

  void signOut() async {
    await _auth.signOut();
    userData = Map();
    firebaseUser = null;
    notifyListeners();
  }

  void recoverPass(String email) {
    _auth.sendPasswordResetEmail(email: email);
  }

  bool isLoggedIn() {
    return firebaseUser != null;
  }

  Future<Null> _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
    await Firestore.instance.collection("users").document(firebaseUser.uid).setData(userData);
  }

  Future<Null> _loadCurrentUser() async {
    if (firebaseUser == null) {
      firebaseUser = await _auth.currentUser();
    }

    if (firebaseUser != null) {
      if (userData["name"] == null) {
        DocumentSnapshot docUser = await Firestore.instance.collection("users").document(firebaseUser.uid).get();
        userData = docUser.data;
      }
    }

    notifyListeners();
  }

}