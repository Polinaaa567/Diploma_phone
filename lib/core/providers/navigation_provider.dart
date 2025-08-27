import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dialog_page/dialog_page.dart';
import 'package:go_router/go_router.dart';

import 'package:volunteering_kemsu/core/providers/user_info_provider.dart';
import 'package:volunteering_kemsu/ui/page/auth_page.dart';
import 'package:volunteering_kemsu/ui/page/event_page.dart';
import 'package:volunteering_kemsu/ui/page/lessons_page.dart';
import 'package:volunteering_kemsu/ui/page/news_page.dart';
import 'package:volunteering_kemsu/ui/page/organization_page.dart';
import 'package:volunteering_kemsu/ui/page/settings_page.dart';
import 'package:volunteering_kemsu/ui/widgets/event/event_info_dialog.dart';
import 'package:volunteering_kemsu/ui/widgets/navigation/menu.dart';
import 'package:volunteering_kemsu/ui/widgets/news/news_info_dialog.dart';

final navIndexProvider = StateProvider<int>((ref) => 0);

final routerProvider = Provider<GoRouter>((ref) {
  final navIndexNotifier = ref.read(navIndexProvider.notifier);

  final isAuth = ref.watch(userInfoProvider.select(
    (state) => state.isAuthenticated,
  ));

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
            builder: (context, state) => EventScreen(),
            routes: [
              GoRoute(
                path: '/:id',
                pageBuilder: (context, state) {
                  return DialogPage(
                    barrierDismissible: true,
                    child: EventInfoDialog(),
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: '/news',
            builder: (context, state) => NewsScreen(),
            routes: [
              GoRoute(
                path: '/:id',
                pageBuilder: (context, state) {
                  return DialogPage(
                    barrierDismissible: true,
                    child: NewsInfoDialog(),
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: '/lessons',
            pageBuilder: (context, state) => CustomTransitionPage(
              child: LessonScreen(),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity: animation,
                child: child,
              ),
            ),
          ),
          if (isAuth)
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
            builder: (context, state) => SettingsScreen(),
            routes: [
              GoRoute(
                path: '/organization',
                pageBuilder: (context, state) {
                  return DialogPage(
                    barrierDismissible: true,
                    child: OrganizationInfo(),
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: '/auth',
            builder: (context, state) => AuthScreen(),
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      final location = state.path;
      if (location == '/' || location == '/events') {
        navIndexNotifier.state = 0;
      } else if (location == '/news') {
        navIndexNotifier.state = 1;
      } else if (location == '/lessons') {
        navIndexNotifier.state = 2;
      } else if (location == '/rating') {
        navIndexNotifier.state = 3;
      } else if (location == '/settings') {
        navIndexNotifier.state = 4;
      }
      return null;
    },
  );
});
