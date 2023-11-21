import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:suai_coursework_frontend/features/auth/presentation/view_model/controllers/auth_controller.dart';
import 'package:suai_coursework_frontend/features/auth/presentation/view_model/state_holders/auth_error_state_holder.dart';
import 'package:suai_coursework_frontend/features/auth/presentation/view_model/state_holders/auth_loading_state_holder.dart';
import 'package:suai_coursework_frontend/features/auth/presentation/view_model/state_holders/auth_switch_login_signup_state_holder.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view_model/controller/home_user_controller.dart';
import 'package:suai_coursework_frontend/features/home/presentation/view_model/state_holder/home_user_state_holder.dart';
import 'package:suai_coursework_frontend/services/extensions.dart';
import 'package:suai_coursework_frontend/uikit/app_text_button.dart';
import 'package:suai_coursework_frontend/uikit/app_text_field.dart';

@RoutePage()
class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final error = ref.watch(authErrorStateHolderProvider);
    final loading = ref.watch(authLoadingStateHolderProvider);
    final isLogin = ref.watch(authSwitchLoginSignupStateHolder);
    final usernameController = ref.read(authControllerProvider).usernameController;
    final passwordController = ref.read(authControllerProvider).passwordController;
    final passwordRepeatController = ref.read(authControllerProvider).passwordRepeatController;
    ref.read(authControllerProvider).checkAuthed();
    return Scaffold(
      backgroundColor: context.colors.backgroundPrimary,
      body: Center(
        child: SizedBox(
          width: 255,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/suai.svg',
                width: 94,
              ),
              const SizedBox(
                height: 64,
              ),
              AppTextField(
                hintText: "Логин",
                controller: usernameController,
              ),
              const SizedBox(
                height: 13,
              ),
              AppTextField(
                hintText: "Пароль",
                obscureText: true,
                controller: passwordController,
              ),
              if (!isLogin)
              const SizedBox(
                height: 13,
              ),
              if (!isLogin)
                AppTextField(
                  hintText: "Повторите пароль",
                  obscureText: true,
                  controller: passwordRepeatController,
                ),
              const SizedBox(
                height: 8,
              ),
              Text(
                error ?? '',
                style: context.textStyles.error,
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextButton(
                text: isLogin ? "Войти" : "Создать аккаунт",
                onTap: () {
                  //TODO do something with wipe user data logic
                  ref.invalidate(homeUserStateHolderProvider);
                  ref.invalidate(homeUserControllerProvider);
                  if (isLogin) {
                    ref.read(authControllerProvider).auth();
                  } else {
                    ref.read(authControllerProvider).signup();
                  }
                },
                loading: loading,
              ),
              SizedBox(
                height: isLogin ? 113 : 60,
              ),
              InkWell(
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  ref.read(authControllerProvider).switchLoginSignup();
                },
                child: Text(
                  isLogin
                      ? 'Нет аккаунта? Зарегистрироваться'
                      : 'Уже есть аккаунт? Войти',
                  style: context.textStyles.subtitle4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
