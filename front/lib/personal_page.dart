import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // страница с выбором что делать после авторизации
  const HomeScreen({super.key});
  static const String route = '/homepage';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 207, 229, 195),
      body: Center(
        child: SizedBox(),
      ),
    );
  }
}
