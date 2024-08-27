import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:routing_strategies/confirm_back.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) =>
          confirmBack(context, 'list', didPop, result),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('List'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.go('/home/list/detail/Item-1');
                },
                child: const Text('Detail page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
