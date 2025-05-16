import 'package:flutter/material.dart';

class PassengerPanel extends StatelessWidget {
  const PassengerPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Passenger"),
        centerTitle: true,
        backgroundColor: Colors.purple[100],
      ),
    );
  }
}
