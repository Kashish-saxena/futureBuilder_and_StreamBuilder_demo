import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

class StreamBuilderWidget extends StatefulWidget {
  const StreamBuilderWidget({super.key, required this.title});
  final String title;
  @override
  State<StreamBuilderWidget> createState() => _StreamBuilderWidgetState();
}

class _StreamBuilderWidgetState extends State<StreamBuilderWidget> {
  late StreamController<int> _bids;

  @override
  void initState() {
    super.initState();
    _bids = StreamController<int>(onListen: () {
      return _startAddingNumbers();
    });
  }

  void _startAddingNumbers() async {
    for (int i = 0; i <10; i++) {
      await Future.delayed(const Duration(seconds: 2));
      _bids.sink.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: _bids.stream,
          builder: (context, data) {
            if (data.hasData) {
              log("In hasData part>>>>>>>>>>>>>>>>>>>>${data.data}");
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
            } else {
              log("In waiting part>>>>>>>>>>>>>>>>>>>>${data.data}");
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  Text(
                    "Please wait the counter is increamenting...",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ));
            }
          }),
    );
  }
}
