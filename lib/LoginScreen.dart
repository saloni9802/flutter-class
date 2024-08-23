import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pratice/UserHome.dart';
import 'package:pratice/model/UserSharedPreferences.dart';
import 'package:pratice/userSignUp.dart';

class Loginscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {

  TextEditingController user_controller=TextEditingController();
  TextEditingController pass_controller=TextEditingController();


  @override
  Widget build(BuildContext context) {
    Usersharedpreferences.init();
    bool? status= Usersharedpreferences.getFirstTime() ?? false;
print(status);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login"),
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
                controller: user_controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone number, email or username',
                  hintText: 'Enter valid email id as abc@gmail.com',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                obscureText: true,
                controller: pass_controller,
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
                      'Log in',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    onPressed: () {

                      String username=user_controller.text;
                      String password=pass_controller.text;
                      if(username=="Raghu" && password=="321")
                        {
                        Usersharedpreferences.setLogin(true);
                        Usersharedpreferences.setUserName(username);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UserHome()),
                          );
                        }
                      else
                        {
                          print("Invalid User Credentials !");
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
                        onTap: ()
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>userSignUp()));
                        },
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
