import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});
  static const String routeName = 'landingPage';
  static const String path = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 200,
            color: Colors.red,
            child: const Center(child: Text('Landing Page')),
          ),
          Container(
            height: 200,
            color: Colors.blue,
            child: const Center(child: Text('Landing Page')),
          ),
          Container(
            height: 200,
            color: Colors.green,
            child: const Center(child: Text('Landing Page')),
          ),
        ],
      ),
    );
  }
}
