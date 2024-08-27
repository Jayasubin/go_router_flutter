import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:routing_strategies/confirm_back.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) =>
          confirmBack(context, 'home', didPop, result),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Home'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              context.go('/home/list');
            },
            child: const Text('List page'),
          ),
        ),
      ),
    );
  }
}
