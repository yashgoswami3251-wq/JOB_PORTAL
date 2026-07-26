import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

void main(){
  runApp(myflutter());
}

class myflutter extends StatefulWidget {
  const myflutter({super.key});

  @override
  State<myflutter> createState() => _myflutterState();
}

class _myflutterState extends State<myflutter> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: HomeHeader()
      ),
    );
  }
}
