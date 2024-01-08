import 'package:fuzik_app/ui/pages/auth/auth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: SafeArea(
    child: Scaffold(
      body: MyWidget(),
      // appBar: AppBar(
      //   backgroundColor: Colors.red,
      //   title: const Text('Flutter'),
      // ),
      // body: Center(child: const Text('Hello world'))),
    ),
  )));
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Card(
        color: Colors.pink,
        child: Padding(
            padding: EdgeInsets.all(100.0),
            child: Text(
              'NDNM',
              style: TextStyle(fontSize: 20, color: Colors.white),
            )));
  }
}

class MyWidget2 extends StatefulWidget {
  final bool loading;
  MyWidget2(this.loading);
  @override
  State<StatefulWidget> createState() {
    return MyWidget2State();
  }
}

class MyWidget2State extends State<MyWidget2> {
  late bool _localLoading;
  @override
  void initState() {
    _localLoading = widget.loading;
  }

  @override
  Widget build(BuildContext context) {
    return _localLoading
        ? CircularProgressIndicator()
        : FloatingActionButton(onPressed: onClick);
  }

  void onClick() {
    setState(() {
      _localLoading = true;
    });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const RegisterPage());
  }
}
