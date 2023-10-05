
//import 'dart:html';

import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key,}); 
  final TimeOfDay now=TimeOfDay.now();

  @override
  State<MainPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FloatingActionButton(
              onPressed: (() => {Navigator.pop(context)}),
              child: Column(
                children: const [
                  Icon(
                    Icons.exit_to_app,
                    semanticLabel: "sign out",
                  ),
                  Text("sign out")
                ],
              )),
        ],
        title: const Text("Welcome"),
      ),
      drawer: Drawer(
          // ignore: prefer_const_constructors
          child: ListView(
        children:  [
        
          const Icon(
            Icons.account_box_rounded,
            size: 100,
            semanticLabel: "Account Details",
          ),
          
          const Center(child: Text("Account Details")), 
          
           ElevatedButton(
              onPressed: (() {
                final TimeOfDay now=TimeOfDay.now();
                showTimePicker(context: context, initialTime: now ,initialEntryMode: TimePickerEntryMode.inputOnly,confirmText: 'confirm',helpText: "Enter time",hourLabelText: "hours");
               //final time=LocalDateTimeInputElement();
              
              }
               
              ),
              child: const Card(child: Text("Book Appointment Time"),),
              
           ),
           ElevatedButton(onPressed: (() {
            
             showDatePicker(context: context, initialDate: DateTime.now(), firstDate:  DateTime.now(), lastDate: DateTime.utc(2030));
           }), child: const Text("pick Date"))
           ,const ElevatedButton(onPressed:null ,child: Text("personal medical check"),)
           
            ],
      )
          //Icon(Icons.account_box_rounded,size:100,semanticLabel: "Account Details",),
          ),
    );
    
  }
}
