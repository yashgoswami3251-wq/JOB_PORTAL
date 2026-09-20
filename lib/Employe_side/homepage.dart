import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class employehomepage extends StatefulWidget {
  const employehomepage({super.key});

  @override
  State<employehomepage> createState() => _employehomepageState();
}

class _employehomepageState extends State<employehomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text("Hello Employee")
      ),
    );
  }
}
