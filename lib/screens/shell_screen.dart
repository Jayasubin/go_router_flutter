import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:routing_strategies/cubit/auth_cubit.dart';

class ShellScreen extends StatefulWidget {
  const ShellScreen({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<ShellScreen> createState() => _ShellScreenState();
}

class _ShellScreenState extends State<ShellScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<AuthCubit>().checkAuth();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          context.go('/');
        }
        if (state is Authorized) {
          context.go('/home');
        }
        if (state is UnAuthorized) {
          context.go('/auth');
        }
      },
      child: widget.child,
    );
  }
}
