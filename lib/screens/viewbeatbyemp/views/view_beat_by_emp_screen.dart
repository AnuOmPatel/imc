import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewBeatByEmpScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final empId = args['empid'];

    return Scaffold(
      appBar: AppBar(title: Text("Beat by Emp")),
      body: Center(
        child: Text("Employee ID: $empId"),
      ),
    );
  }

}