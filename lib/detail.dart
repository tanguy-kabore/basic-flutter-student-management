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
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back)),
          title: Text('${student.lastname} ${student.firstname}'),
          backgroundColor: Colors.yellow,
        ),
        body: Center(
          child: Column(children: [
            Text('Nom & Prénom : ${student.lastname} ${student.firstname}'),
            Text('Note: ${student.mark ?? 0} /20'),
            Text('Commentaire: ${student.comment ?? 'Pas de commentaire !'}')
          ],)
        ),
      )
    );
  }
}