import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task1/screens/verifyPage.dart';
import '../global/global.dart';
import '../global/helperfunctions.dart';
import '../global/helperfunctions.dart';
import '../screens/homeScreen.dart';
import '../widgets/progress_dialog.dart';
import '../widgets/snackBarWidget.dart';
class AuthMethods{



  loginrNow(String email, String password,BuildContext context) async
  {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c)
        {
          return ProgressDialog(message: "Processing, Please wait...",);
        }
    );

    final User? firebaseUser = (
        await fAuth.signInWithEmailAndPassword(
          email: email.trim(),
          password: password.trim(),
        ).catchError((msg){
          Navigator.pop(context);
          SnackBarWidget(msg: "Error: " + msg.toString());
        })
    ).user;

    if(firebaseUser != null)
    {



      SnackBarWidget(msg: "login successfully");
      HelperFunctions.saveUserEmailSharedPreference(email);
      Navigator.push(context, MaterialPageRoute(builder: (c)=> HomeScreen()));


    }
    else
    {
      Navigator.pop(context);
      SnackBarWidget(msg: "Error Occurred during Login.");
    }
  }

  signUpNow(String email, String password,BuildContext context) async
  {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c)
        {
          return ProgressDialog(message: "Processing, Please wait...",);
        }
    );

    final User? firebaseUser = (
        await fAuth.createUserWithEmailAndPassword(
          email:email.trim(),
          password:password.trim(),
        ).catchError((msg){
          HelperFunctions.saveUserEmailSharedPreference(email);
          Navigator.pop(context);
          SnackBarWidget(msg: "Error: " + msg.toString());
        })
    ).user;

    if(firebaseUser != null)
    {

      SnackBarWidget(msg: "Account has been Created.");

    final isVerfied= (Navigator.push(context, MaterialPageRoute(builder: (c)=> VerifyPage())) )as bool;
      isVerfied ?Navigator.push(context, MaterialPageRoute(builder: (c)=> HomeScreen())):"";
    }
    else
    {
      SnackBarWidget(msg: "Account has not been Created.");
    }
  }




Future signOut () async{
  try{
    return await fAuth.signOut();

  } catch(e){

    print(e);
  }


}



}