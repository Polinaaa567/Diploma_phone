import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volunteering_kemsu/core/models/profile/user.dart';

class UserInfoState {
  final UserInfo? user;
  final bool isLoading;
  final String? error;
  final String token;
  final String? message;
  final String login;
  final String password;
  final String passwordRepair;
  final bool passwordVisible;
  final bool passwordRepairVisible;
  final String? errorMessageLogin;
  final String? errorMessagePassword;
  final String? errorMessagePasswordRepair;
  final UserInfo? userProfile;
  final bool isAuth;
  String size;
  String formEducation;
  String basisEducation;

  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController patronymicController = TextEditingController();

  final bool isEdit;

  final AsyncValue<List<UserInfo>> usersRating;
  final int? placeInRating;

  UserInfoState({
    this.isEdit = false,
    this.size = 'xs',
    this.formEducation = 'Очная',
    this.basisEducation = 'Бюджет',
    this.user,
    this.error,
    this.isLoading = false,
    this.password = '',
    this.login = '',
    this.message,
    this.userProfile,
    this.passwordRepair = '',
    this.passwordRepairVisible = true,
    this.passwordVisible = true,
    this.errorMessageLogin,
    this.errorMessagePassword,
    this.errorMessagePasswordRepair,
    TextEditingController? loginController,
    TextEditingController? passwordController,
    this.token = 'BAD',
    TextEditingController? repeatPasswordController,
    this.isAuth = true,
    TextEditingController? firstNameController,
    TextEditingController? lastNameController,
    TextEditingController? patronymicController,
    this.usersRating = const AsyncValue.loading(),
    this.placeInRating = 0,
  })  : loginController = loginController ?? TextEditingController(),
        passwordController = passwordController ?? TextEditingController(),
        repeatPasswordController =
            repeatPasswordController ?? TextEditingController(),
        firstNameController = firstNameController ?? TextEditingController(),
        lastNameController = lastNameController ?? TextEditingController(),
        patronymicController = patronymicController ?? TextEditingController();

  bool get isAuthenticated => user != null && token != 'BAD';

  UserInfoState copyWith({
    UserInfo? user,
    bool? isLoading,
    String? error,
    String? login,
    String? password,
    UserInfo? userProfile,
    String? passwordRepair,
    bool? passwordRepairVisible,
    bool? passwordVisible,
    String? errorMessageLogin,
    String? errorMessagePassword,
    String? token,
    String? message,
    String? errorMessagePasswordRepair,
    TextEditingController? loginController,
    TextEditingController? passwordController,
    TextEditingController? repeatPasswordController,
    TextEditingController? firstNameController,
    TextEditingController? lastNameController,
    TextEditingController? patronymicController,
    bool? isAuth,
    String? size,
    String? formEducation,
    String? basisEducation,
    bool? isEdit,
    AsyncValue<List<UserInfo>>? usersRating,
    int? placeInRating,
  }) {
    return UserInfoState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      login: login ?? this.login,
      password: password ?? this.password,
      userProfile: userProfile ?? this.userProfile,
      passwordRepair: passwordRepair ?? this.passwordRepair,
      passwordRepairVisible:
          passwordRepairVisible ?? this.passwordRepairVisible,
      passwordVisible: passwordVisible ?? this.passwordVisible,
      errorMessageLogin: errorMessageLogin,
      errorMessagePassword: errorMessagePassword,
      errorMessagePasswordRepair: errorMessagePasswordRepair,
      loginController: loginController ?? this.loginController,
      passwordController: passwordController ?? this.passwordController,
      repeatPasswordController:
          repeatPasswordController ?? this.repeatPasswordController,
      token: token ?? this.token,
      message: message ?? this.message,
      isAuth: isAuth ?? this.isAuth,
      firstNameController: firstNameController ?? this.firstNameController,
      lastNameController: lastNameController ?? this.lastNameController,
      patronymicController: patronymicController ?? this.patronymicController,
      size: size ?? this.size,
      formEducation: formEducation ?? this.formEducation,
      basisEducation: basisEducation ?? this.basisEducation,
      isEdit: isEdit ?? this.isEdit,
      usersRating: usersRating ?? this.usersRating,
      placeInRating: placeInRating ?? this.placeInRating,
    );
  }
}
