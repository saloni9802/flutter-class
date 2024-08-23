import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pratice/UserHome.dart';
import 'package:pratice/model/UserSharedPreferences.dart';

class userSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Signup(),
    );
  }
}

class Signup extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<Signup> {

  TextEditingController name_controller=TextEditingController();
  TextEditingController email_controller=TextEditingController();
  TextEditingController phone_controller=TextEditingController();
  TextEditingController password_controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    Usersharedpreferences.init();
    bool? status= Usersharedpreferences.getFirstTime() ?? false;
    print(status);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("SignUp"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 110.0),
              child: Center(
                child: Container(
                  width: 200,
                  height: 100,
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4AgM3fmStK1-lxV48twfFrZH7kHbY1LWWlA&s",
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: name_controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  hintText: 'Enter Valid Name',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: email_controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter valid email id as abc@gmail.com',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(

                controller: phone_controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                  hintText: 'Enter Valid Phone Number',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                obscureText: true,
                controller: password_controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter secure password',
                ),
              ),
            ),
            SizedBox(
              height: 65,
              width: 360,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    child: Text(
                      'Register Now',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    onPressed: () async {
                    String userName=name_controller.text;
                    String email=email_controller.text;
                    String phone=phone_controller.text;
                    String password=password_controller.text;

                    print(userName+"|"+email+"|"+phone+"|"+password);
                   //Server Connection
                     http.Response response= await http.post(Uri.parse("http://192.168.95.212:3000/signup"),
                      body: {
                        "name":userName,
                        "email":email,
                        "phone":phone,
                        "password":password
                      }
                      );
                    if(response.statusCode==200)
                      {
                        print(response.body);
                      }
                    else
                      {
                        print("Server Internal Error");
                      }


                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Center(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 62),
                      child: Text('Forgot your login details? '),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 1.0),
                      child: InkWell(
                        child: Text(
                          'Get help logging in.',
                          style: TextStyle(fontSize: 14, color: Colors.blue),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
