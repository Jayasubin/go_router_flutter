import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:routing_strategies/screens/404_screen.dart';
import 'package:routing_strategies/screens/add_screen.dart';
import 'package:routing_strategies/screens/auth_screen.dart';
import 'package:routing_strategies/screens/detail_screen.dart';
import 'package:routing_strategies/screens/edit_screen.dart';
import 'package:routing_strategies/screens/home_screen.dart';
import 'package:routing_strategies/screens/list_screen.dart';
import 'package:routing_strategies/screens/shell_screen.dart';
import 'package:routing_strategies/screens/splash_screen.dart';

class AppRouter {
  static GoRouter goRouter(BuildContext appContext) => GoRouter(
        initialLocation: '/',
        //refreshListenable: appContext.read<AuthCubit>().stream,
        redirect: (context, state) {
          log(state.location);
          //
          // final authState = context.read<AuthCubit>().state;
          // if (authState is Authorized || state.location.startsWith('/auth')) {
          //   return null;
          // } else {
          //   return '/auth';
          // }

          return null;
        },
        routes: [
          ShellRoute(
              builder: (_, __, child) {
                return ShellScreen(
                  child: child,
                );
              },
              routes: [
                GoRoute(
                  path: '/',
                  builder: (_, __) {
                    return const SplashScreen();
                  },
                ),
                GoRoute(
                  path: '/auth',
                  builder: (_, __) {
                    return const AuthScreen();
                  },
                ),
                GoRoute(
                  path: '/home',
                  builder: (_, __) {
                    return const HomeScreen();
                  },
                  routes: <GoRoute>[
                    GoRoute(
                      path: 'list',
                      builder: (_, __) {
                        return const ListScreen();
                      },
                      routes: <GoRoute>[
                        GoRoute(
                          path: 'add',
                          builder: (_, __) {
                            return const AddScreen();
                          },
                        ),
                        GoRoute(
                          path: 'detail/:id',
                          builder: (_, state) {
                            final String id = state.params['id'] as String;
                            return DetailScreen(id: id);
                          },
                          routes: <GoRoute>[
                            GoRoute(
                              path: 'edit',
                              builder: (_, state) {
                                return const EditScreen();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
        ],
        errorBuilder: (_, __) => const Screen404(),
      );
}
