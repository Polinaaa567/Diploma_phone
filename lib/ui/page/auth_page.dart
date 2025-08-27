import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

import 'package:volunteering_kemsu/core/providers/user_info_provider.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final login = ref.watch(userInfoProvider.select((state) => state.login));

    final passwd = ref.watch(userInfoProvider.select((state) => state.password));

    final passwdRepair = ref.watch(userInfoProvider.select(
      (state) => state.passwordRepair,
    ));

    final loginController = ref.read(userInfoProvider.select(
      (state) => state.loginController,
    ));

    final passwordRepairController = ref.read(userInfoProvider.select(
      (state) => state.repeatPasswordController,
    ));

    final errorMessageLogin = ref.watch(userInfoProvider.select(
      (state) => state.errorMessageLogin,
    ));

    final errorMessagePasswd = ref.watch(userInfoProvider.select(
      (state) => state.errorMessagePassword,
    ));

    final errorMessagePasswdRepair = ref.watch(userInfoProvider.select(
      (state) => state.errorMessagePasswordRepair,
    ));

    final isAuth = ref.watch(userInfoProvider.select((state) => state.isAuth));

    return Scaffold(
      backgroundColor: Color.fromARGB(84, 222, 248, 251),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50, bottom: 30),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 74, 175, 240),
                        Color.fromARGB(255, 70, 122, 239),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Color.fromARGB(82, 25, 96, 184),
                      width: 1.5,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                    child: FaIcon(
                      FontAwesomeIcons.userShield,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              'Войдите в свой аккаунт',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color.fromARGB(254, 52, 61, 147),
              ),
            ),
            _input(
              label: 'Имя пользователя',
              onChanged: ref.read(userInfoProvider.notifier).setLogin,
              controller: loginController,
              errorText: errorMessageLogin,
              icon: FontAwesomeIcons.solidUser,
              maxLength: 20,
            ),
            _input(
              label: 'Пароль',
              onChanged: ref.read(userInfoProvider.notifier).setPassword,
              obscureText: ref.watch(userInfoProvider.select(
                (state) => state.passwordVisible,
              )),
              icon: FontAwesomeIcons.lock,
              errorText: errorMessagePasswd,
              iconVisibleWidget: IconButton(
                onPressed: () {
                  ref.read(userInfoProvider.notifier).changePasswordVisible();
                },
                icon: Icon(
                  ref.watch(
                    userInfoProvider.select(
                      (state) => state.passwordVisible,
                    ),
                  )
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
              ),
            ),
            if (!isAuth)
              _input(
                label: 'Повторите пароль',
                controller: passwordRepairController,
                onChanged: ref.read(userInfoProvider.notifier).setPasswordRepair,
                obscureText: ref.watch(userInfoProvider.select(
                  (state) => state.passwordRepairVisible,
                )),
                errorText: errorMessagePasswdRepair,
                icon: FontAwesomeIcons.lock,
                iconVisibleWidget: IconButton(
                  onPressed: () {
                    ref
                        .read(userInfoProvider.notifier)
                        .changePasswordRepairVisible();
                  },
                  icon: Icon(
                    ref.watch(
                      userInfoProvider.select(
                        (state) => state.passwordRepairVisible,
                      ),
                    )
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsets.only(
                top: 40,
                left: 15,
                right: 15,
              ),
              child: GestureDetector(
                onTap: () async {
                  if (isAuth) {
                    if (errorMessageLogin == null &&
                        login != '' &&
                        errorMessagePasswd == null &&
                        passwd != '') {
                      try {
                        final success =
                            await ref.read(userInfoProvider.notifier).login();
                        if (success) {
                          await ref
                              .read(userInfoProvider.notifier)
                              .receiveUserInfo();

                          if (context.mounted) {
                            context.pop('/settings');
                          }
                        } else {
                          final message = ref.read(
                              userInfoProvider.select((state) => state.message));
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Ошибка: $message')),
                            );
                          }
                        }
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Произошла ошибка: $e')),
                          );
                        }
                      }

                      if (ref.read(userInfoProvider.select(
                            (state) => state.token,
                          )) !=
                          'BAD') {
                        ref.read(userInfoProvider.notifier).receiveUserInfo();
                        context.pop('/settings');
                      } else {

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Ошибка: ${ref.watch(
                              userInfoProvider.select(
                                (state) => state.message,
                              ),
                            )}'),
                          ),
                        );
                      }
                      ;
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Введите все данные'),
                      ));
                    }
                  } else {
                    if (login != '' &&
                        passwd != '' &&
                        passwdRepair != '' &&
                        errorMessageLogin == null &&
                        errorMessagePasswd == null &&
                        errorMessagePasswdRepair == null) {
                      ref.read(userInfoProvider.notifier).register();
                      if (ref.watch(userInfoProvider.select(
                            (state) => state.token,
                          )) !=
                          'BAD') {
                        ref.read(userInfoProvider.notifier).receiveUserInfo();
                        context.push('/settings');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text('Ошибка: ${ref.watch(userInfoProvider.select(
                            (state) => state.message,
                          ))}'),
                        ));
                      }
                    } else {
                      Logger().d(login);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Введите все данные'),
                      ));
                    }
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 67, 96, 237),
                        Color.fromARGB(255, 58, 16, 167),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        Icons.login,
                        color: Colors.white,
                      ),
                      SizedBox(width: 5),
                      Text(
                        isAuth ? 'Войти' : 'Зарегистрироваться',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(isAuth ? 'Ещё нет аккаунта?' : 'Есть аккаунт?'),
                  SizedBox(width: 5),
                  InkWell(
                    onTap: ref.read(userInfoProvider.notifier).isAuth,
                    child: Text(
                      isAuth ? 'Зарегистрироваться' : 'Авторизоваться',
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _input({
    String? label,
    dynamic onChanged,
    bool? obscureText,
    TextEditingController? controller,
    String? errorText,
    IconData? icon,
    Function()? onPressed,
    Widget? iconVisibleWidget,
    int? maxLength,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: 25,
        left: 15,
        right: 15,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
          border: Border.all(
            color: Color.fromARGB(82, 25, 96, 184),
            width: 1.5,
          ),
        ),
        child: TextFormField(
          maxLength: maxLength,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: onChanged,
          obscureText: obscureText ?? false,
          controller: controller,
          decoration: InputDecoration(
            errorText: errorText,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: label,
            icon: FaIcon(icon),
            suffixIcon: iconVisibleWidget,
          ),
        ),
      ),
    );
  }
}
