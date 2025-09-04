part of 'auth.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = AuthRepositoryImpl();
  final keyValueStorageService = KeyValueStorageServiceImpl.instance;

  return AuthNotifier(
    authDataRepository: authRepository,
    keyValueStorageService: keyValueStorageService,
  );
});
