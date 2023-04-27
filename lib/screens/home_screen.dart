import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:routing_strategies/theme/theme_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scheme = Theme.of(context).colorScheme;
    final help = ThemeHelper.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: scheme.primaryContainer,
                  height: size.width / 12,
                  width: size.width / 12,
                ),
                const SizedBox(width: 32),
                Container(
                  color: help.cScheme.primaryContainer,
                  height: help.containerWidth,
                  width: help.containerWidth,
                ),
              ],
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                context.go('/home/list');
              },
              child: const Text('List page'),
            ),
          ],
        ),
      ),
    );
  }
}
