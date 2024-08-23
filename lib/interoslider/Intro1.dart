
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pratice/LoginScreen.dart';
import 'package:pratice/interoslider/Intro2.dart';
import 'package:pratice/model/UserSharedPreferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Intro1 extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    Usersharedpreferences.init();
    return Scaffold(

      body: Column(


        children: [


          Container(
            child: Icon(Icons.accessibility, size: 200),




          ),
          Text("A Flower Shop with Verieties of Flowers"),



          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Intro2()));

              }, child: Text("Next")),
              ElevatedButton(onPressed: (){
               bool? status= Usersharedpreferences.getFirstTime() ?? false;
               if(status==false)
                 {
                   Usersharedpreferences.setFirstTime(true);
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginscreen()));

                 }

              }, child: Text("Skip" ),


              )

            ],
          )
        ],
      ),
    );
  }
}