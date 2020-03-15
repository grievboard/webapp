import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fireBase;

class GetData extends StatefulWidget {
  @override
  _GetDataState createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  @override

  var _fireStore = fireBase.firestore();
  final List notAcknowledged = [];

  Future throwData() async {
    var data1 = await _fireStore
        .collection('notAck')
        .get();
    for (var i = 0; i < data1.size; i++) {
      var location = data1.docs[i].get('location');
      var description = data1.docs[i].get('description');
      var username = data1.docs[i].get('username');
      var documentID = data1.docs[i].id;
      var title = data1.docs[i].get('title');
      notAcknowledged.add(User(location, description, username, title, documentID));
    }
    setState(() {});
    return notAcknowledged;
  }

  Widget build(BuildContext context) {
    return Container();
  }
}

class User{
  final String location;
  final String description;
  final String username;
//  final String postId;
  final String title;
  final String documentId;
//  final String ownerId;
//  final String mediaUrl;
//  final String status;
// final String gpocName;
//  final String gpoccontact;
//  final bool isPrivate;
//  final List<String> consequences;
//  final DateTime timestamp;
//  final Map<String,bool> likes;
  User(this.location, this.description, this.username, this.title, this.documentId);
}
