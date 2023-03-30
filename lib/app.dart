import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routing_strategies/cubit/auth_cubit.dart';
import 'package:routing_strategies/go_router.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            title: "Routing sample",
            routerConfig: AppRouter.goRouter(context),
          );
        },
      ),
    );
  }
}
