import 'package:flutter/material.dart';

class ThemeHelper extends InheritedWidget {
  final BuildContext context;

  ThemeHelper({
    super.key,
    required super.child,
    required this.context,
  }) {
    print('Created theme helper');
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    print('Updated theme helper');
    return true;
  }

  static ThemeHelper of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ThemeHelper>()!;

  ColorScheme get cScheme => Theme.of(context).colorScheme;

  double get containerWidth => (MediaQuery.of(context).size).width / 12;
}
