import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liz and Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter1 = 0;

  int _counter2 = 0;

  void _incrementCounter1() {
    setState(() {
      _counter1++;
    });
  }

  void _incrementCounter2() {
    setState(() {
      _counter2++;
    });
  }

  void _decrementCounter1() {
    setState(() {
      if (_counter1 > 0) {
        _counter1--;
      }
    });
  }

  void _decrementCounter2() {
    setState(() {
      if (_counter2 > 0) {
        _counter2--;
      }
    });
  }

  Widget buildFloatingActionButton(
      IconData icon, Function() counter, String tooltip) {
    return FloatingActionButton(
      onPressed: counter,
      tooltip: tooltip,
      child: Icon(icon),
    );
  }

  Widget buildColumn(String player, String counter) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          player,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Your Score Is:',
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          counter,
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    );
  }

  Widget buildFloatingActionRow(
      Function() decrementCounter, Function() incrementCounter) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(children: [
        buildFloatingActionButton(
          Icons.remove,
          decrementCounter,
          'decrement',
        ),
        buildFloatingActionButton(
          Icons.add,
          incrementCounter,
          'increment',
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Score Counter'),
      ),
      body: Center(
        child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 400),
            children: [
              buildColumn('Player 1', '$_counter1'),
              buildColumn('Player 2', '$_counter2'),
            ]),
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        buildFloatingActionRow(_decrementCounter1, _incrementCounter1),
        buildFloatingActionRow(_decrementCounter2, _incrementCounter2),
      ]),
    );
  }
}
