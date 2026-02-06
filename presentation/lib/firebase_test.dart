import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirebaseTest extends StatelessWidget {
  const FirebaseTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Firebase Test')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await FirebaseFirestore.instance.collection('test').add({
              'message': 'Hello Firebase!',
              'timestamp': FieldValue.serverTimestamp(),
            });

            print('Data written successfully!');
          },
          child: Text('Test Firebase'),
        ),
      ),
    );
  }
}