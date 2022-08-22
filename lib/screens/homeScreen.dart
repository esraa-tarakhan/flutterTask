

import 'package:flutter/material.dart';

import '../models/medicine.dart';
import '../services/api_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int now =1;
  String greeting="";
  @override
  void initState() {

    now = DateTime.now().hour;
    greetingUser(now);
    super.initState();

  }
  greetingUser( int now){
print("ok");
print(now);
print(greeting);
    if( now>=1&&now<12){
      print(greeting);
      setState(() {
        print("11");

        greeting=" good night";


      });
    }

    else if(now>=12&&now<15){
      setState(() {
        print("33");

        greeting="good after noon";

      });
    } else if(now>=15&&now<19){
      setState(() {
        print("22");
        greeting=" good evening";

      });
    }else if(now>=19&&now<23){
      setState(() {
        print("44");

        greeting=" good night";

      });
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
        body: Center(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/2,),
              Text(now.toString(),
                style: TextStyle(color: Colors.white,fontSize: 22),),
              Text(greeting,
                style: TextStyle(color: Colors.white,fontSize: 22),),
              Text("ok",
                style: TextStyle(color: Colors.white,fontSize: 22),),
              // Text(newsModel!.name!,
              //   style: TextStyle(color: Colors.white,fontSize: 22),),

              Expanded(
                child: FutureBuilder<NewsModel>(
                    future: APIHandler.getData(),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        Center(
                          child:
                          Text("An error occured ${snapshot.error}"),
                        );
                      } else if (snapshot.data == null) {
                        const Center(
                          child: Text("No products has been added yet"),
                        );
                      }
                      return  Text(snapshot.data!.name,
                        style: TextStyle(color: Colors.white,fontSize: 22),);
                    })),
              )

            ],
          ),
        ));
  }

}
