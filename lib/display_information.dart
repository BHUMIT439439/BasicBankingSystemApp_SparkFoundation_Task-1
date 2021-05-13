import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';

class CustomerInformation extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<CustomerInformation> {
  final db = FirebaseFirestore.instance;

  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text("Customer Information");

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: cusSearchBar,
          actions: <Widget>[
            IconButton(
              icon: cusIcon,
              onPressed: () {
                setState(() {
                  if (this.cusIcon.icon == Icons.search) {
                    this.cusIcon = Icon(Icons.cancel);
                    this.cusSearchBar = TextField(
                      textInputAction: TextInputAction.go,
                      decoration:
                          InputDecoration(hintText: "Enter name for search"),
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    );
                  } else {
                    this.cusIcon = Icon(Icons.search);
                    this.cusSearchBar = Text("Customer Information");
                  }
                });
              },
            )
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: db.collection('users').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: snapshot.data.docs.map((document) {
                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                        child: Card(
                          elevation: 20.0,
                          color: Colors.blue[50],
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "Name: ${document['name']}",
                                  style: TextStyle(fontSize: 16.0),
                                ), //name type is string
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "Balance: ${document['balance']}",
                                  style: TextStyle(fontSize: 16.0),
                                ), //account no type is int
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "Account No: ${document['accountno']}",
                                  style: TextStyle(fontSize: 16.0),
                                ), //account no type is int
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "Mobile No: ${document['mobileno']}",
                                  style: TextStyle(fontSize: 16.0),
                                ), //mobile no type is int
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "Email ID: ${document['email']}",
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }
                ).toList(),
              );
            } else if (snapshot.hasError) {
              return CircularProgressIndicator();
            } else {
              return CircularProgressIndicator();
            }

            //
          },
        ));
  }
}
