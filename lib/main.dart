import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as Firebase;
import 'drag_try.dart';
import 'login.dart';

Future<void> main() async {
  if (Firebase.apps.isEmpty) {
    Firebase.initializeApp(
      apiKey: 'AIzaSyAseqVYOb2bombg-M-r0Z55B56No_BK_5w',
      authDomain: 'grievboard-d1fc0.firebaseapp.com',
      databaseURL: 'https://grievboard-d1fc0.firebaseio.com',
      projectId: 'grievboard-d1fc0',
      storageBucket: 'grievboard-d1fc0.appspot.com',
      messagingSenderId: '99869646234',
      appId: '1:99869646234:web:2f481794a4a2bd49cd2e23',
    );
  }
  runApp(
    MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DragTry(),
    ),
  );
}
