import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task1/global/global.dart';

import '../widgets/snackBarWidget.dart';
class VerifyPage extends StatefulWidget {
  @override
  _VerifyPageState createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
    User? user;
     User? firebaseUser;
  var timer;
  @override

  void initState() {
    sendEmailVerify();
  //  print("firebaseUser.isEmailVerified ? ${firebaseUser.isEmailVerified}");


super.initState();
  }

  @override
void dispose(){
    timer.cancel();
    super.dispose();
  }

  void sendEmailVerify()async{
user =( fAuth.currentUser)!;
try{

    await user!.sendEmailVerification().whenComplete(() => print("123"));

} catch(e){

  print("e");
  print(e);
}

SnackBarWidget(msg:
"email verification link has sent to your email"

);
timer=Timer.periodic(Duration(seconds:5), (timer){
  print("okkkkkkkkkkkkkk");
  check();


});

// FirebaseAuth.instance.currentUser!().then((value){
//
//   setState(() {
//     firebaseUser=value;
//   });
// });



  }

  Future check()async{
    user=await fAuth.currentUser!;
    print("user");
    print(user);
    await user!.reload();
    if(user!.emailVerified)
      {
        setState(() {
           firebaseUser=user;
        });
        timer.cancel();
    Navigator.pop(context, user!.emailVerified)  ;

        Navigator.pop(context);
      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body:   Container(
    color: Colors.pink,
    child: Center(

    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
             child: Row(
               children: <Widget>[
                 Expanded(child:
firebaseUser!=null?
      firebaseUser!.emailVerified ?Text( "Email verified successfully " ,style:TextStyle(color: Colors.white,
               ))
                   :Text("Email not verified please check your inbox mail"
                               ,style:TextStyle(color: Colors.white,
                   )
               ):Text("")

                 )
               ],
             ),
            ),
//             RaisedButton.icon(onPressed:() {
//               // final _scaffoldKey2=GlobalKey<ScaffoldState>();
//               // _scaffoldKey2.currentState.showSnackBar(new SnackBar(content: new Text('Hey Muhammed !')));
//               Timer
//                 (Duration(seconds: 3),
//                       () {
//                     Navigator.pop(context, firebaseUser.isEmailVerified);
//                     //print("must pop");
//
//                   });
// //Navigator.pop(context);
//
//             }


            // , icon:Icon( Icons.arrow_back), label: Text("exit"))
          ],

    ),
    ),
  )  );

  }
}
