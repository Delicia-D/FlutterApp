import 'package:flutter/material.dart';
import 'package:flutter_application_1/mainpage.dart';
import 'package:transparent_image/transparent_image.dart';

class Login extends StatelessWidget {
  
   Login({super.key});
   final  nameController=TextEditingController();
   
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Appointment',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.purple,
        ),
        home: Scaffold(
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Card(child: FadeInImage.memoryNetwork(  placeholder: kTransparentImage,
    image: 'https://picsum.photos/250?image=9' ))
            ,
            const Center(
              child: Card(
                shadowColor: Colors.cyan,
                child: Text(
                  "Welcome",
                  style: TextStyle(
                      fontSize: 50, color: Color.fromARGB(255, 181, 63, 163)),
                ),
              ),
            ),
            Center(
                child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.grey),
              width: 300,
              height: 50,
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    hintText: "     Enter username",
                    hoverColor: Colors.black,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)))),
              ),
            )),
            Center(
                child: Container(
              width: 350,
              height: 50,
              decoration: const BoxDecoration(
                  color: Colors.purpleAccent,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: const TextField(
                  obscureText: true,
                  decoration:
                      InputDecoration(hintText: "      Enter password")),
            )),
            TextButton(
                onPressed:()=>{ Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage(),))} ,
                child: const SizedBox(
                  width: 100,
                  height: 100,
                  child: Text(
                    "Login",
                    style: TextStyle(
                        backgroundColor: Color.fromARGB(255, 142, 120, 139)),
                  ),
                )),
               
          ]
            
              ),
        ));
  }
}
