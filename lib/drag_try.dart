import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fireBase;

class User {
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
  User(this.location, this.description, this.username, this.title,
      this.documentId);
}

class DragTry extends StatefulWidget {
  @override
  createState() => _DragTryState();
}

class _DragTryState extends State<DragTry> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    var data1 = await _fireStore.collection('notAck').get();
    for (var i = 0; i < data1.size; i++) {
      var location = data1.docs[i].get('location');
      var description = data1.docs[i].get('description');
      var username = data1.docs[i].get('username');
      var documentID = data1.docs[i].id;
      var title = data1.docs[i].get('title');
      notAcknowledged
          .add(User(location, description, username, title, documentID));
    }
    setState(() {});
  }

  final myController = TextEditingController();
  final myController1 = TextEditingController();
  var _fireStore = fireBase.firestore();
  final List<User> notAcknowledged = [];
  final List<User> acknowledged = [];
  final List<User> completed = [];
  var acknowledgedData1, acknowledgedData2;
  var dragStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Draggable"),
        backgroundColor: Colors.black,
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Color(0xFF030423),
            margin: EdgeInsets.fromLTRB(70.0, 110.0, 70.0, 110.0),
            height: 500.0,
            width: 292.0,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: notAcknowledged.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Draggable(
                  child: Padding(
                    child: RaisedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          child: AlertDialog(
                            title: Text('${notAcknowledged[index].username}'),
                            content: Wrap(
                              direction: Axis.vertical,
                              children: <Widget>[
                                Card(
                                  color: Color(0xFFFBFBFB),
                                  child: Padding(
                                    child: Wrap(
                                      direction: Axis.vertical,
                                      children: <Widget>[
                                        Text("Description"),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                            '${notAcknowledged[index].description}'),
                                      ],
                                    ),
                                    padding: EdgeInsets.all(5.0),
                                  ),
                                ),
                                Card(
                                  color: Color(0xFFFBFBFB),
                                  child: Padding(
                                    child: Wrap(
                                      direction: Axis.vertical,
                                      children: <Widget>[
                                        Text("Location"),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                            '${notAcknowledged[index].location}'),
                                      ],
                                    ),
                                    padding: EdgeInsets.all(5.0),
                                  ),
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              RaisedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                color: Color(0xFF030423),
                                textColor: Colors.white,
                                child: Text('Close'),
                              )
                            ],
                          ),
                          barrierDismissible: false,
                        );
                      },
                      color: Colors.white,
                      child: ListTile(
                          title: Text('${notAcknowledged[index].username}'),
                          leading: Icon(
                            Icons.fiber_manual_record,
                            size: 25.0,
                            color: Colors.red,
                          )),
                    ),
                    padding: EdgeInsets.all(20.0),
                  ),
                  feedback: Material(
                    elevation: 5.0,
                    child: Container(
                      width: 284.0,
                      padding: const EdgeInsets.all(16.0),
                      color: Colors.yellow,
                      child: Text(notAcknowledged[index].username),
                    ),
                  ),
                  childWhenDragging: Container(),
                  onDragStarted: () {
                    acknowledgedData1 = notAcknowledged[index];
                    dragStatus = 'notAcknowledged';
                  },
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(70.0, 110.0, 70.0, 110.0),
            color: Color(0xFF030423),
            width: 292.0,
            height: 500.0,
            child: DragTarget(
              builder: (context, candidateData, rejectedData) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: acknowledged.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Draggable(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: RaisedButton(
                          color: Colors.orange,
                          onPressed: () {
                            showDialog(
                              context: context,
                              child: AlertDialog(
                                title: Text('${acknowledged[index].username}'),
                                content: Wrap(
                                  direction: Axis.vertical,
                                  children: <Widget>[
                                    Card(
                                      color: Color(0xFFFBFBFB),
                                      child: Padding(
                                        child: Wrap(
                                          direction: Axis.vertical,
                                          children: <Widget>[
                                            Text("Description"),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                                '${acknowledged[index].description}'),
                                          ],
                                        ),
                                        padding: EdgeInsets.all(5.0),
                                      ),
                                    ),
                                    Card(
                                      color: Color(0xFFFBFBFB),
                                      child: Padding(
                                        child: Wrap(
                                          direction: Axis.vertical,
                                          children: <Widget>[
                                            Text("Location"),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            Text(
                                                '${acknowledged[index].documentId}'),
                                          ],
                                        ),
                                        padding: EdgeInsets.all(5.0),
                                      ),
                                    ),
                                  ],
                                ),
                                actions: <Widget>[
                                  RaisedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    color: Color(0xFF030423),
                                    textColor: Colors.white,
                                    child: Text('Close'),
                                  )
                                ],
                              ),
                              barrierDismissible: false,
                            );
                          },
                          child: Text('${acknowledged[index].username}'),
                        ),
                      ),
                      feedback: Material(
                        elevation: 5.0,
                        child: Container(
                          width: 284.0,
                          padding: const EdgeInsets.all(16.0),
                          color: Colors.yellow,
                          child: Text('${acknowledged[index].username}'),
                        ),
                      ),
                      onDragStarted: () {
                        acknowledgedData2 = acknowledged[index];
                        dragStatus = 'acknowledged';
                      },
                    );
                  },
                );
              },
              onAccept: (data) {
                if (!acknowledged.contains(acknowledgedData1)) {
                  acknowledged.add(acknowledgedData1);
                  notAcknowledged.remove(acknowledgedData1);
                  setState(() {});
                  showDialog(
                    context: context,
                    child: AlertDialog(
                      content: Wrap(
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(labelText: 'GPOC Name'),
                            controller: myController,
                          ),
                          TextField(
                            decoration:
                                InputDecoration(labelText: 'GPOC Number'),
                            controller: myController1,
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            final gpocName = myController.text;
                            final gpocContact = myController1.text;
                            //_fireStore.collection('NotAcknowledged').doc('${acknowledgedData1.documentID}').update();
                            Navigator.pop(context);
                          },
                          color: Colors.yellow,
                          child: Text('close'),
                        )
                      ],
                    ),
                    barrierDismissible: false,
                  );
                  _fireStore.collection('ack').add({
                    'description': acknowledgedData1.description,
                    'location': acknowledgedData1.location,
                    'username': acknowledgedData1.username,
                  });
                }
              },
            ),
            //),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(70.0, 110.0, 70.0, 110.0),
            width: 292.0,
            height: 500.0,
            color: Color(0xff030423),
            child: DragTarget(
              builder: (context, candidateData, rejectedData) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: completed.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(10.0),
                      child: RaisedButton(
                        color: Color(0xFF67FD64),
                        onPressed: () {
                          {
                            showDialog(
                              context: context,
                              child: AlertDialog(
                                title: Text('${completed[index].description}'),
                                content: Wrap(
                                  direction: Axis.vertical,
                                  children: <Widget>[
                                    Text('${completed[index].location}'),
                                  ],
                                ),
                                actions: <Widget>[
                                  RaisedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    color: Colors.yellow,
                                    child: Text('Close'),
                                  )
                                ],
                              ),
                              barrierDismissible: false,
                            );
                          }
                        },
                        child: Text('${completed[index].username}'),
                        padding: EdgeInsets.all(10.0),
                      ),
                    );
                  },
                );
              },
              onAccept: (data) {
                if (dragStatus == 'notAcknowledged') {
                  completed.add(acknowledgedData1);
                  notAcknowledged.remove(acknowledgedData1);
                } else {
                  completed.add(acknowledgedData2);
                  acknowledged.remove(acknowledgedData2);
                }
                setState(() {});
                print("hello");
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
