import 'package:flutter/material.dart';
import 'package:worthy/widgets/sidebar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Worthy'),
        backgroundColor: Color(0xFF4CA237),
      ),
      body: _body(),
      drawer: Sidebar(),
    );
  }

  _body() {

  }
}
