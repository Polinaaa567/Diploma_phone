import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:volunteering_kemsu/core/repositories/event_repository.dart';
import 'package:volunteering_kemsu/features/navigation/menu.dart';
import 'package:volunteering_kemsu/page/event_page.dart';
import 'package:volunteering_kemsu/page/news_page.dart';

final navIndexProvider = StateProvider<int>((ref) => 0);

final routerProvider = Provider<GoRouter>((ref) {
  final navIndexNotifier = ref.read(navIndexProvider.notifier);

  return GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return Scaffold(
            body: child,
            bottomNavigationBar: const NavigationMenu(),
          );
        },
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) => CustomTransitionPage(
              child: const EventScreen(),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity: animation,
                child: child,
              ),
            ),
          ),
          GoRoute(
            path: '/events',
            pageBuilder: (context, state) => CustomTransitionPage(
              child: const EventScreen(),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity: animation,
                child: child,
              ),
            ),
          ),
          GoRoute(
            path: '/news',
            pageBuilder: (context, state) => CustomTransitionPage(
              child: const NewsScreen(),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity: animation,
                child: child,
              ),
            ),
          ),
          GoRoute(
            path: '/lessons',
            pageBuilder: (context, state) => CustomTransitionPage(
              child: const EventScreen(),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity: animation,
                child: child,
              ),
            ),
          ),
          GoRoute(
            path: '/rating',
            pageBuilder: (context, state) => CustomTransitionPage(
              child: const NewsScreen(),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity: animation,
                child: child,
              ),
            ),
          ),
          GoRoute(
            path: '/settings',
            pageBuilder: (context, state) => CustomTransitionPage(
              child: const EventScreen(),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity: animation,
                child: child,
              ),
            ),
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      final location = state.path;
      if (location == '/' || location == '/events')
        navIndexNotifier.state = 0;
      else if (location == '/news')
        navIndexNotifier.state = 1;
      else if (location == '/lessons')
        navIndexNotifier.state = 2;
      else if (location == '/rating')
        navIndexNotifier.state = 3;
      else if (location == '/settings') navIndexNotifier.state = 4;

      return null;
    },
  );
});
