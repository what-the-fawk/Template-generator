import 'package:flutter/material.dart';

class ChangePerson extends StatelessWidget {
  const ChangePerson({super.key});
  static const String route = '/changes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 238, 238),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 8),
        // children: const [Menu(), Body()],
      ),
    );
  }
}
