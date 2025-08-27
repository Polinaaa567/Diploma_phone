import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:volunteering_kemsu/core/providers/lessons_provider.dart';

import 'package:volunteering_kemsu/core/providers/user_info_provider.dart';
import 'package:volunteering_kemsu/core/providers/navigation_provider.dart';

class NavigationMenu extends ConsumerWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navIndexProvider);

    final isAuth = ref.watch(userInfoProvider.select(
      (state) => state.isAuthenticated,
    ));

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) async => _onItemTapped(index, ref, context),
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.event),
          label: "Мероприятия",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.newspaper),
          label: "Новости",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.menu_book_sharp),
          label: "Уроки",
        ),
        if (isAuth)
          const BottomNavigationBarItem(
            icon: Icon(Icons.grade),
            label: "Рейтинг",
          ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Настройки',
        )
      ],
    );
  }

  void _onItemTapped(int index, WidgetRef ref, BuildContext context) async {
    ref.read(navIndexProvider.notifier).state = index;
    final isAuth = ref.watch(userInfoProvider.select(
      (state) => state.isAuthenticated,
    ));
    switch (index) {
      case 0:
        context.go('/events');
        break;
      case 1:
        context.go('/news');
        break;
      case 2:
        ref.read(lessonProvider.notifier).refresh();
        await ref.read(lessonProvider.notifier).fetchAllLessons();
        if (context.mounted) {
          context.go('/lessons');
        }
        break;
      case 3:
        if (isAuth) {
          await ref.read(userInfoProvider.notifier).getRatingAllUsers();
          await ref.read(userInfoProvider.notifier).getUserAchievements();
          if (context.mounted) {
            context.go('/rating');
          }
        } else {
          context.go('/settings');
        }
        break;
      case 4:
        context.go('/settings');
        Logger().d(" set $index");
        break;
    }
  }
}
