import 'package:flutter/material.dart';
import 'package:future_builder_and_stream_builder/screens/future_builder.dart';
import 'package:future_builder_and_stream_builder/screens/stream_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StreamBuilderWidget(title: 'Future Builder'),
    );
  }
}