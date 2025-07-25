import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:volunteering_kemsu/core/providers/animation_provider.dart';

import 'package:volunteering_kemsu/core/providers/profile_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(profileProvider.select(
      (state) => state.userProfile,
    ));

    final login = ref.watch(profileProvider.select(
      (state) => state.login,
    ));

    return Scaffold(
      backgroundColor: Color.fromARGB(100, 222, 248, 251),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(0.8, 1),
                    colors: <Color>[Colors.blue, Colors.lightBlueAccent],
                    tileMode: TileMode.mirror,
                  ),
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Настройки",
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[300],
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: Color.fromARGB(82, 25, 96, 184),
                        width: 1.5,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Text(
                  "${userProfile?.name ?? 'Пользователь'} ${userProfile?.lastName ?? 'Пользователь'}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Color.fromARGB(250, 22, 32, 128),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    '${login != '' ? login : 'Логин'}',
                    style: TextStyle(
                      color: Color.fromARGB(150, 0, 0, 0),
                    ),
                  ),
                ),
                // Padding(
                //   padding:
                //       EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 20),
                //   child: Container(
                //     decoration: BoxDecoration(
                //       gradient: LinearGradient(
                //         colors: [
                //           Colors.cyan,
                //           Colors.indigo,
                //         ],
                //       ),
                //       borderRadius: BorderRadius.circular(25),
                //     ),
                //     child: ElevatedButton(
                //       style: ElevatedButton.styleFrom(
                //         backgroundColor: Colors.transparent,
                //         shadowColor: Colors.transparent,
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(25),
                //         ),
                //         foregroundColor: Colors.white,
                //       ),
                //       onPressed: () {},
                //       child: Padding(
                //         padding: EdgeInsets.all(5),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Padding(
                //               padding: EdgeInsets.only(right: 10),
                //               child: Icon(
                //                 Icons.edit_note,
                //                 color: Colors.white,
                //                 size: 25,
                //               ),
                //             ),
                //             Text(
                //               'Редактировать профиль',
                //               style: TextStyle(
                //                 fontSize: 15,
                //                 fontWeight: FontWeight.bold,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
            Card(
              color: Colors.white,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              shadowColor: Colors.indigo,
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Личная информация',
                          style: TextStyle(
                            color: Color.fromARGB(255, 46, 90, 175),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 5,
                            bottom: 15,
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 1,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(80, 40, 92, 191),
                            ),
                          ),
                        ),
                        _rowInfoUsers(
                          'Размер',
                          userProfile?.clothingSize ?? 'xs',
                        ),
                        Container(
                          width: double.infinity,
                          height: 1,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(10, 0, 0, 0),
                          ),
                        ),
                        _rowInfoUsers(
                          'Форма обучения',
                          userProfile?.formEducation ?? 'Очная',
                        ),
                        Container(
                          width: double.infinity,
                          height: 1,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(10, 0, 0, 0),
                          ),
                        ),
                        _rowInfoUsers(
                          'Основа обучения',
                          userProfile?.basisEducation ?? 'Бюджет',
                        ),
                        Container(
                          width: double.infinity,
                          height: 1,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(10, 0, 0, 0),
                          ),
                        ),
                        _rowInfoUsers(
                          'Имя',
                          userProfile?.name ?? '',
                        ),
                        Container(
                          width: double.infinity,
                          height: 1,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(10, 0, 0, 0),
                          ),
                        ),
                        _rowInfoUsers(
                          'Фамилия',
                          userProfile?.lastName ?? '',
                        ),
                        Container(
                          width: double.infinity,
                          height: 1,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(10, 0, 0, 0),
                          ),
                        ),
                        _rowInfoUsers(
                          'Отчество',
                          userProfile?.patronymic ?? '',
                        ),
                        Container(
                          width: double.infinity,
                          height: 1,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(10, 0, 0, 0),
                          ),
                        ),
                        _rowInfoUsers(
                          'Исполнилось 18 лет? ',
                          userProfile?.ageStamp ?? 'false',
                        ),
                        Container(
                          width: double.infinity,
                          height: 1,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(10, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Container(
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(
                  color: Color.fromARGB(50, 0, 0, 0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.settings_suggest_outlined,
                        color: Color.fromARGB(255, 0, 124, 185),
                        size: 28,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Основные настройки',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 124, 185),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  _customCardSettings(
                    'Notifier',
                    'Уведомления',
                    'Управление push-уведомлениями',
                    () => ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Типо настройка уведомлений'),
                      ),
                    ),
                    icon: Icons.notifications,
                  ),
                  _customCardSettings(
                    'Theme',
                    'Тема оформления',
                    'Тёмная / Светлая / Системная',
                    icon: Icons.dark_mode,
                    () => {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Здесь меняются цвета')),
                      ),
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(
                  color: Color.fromARGB(50, 0, 0, 0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info,
                        color: Color.fromARGB(255, 0, 124, 185),
                        size: 28,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'О приложении',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 124, 185),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  _customCardSettings(
                    'version',
                    'Версия приложения',
                    'Текущая версия: 0.0.1',
                    () {},
                    faIcon: FontAwesomeIcons.code,
                  ),
                  _customCardSettings(
                    'razrab',
                    'Разработчик',
                    'Kolesnik P. O.',
                    () {},
                    icon: Icons.person,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(
                  color: Color.fromARGB(50, 0, 0, 0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.heartPulse,
                        color: Color.fromARGB(255, 0, 124, 185),
                        size: 28,
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          'О волонтёрском центре',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 124, 185),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  _customCardSettings(
                    'volunteering KemSU',
                    'О нас',
                    'Подробная информация о центре',
                    () {},
                    icon: Icons.volunteer_activism_outlined,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(
                  color: Color.fromARGB(50, 0, 0, 0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.question_mark_outlined,
                        color: Color.fromARGB(255, 0, 124, 185),
                        size: 25,
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          'Часто задаваемые вопросы',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 124, 185),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.redAccent,
                  elevation: 0,
                  side: BorderSide(
                    width: 2.0,
                    color: Colors.redAccent,
                  ),
                ).copyWith(
                  backgroundColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                    if (states.contains(WidgetState.pressed) ||
                        states.contains(WidgetState.hovered)) {
                      return Colors.redAccent;
                    }

                    return Colors.transparent;
                  }),
                  foregroundColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                    if (states.contains(WidgetState.pressed) ||
                        states.contains(WidgetState.hovered)) {
                      return Colors.white;
                    }

                    return Colors.redAccent;
                  }),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.rightFromBracket,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Выйти из аккаунта')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _customCardSettings(
    String cardKey,
    String name,
    String description,
    dynamic onTap, {
    IconData? icon,
    IconData? faIcon,
  }) =>
      Consumer(
        builder: (context, ref, child) {
          final isHovered = ref.watch(cardHoverProvider(cardKey));
          final isPressed = ref.watch(cardPressedProvider(cardKey));

          final isActive = isHovered || isPressed;

          final cardColor = isPressed
              ? Color.fromARGB(255, 225, 223, 223)
              : isHovered
                  ? Color.fromARGB(255, 225, 223, 223)
                  : Colors.white;
          final iconColor = isPressed
              ? Colors.white
              : isHovered
                  ? Colors.white
                  : Color.fromARGB(255, 0, 124, 185);

          final containerColor = isPressed
              ? Color.fromARGB(255, 0, 124, 185)
              : isHovered
                  ? Color.fromARGB(255, 0, 124, 185)
                  : Color.fromARGB(100, 153, 203, 227);

          const double rotation = 0.1;
          const double iconShift = 5.0;

          return Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: MouseRegion(
                onEnter: (_) =>
                    ref.read(cardHoverProvider(cardKey).notifier).state = true,
                onExit: (_) =>
                    ref.read(cardHoverProvider(cardKey).notifier).state = false,
                child: GestureDetector(
                  onTapDown: (_) => ref
                      .read(cardPressedProvider(cardKey).notifier)
                      .state = true,
                  onTapUp: (_) => ref
                      .read(cardPressedProvider(cardKey).notifier)
                      .state = false,
                  onTapCancel: () => ref
                      .read(cardPressedProvider(cardKey).notifier)
                      .state = false,
                  onTap: onTap,
                  child: Card(
                    color: cardColor,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    shadowColor: Colors.indigo,
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 20,
                        ),
                        child: Row(
                          children: [
                            AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              transform:
                                  Matrix4.rotationZ(isActive ? rotation : 0),
                              transformAlignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: containerColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(13),
                                child: icon != null
                                    ? Icon(
                                        icon,
                                        size: 30,
                                        color: iconColor,
                                      )
                                    : FaIcon(
                                        faIcon,
                                        size: 27,
                                        color: iconColor,
                                      ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      name,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      description,
                                      style: TextStyle(
                                        color: Color.fromARGB(150, 0, 0, 0),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              transform: Matrix4.translationValues(
                                isActive ? iconShift : 0,
                                0,
                                0,
                              ),
                              child: Icon(
                                Icons.chevron_right,
                                size: 30,
                                color: Color.fromARGB(120, 0, 0, 0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
          );
        },
      );

  Widget _rowInfoUsers(String name, String info) => Row(
        children: [
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                color: Color.fromARGB(120, 0, 0, 0),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
              child: Text(
            info,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          )),
          IconButton(
            onPressed: () {},
            icon: FaIcon(
              FontAwesomeIcons.solidPenToSquare,
              size: 20,
              color: Color.fromARGB(255, 46, 90, 175),
            ),
          ),
        ],
      );
}
