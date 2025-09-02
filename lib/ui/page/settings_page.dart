import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:volunteering_kemsu/core/providers/animation_provider.dart';
import 'package:volunteering_kemsu/core/providers/navigation_provider.dart';
import 'package:volunteering_kemsu/core/providers/user_info_provider.dart';
import 'package:volunteering_kemsu/core/providers/organization_provider.dart';
import 'package:volunteering_kemsu/core/view_models/user_info/user_info_notifier.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final faqList = ref.watch(organizationProvider.select(
      (state) => state.faqList,
    ));

    final userProfile = ref.watch(userInfoProvider.select(
      (state) => state.userProfile,
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
            ref.watch(userInfoProvider.select(
                      (state) => state.token,
                    )) !=
                    'BAD'
                ? Column(
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
                          ref.watch(userInfoProvider.select(
                                    (state) => state.login,
                                  )) !=
                                  ''
                              ? ref.watch(userInfoProvider.select(
                                  (state) => state.login,
                                ))
                              : 'Логин',
                          style: TextStyle(
                            color: Color.fromARGB(150, 0, 0, 0),
                          ),
                        ),
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
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Личная информация',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 46, 90, 175),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      if (!ref.watch(userInfoProvider.select(
                                        (state) => state.isEdit,
                                      )))
                                        IconButton(
                                          onPressed: () => {
                                            ref
                                                .read(userInfoProvider.notifier)
                                                .toggleEdit()
                                          },
                                          icon: FaIcon(
                                            FontAwesomeIcons.solidPenToSquare,
                                            size: 20,
                                            color: Color.fromARGB(
                                                255, 46, 90, 175),
                                          ),
                                        ),
                                    ],
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
                                      ref.watch(userInfoProvider.select(
                                            (state) =>
                                                state.userProfile?.clothingSize,
                                          )) ??
                                          'xs',
                                      'size'),
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
                                      'formEducation'),
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
                                      'basisEducation'),
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
                                    'name',
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 1,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(10, 0, 0, 0),
                                    ),
                                  ),
                                  _rowInfoUsers('Фамилия',
                                      userProfile?.lastName ?? '', 'lastName'),
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
                                      'patronymic'),
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
                                      'ageStamp'),
                                  Container(
                                    width: double.infinity,
                                    height: 1,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(10, 0, 0, 0),
                                    ),
                                  ),
                                  if (ref.watch(userInfoProvider.select(
                                    (state) => state.isEdit,
                                  )))
                                    ElevatedButton(
                                      onPressed: () async {
                                        await ref
                                            .read(userInfoProvider.notifier)
                                            .changeUserInfo();
                                        ref
                                            .read(userInfoProvider.notifier)
                                            .toggleEdit();
                                      },
                                      child: Text('Сохранить данные'),
                                    )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: ElevatedButton(
                      onPressed: () {
                        context.push('/auth');
                      },
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
                          Text('Войти в аккаунт')
                        ],
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
                    'development',
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
                    () {
                      ref
                          .watch(organizationProvider.notifier)
                          .fetchOrganizationInfo();

                      context.push('/settings/organization');
                    },
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
            faqList.when(
              error: (err, stack) => Center(
                child: Text('Ошибка: $err'),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              data: (faqL) {
                final faq = faqL.faq ?? [];
                final contacts = faqL.contacts ?? '';

                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 245, 245, 245),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.indigo.withAlpha(100),
                          blurRadius: 10.0,
                          spreadRadius: 4.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: faq.length,
                          itemBuilder: (context, index) => ExpansionTile(
                            backgroundColor: Colors.white,
                            collapsedTextColor: Colors.black,
                            textColor: Color.fromARGB(255, 0, 124, 185),
                            title: Text(
                              '${faq[index].question}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            children: [
                              ListTile(
                                title: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Text(
                                    '${faq[index].answer}',
                                    style: TextStyle(
                                      color: Color.fromARGB(200, 0, 0, 0),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ExpansionTile(
                          backgroundColor: Colors.white,
                          collapsedTextColor: Colors.black,
                          textColor: Color.fromARGB(255, 0, 124, 185),
                          title: Text(
                            'Не нашли нужный вопрос? Напишите нам в группу',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          children: [
                            ListTile(
                              title: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white54,
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    final Uri uri = Uri.parse(contacts);
                                    await launchUrl(
                                      uri,
                                      mode: LaunchMode
                                          .externalNonBrowserApplication,
                                    );
                                  },
                                  child: Text(
                                    contacts,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 36, 86, 172),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            if (ref.watch(userInfoProvider.select(
                  (state) => state.token,
                )) !=
                'BAD')
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: ElevatedButton(
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
                  onPressed: () async {
                    await ref.read(userInfoProvider.notifier).logout();
                    ref.read(navIndexProvider.notifier).state = 0;
                  },
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
              ),
            ),
          );
        },
      );

  Widget _rowInfoUsers(String name, String info, String fieldKey) {
    return Consumer(
      builder: (context, ref, child) {
        final isEditing = ref.watch(userInfoProvider.select(
          (state) => state.isEdit,
        ));

        final userNotifier = ref.read(userInfoProvider.notifier);
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 7),
          child: Row(
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
                child: isEditing
                    ? _buildEditField(
                        fieldKey,
                        info,
                        userNotifier,
                        name: ref.watch(userInfoProvider.select(
                          (state) => state.firstNameController,
                        )),
                        lastName: ref.watch(userInfoProvider.select(
                          (state) => state.lastNameController,
                        )),
                        patronymic: ref.watch(userInfoProvider.select(
                          (state) => state.patronymicController,
                        )),
                      )
                    : Text(
                        info,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEditField(
    String fieldKey,
    String currentValue,
    UserInfoNotifier authNotifier, {
    TextEditingController? name,
    TextEditingController? lastName,
    TextEditingController? patronymic,
  }) {
    switch (fieldKey) {
      case 'size':
        return _buildDropDown(
          ['xs', 's', 'm', 'l', 'xl', '2xl', '3xl', '4xl', '5xl'],
          currentValue,
          authNotifier.setSize,
        );
      case 'formEducation':
        return _buildDropDown(
          ['очная', 'заочная', 'очно-заочная'],
          currentValue,
          authNotifier.setFormEducation,
        );
      case 'basisEducation':
        return _buildDropDown(
          ['бюджет', 'контракт'],
          currentValue,
          authNotifier.setBasisEducation,
        );
      case 'name':
        return TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: authNotifier.setFirstName,
          controller: name,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.all(8),
            border: OutlineInputBorder(),
          ),
        );
      case 'lastName':
        return TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: authNotifier.setLastName,
          controller: lastName,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.all(8),
            border: OutlineInputBorder(),
          ),
        );
      case 'patronymic':
        return TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: authNotifier.setPatronymic,
          controller: patronymic,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.all(8),
            border: OutlineInputBorder(),
          ),
        );

      default:
        return Text(currentValue);
    }
  }

  Widget _buildDropDown(
      List<String> data, String currentValue, Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      value: currentValue,
      items: data.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
