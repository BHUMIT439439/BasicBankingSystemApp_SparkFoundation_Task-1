import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<ContactUs> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contact Us",
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Basic Banking System",
                style: TextStyle(color: Colors.blueAccent, fontSize: 30.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Email id: XYZ@gmail.com",
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Contact no: 1456321456",
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Home"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
