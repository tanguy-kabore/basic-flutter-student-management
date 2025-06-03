import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My App',
        home: CounterPage());
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});
  @override
  CounterPageState createState() => CounterPageState();
}

class CounterPageState extends State<CounterPage> {
  int _count = 0;
  void incrementCounter() {
    _count++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          )
        ],
        title: const Text('IST'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Vous avez cliqué $_count fois"),
          TextButton(
              onPressed: () {
                setState(() {
                  _count = 0;
                });
              },
              child: const Text("Reset"))
        ],
      )),
      floatingActionButton: IconButton(
        onPressed: () {
          incrementCounter();
        },
        icon: const Icon(Icons.add),
        color: Colors.blueAccent,
      ),
    );
  }
}
