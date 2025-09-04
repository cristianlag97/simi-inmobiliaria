part of 'login_form.dart';

AutoDisposeStateNotifierProvider<LoginFormNotifier, LoginFormState>
loginFormProvider =
    StateNotifierProvider.autoDispose<LoginFormNotifier, LoginFormState>((ref) {
      final loginUserCallback = ref.watch(authProvider.notifier).loginUser;

      return LoginFormNotifier(loginUserCallback: loginUserCallback);
    });
