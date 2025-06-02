import 'package:flutter/material.dart';
import 'package:ist_app/detail.dart';
import 'package:ist_app/student.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My first App',
        home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'First Page',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            backgroundColor: Colors.yellow,
          ),
          body: const FirstPage(),
        ));
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});
  @override
  FirstPageState createState() {
    return FirstPageState();
  }
}

class FirstPageState extends State<FirstPage> {
  final _formKey = GlobalKey<FormState>();
  final _lastNameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _comentController = TextEditingController();
  final _markController = TextEditingController();
  List<Student> students = [
    Student(lastname: 'KABORE', firstname: 'Tanguy', mark: 20),
    Student(lastname: 'OUEDRAOGO', firstname: 'Ibrahim', mark: 10),
    Student(lastname: 'SAWADOGO', firstname: 'Noaga'),
  ];
  void deleteStudent(List<Student> students, int index) {
    students.removeAt(index);
    setState(() {});
  }
  void createStudent(){
    if(_formKey.currentState!.validate() 
    && _lastNameController.value.text !="" 
    && _firstNameController.value.text !=""
    && _comentController.value.text !=""
    && _markController.value.text !=""){
      students.add(Student(
        lastname: _lastNameController.value.text, 
        firstname: _firstNameController.value.text,
        mark: int.parse(_markController.value.text),
        comment: _comentController.value.text));
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Ajouté!",
        style: TextStyle(color: Colors.green),)));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Erreur!",
        style: TextStyle(color: Colors.red),)));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Center(
          child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Detail(student: students[index]);
                      }));
                    },
                    leading: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image.asset(
                          'assets/images/armoirie.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                    title: Text(
                        '${students[index].lastname} ${students[index].firstname}'),
                    subtitle: Text('${students[index].mark ?? 0}'),
                    trailing: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: const Text(
                                    'Voulez-vous vraiment supprimer ?'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        'Non',
                                        style: TextStyle(color: Colors.red),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        deleteStudent(students, index);
                                        Navigator.of(context).pop();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content:
                                                    Text('Bien supprimé!')));
                                      },
                                      child: const Text(
                                        'Oui',
                                        style: TextStyle(color: Colors.green),
                                      )),
                                ],
                              );
                            });
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  );
                }),
          ),
          Form(
            key: _formKey,
              child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Nom'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Prénom'),
              ),
              TextField(
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(labelText: 'Commentaire'),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Note'),
                    ),
                  ),
                  ElevatedButton(onPressed: () {}, child: const Text('Save'))
                ],
              )
            ],
          ))
        ],
      )),
    );
  }
}
