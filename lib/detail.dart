import 'package:flutter/material.dart';
import 'package:ist_app/student.dart';

class Detail extends StatelessWidget{
  final Student student;
  const Detail({super.key, required this.student});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('${student.lastname} ${student.firstname}'),
          backgroundColor: Colors.yellow,
        ),
        body: Center(
          child: Column(children: [
            Text('Nom ${student.lastname} ${student.firstname}'),
          ],)
        ),
      )
    );
  }
}