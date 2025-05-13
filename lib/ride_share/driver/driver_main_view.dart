import 'package:flutter/material.dart';

class DriverMainView extends StatelessWidget {
  const DriverMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Driver"),
        centerTitle: true,
        backgroundColor: Colors.purple[100],
      ),
    );
  }
}
