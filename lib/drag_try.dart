import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fireBase;

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
    var data1 = await _fireStore
        .collection('posts')
        .doc('103575341949204712387')
        .collection('userPosts')
        .get();
    for (var i = 0; i < data1.size; i++)
      notAcknowledged.add(data1.docs[i].get('username'));
    setState(() {});
  }

  var _fireStore = fireBase.firestore();
  final List notAcknowledged = [];
  final List acknowledged = [];
  final List completed = [];
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
            margin: EdgeInsets.fromLTRB(70.0, 110.0, 70.0, 110.0),
            height: 500.0,
            width: 292.0,
            child: Card(
              color: Color(0xffE5F2F1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: notAcknowledged.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Draggable(
                          child: Container(
                            child: RaisedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  child: AlertDialog(
                                    title: Text('${notAcknowledged[index]}'),
                                    content: Wrap(
                                      direction: Axis.vertical,
                                      children: <Widget>[
                                        Text("Hello World"),
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
                              },
                              color: Colors.white,
                              child: Text('${notAcknowledged[index]}'),
                            ),
                            padding: EdgeInsets.all(20.0),
                          ),
                          feedback: Material(
                            elevation: 5.0,
                            child: Container(
                              width: 284.0,
                              padding: const EdgeInsets.all(16.0),
                              color: Colors.yellow,
                              child: Text(notAcknowledged[index]),
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
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(70.0, 110.0, 70.0, 110.0),
            width: 292.0,
            height: 500.0,
            child: Card(
              color: Color(0xffE5F2F1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: 470,
                    child: DragTarget(
                      builder: (context, candidateData, rejectedData) {
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: acknowledged.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Draggable(
                              child: Container(
                                margin: EdgeInsets.all(10.0),
                                child: RaisedButton(
                                  onPressed: () {
                                    {
                                      showDialog(
                                        context: context,
                                        child: AlertDialog(
                                          title: Text('${acknowledged[index]}'),
                                          content: Wrap(
                                            direction: Axis.vertical,
                                            children: <Widget>[
                                              Text("Hello World"),
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
                                  child: Text('${acknowledged[index]}'),
                                  color: Colors.white,
                                  padding: EdgeInsets.all(10.0),
                                ),
                              ),
                              feedback: Material(
                                elevation: 5.0,
                                child: Container(
                                  width: 284.0,
                                  padding: const EdgeInsets.all(16.0),
                                  color: Colors.yellow,
                                  child: Text('${acknowledged[index]}'),
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
                        acknowledged.add(acknowledgedData1);
                        notAcknowledged.remove(acknowledgedData1);
                        setState(() {});
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(70.0, 110.0, 70.0, 110.0),
            width: 292.0,
            height: 500.0,
            child: Card(
              color: Color(0xffE5F2F1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: 470,
                    child: DragTarget(
                      builder: (context, candidateData, rejectedData) {
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: completed.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.all(10.0),
                              child: Text('${completed[index]}'),
                              color: Colors.white,
                              padding: EdgeInsets.all(10.0),
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
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
