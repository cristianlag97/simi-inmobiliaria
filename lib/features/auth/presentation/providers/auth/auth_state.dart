part of 'auth.dart';

enum AuthStatus { checking, authenticated, register, notAuthenticated }

class AuthState {
  AuthState({
    this.authStatus = AuthStatus.checking,
    this.user,
    this.errorMessage = '',
    this.isCompany = false,
    this.isShowError = false,
  });

  final AuthStatus authStatus;
  final UserEntity? user;
  final String errorMessage;
  final bool isCompany;
  final bool isShowError;

  AuthState copyWith({
    AuthStatus? authStatus,
    UserEntity? user,
    String? errorMessage,
    bool? isCompany,
    bool? isShowError,
  }) => AuthState(
    authStatus: authStatus ?? this.authStatus,
    user: user ?? this.user,
    errorMessage: errorMessage ?? this.errorMessage,
    isCompany: isCompany ?? this.isCompany,
    isShowError: isShowError ?? this.isShowError,
  );
}
