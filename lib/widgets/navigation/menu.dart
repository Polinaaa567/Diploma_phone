import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:volunteering_kemsu/core/providers/auth_providers.dart';

import 'package:volunteering_kemsu/widgets/providers/navigation_provider.dart';

class NavigationMenu extends ConsumerWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navIndexProvider);
    final isAuth = ref.watch(authProvider.select(
          (state) => state.isAuthenticated,
    ));

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => _onItemTapped(index, ref, context),
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
        if (isAuth) const BottomNavigationBarItem(
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

  void _onItemTapped(int index, WidgetRef ref, BuildContext context) {
    ref.read(navIndexProvider.notifier).state = index;

    switch (index) {
      case 0:
        context.go('/events');
        break;
      case 1:
        context.go('/news');
        break;
      case 2:
        context.go('/lessons');
        break;
      case 3:
        context.go('/rating');
        break;
      case 4:
        context.go('/settings');
        break;
    }
  }
}
