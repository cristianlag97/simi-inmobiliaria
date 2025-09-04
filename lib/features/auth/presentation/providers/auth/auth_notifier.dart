part of 'auth.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier({
    required this.authDataRepository,
    required this.keyValueStorageService,
  }) : super(AuthState()) {
    checkAuthStatus();
  }

  final AuthRepository authDataRepository;
  final KeyValueStorageServiceImpl keyValueStorageService;

  Future<void> loginUser(String user, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final userLogin = await authDataRepository.login(
        user: user,
        password: password,
      );
      _setLoggerUser(userLogin);
    } on CustomError catch (e) {
      log('Error: ==> ${e.message}');
      state = state.copyWith(errorMessage: e.message, isShowError: true);
      logout(e.message);
    } catch (e) {
      state = state.copyWith(
        errorMessage: 'Error no controlado',
        isShowError: true,
      );
      log('Error XD $e');
      logout('Error no controlado');
    }
  }

  void checkAuthStatus() async {
    final token = await keyValueStorageService.getValue<String>('token');

    if (token == null) return logout();

    try {
      final user = await authDataRepository.checkAuthStatus(token);
      _setLoggerUser(user);
    } catch (e) {
      logout();
    }
  }

  void _setLoggerUser(
    UserEntity user, {
    bool isRegister = false,
    bool isCompany = false,
  }) async {
    await keyValueStorageService.setKeyValue('token', user.token);
    state = state.copyWith(
      user: user,
      errorMessage: '',
      authStatus: isRegister ? AuthStatus.register : AuthStatus.authenticated,
      isCompany: isCompany,
    );
    AppRoutes.router.goNamed(PAGES.home.screenName, extra: user);
  }

  void changeShowError() {
    state = state.copyWith(isShowError: false);
  }

  Future<void> logout([String? errorMessage]) async {
    await keyValueStorageService.removeKey('token');
    state = state.copyWith(
      authStatus: AuthStatus.notAuthenticated,
      user: null,
      errorMessage: errorMessage,
    );
  }
}
