import 'package:application_1/live_tracking.dart';
import 'package:application_1/Machanics.dart';
import 'package:application_1/main.dart';
import 'package:flutter/material.dart';

import 'Auth_Controller.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Services"),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [

            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return  const Mechanicsbase();
              }));
            }, child: const Text("Mechanics")),

            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                return const PolylineScreen();
              }));
            }, child: const Text("Track Mechanic")),

            ElevatedButton(onPressed: () {
              AuthController.instance.logout();
            }, child: const Text("Sign Out")),
          ],
        ),
      ),
    );
  }
}