import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';

class TransactionMoney extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<TransactionMoney> {
  bool x = false;
  var _acc1;
  var _acc2;
  var _val1;

  final acc1Controller = TextEditingController();
  final acc2Controller = TextEditingController();
  final val1Controller = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Banking System'),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: TextField(
                controller: acc1Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Enter Account No Here'),
              ),
            ),
            Container(
              child: TextField(
                controller: acc2Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Enter Account No Here'),
              ),
            ),
            Container(
              child: TextField(
                controller: val1Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Enter value Here'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child: RaisedButton(
                child: Text("Transfer"),
                onPressed: () {
                  setState(() {
                    _acc1 = acc1Controller.text;
                    _acc2 = acc2Controller.text;
                    _val1 = val1Controller.text;
                    x = true;
                    //Temp.constructer1(_acc1, _acc2, _val1);
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Back to Home"),
              ),
            ),
            x
                ? Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                        child: Image.asset('assets/images/c1.png',
                            height: 50, width: 50),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                        child: Text(
                          "Successfully $_val1 ₹ Transfer !!!",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      )
                    ],
                  )
                : Text("")

            // Text('$_acc1 ---- $_acc2 ---- $_val1'),
            // x
            //     ? StreamBuilder<QuerySnapshot>(
            //         stream: FirebaseFirestore.instance
            //             .collection("users")
            //             .where("accountno", isEqualTo: _acc1)
            //             .snapshots(),
            //         builder: (context, snapshot) {
            //           if (snapshot.hasData) {
            //             return ListView(
            //               children: snapshot.data.docs.map((document) {
            //                 return Column(
            //                   children: <Widget>[
            //                     Text("Name: ${document['name']}")
            //                   ],
            //                 );
            //               }).toList(),
            //             );
            //           } else {
            //             return Text("no data found");
            //           }
            //         },
            //       )
            //     : Text("no data"),
          ],
        ),
      ),
    );
  }
}
