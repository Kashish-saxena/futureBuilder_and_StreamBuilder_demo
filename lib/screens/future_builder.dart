import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Future<int> getData() {
    return Future.delayed(const Duration(seconds: 2), () {
      return _counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, data) {
            if (data.connectionState == ConnectionState.done) {
              if (data.hasError) {
                return Center(
                  child: Text("${data.error} occured"),
                );
              } else if (data.hasData) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'You have pushed the button this many times:',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        '${data.data}',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ],
                  ),
                );
              }
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  Text(
                    "Please wait increamenting the counter",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
