import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Mechanicsbase extends StatefulWidget {
  const Mechanicsbase({Key? key}) : super(key: key);

  @override
  State<Mechanicsbase> createState() => _MechanicsbaseState();
}

class _MechanicsbaseState extends State<Mechanicsbase> {
 final CollectionReference _Mechanics = FirebaseFirestore.instance.collection('Mechanics');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Mechanics around"),
          centerTitle: true,
      ),
      body: Scrollbar(
        child: StreamBuilder(
          stream: _Mechanics.snapshots(),
          builder: (context,AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if(streamSnapshot.hasData) {
              return ListView.builder(
                 itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder:(context, index) {
                   final DocumentSnapshot documentSnapshot =
                       streamSnapshot.data!.docs[index];
                   return Card(
                     margin: const EdgeInsets.all(10),
                     child: ListTile(
                      title: Text(documentSnapshot['Name ']),
                      subtitle: Text(documentSnapshot['Phone No'].toString()),
                     ),
                   );
                  }
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
