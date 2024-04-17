import 'package:flutter/material.dart';

class Uploded extends StatefulWidget {
  final uploaded_controller;
  final uploaded_page;
  const Uploded({super.key,required this.uploaded_controller,this.uploaded_page});

  @override
  State<Uploded> createState() => _UplodedState();
}

class _UplodedState extends State<Uploded> {
  String? selectedValue;
  String? selectedValue1;
  String? selectedValue2;
  @override
  Widget build(BuildContext context) {
    var a = MediaQuery.of(context).size;
List uploaded_page = widget.uploaded_page;
    PageController uploaded_controller = widget.uploaded_controller;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SafeArea(
        child: Container(
         color: Colors.pink,
        ),
      )),
    );
  }
}
