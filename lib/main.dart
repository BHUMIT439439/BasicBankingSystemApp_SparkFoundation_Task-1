import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mbbs/contact_us.dart';
import 'package:mbbs/transfer_money.dart';
import 'package:mbbs/display_information.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BankApp());
}

class BankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/information': (context) => CustomerInformation(),
        '/transaction': (context) => TransactionMoney(),
        '/contact': (context) => ContactUs(),
      },
      title: 'bank',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyBankHomePage(),
    );
  }
}

class MyBankHomePage extends StatefulWidget {
  @override
  _MyBankHomePageState createState() => _MyBankHomePageState();
}

class _MyBankHomePageState extends State<MyBankHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Banking System'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 10.0),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/information');
                },
                child: Image.asset('assets/images/customer_info.png',
                    height: 100, width: 100),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 50.0),
              child: Text(
                "Customer Information",
                style: TextStyle(fontSize: 15.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/transaction');
                },
                child: Image.asset('assets/images/t2.png',
                    height: 100, width: 100),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 50.0),
              child: Text(
                "Transfer Money",
                style: TextStyle(fontSize: 15.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/contact');
                },
                child: Image.asset('assets/images/contact.png',
                    height: 100, width: 100),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 50.0),
              child: Text(
                "Contact Us",
                style: TextStyle(fontSize: 15.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
