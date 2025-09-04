part of 'login_form.dart';

// Notificador que maneja el estado del formulario de login
class LoginFormNotifier extends StateNotifier<LoginFormState> {
  // Recibe una función callback para realizar el login
  LoginFormNotifier({required this.loginUserCallback})
    : super(LoginFormState());

  // Callback que recibe usuario y contraseña para intentar el login
  final Function(String, String) loginUserCallback;

  // Método que se llama cuando cambia el campo de usuario
  onUserChange(String value) {
    // Marca el campo usuario como "dirty" (modificado)
    final newUser = UserFormZ.dirty(value);
    // Actualiza el estado con el nuevo usuario y valida el formulario
    state = state.copyWith(
      user: newUser,
      isValid: Formz.validate([newUser, state.password]),
    );
  }

  // Método que se llama cuando cambia el campo de contraseña
  onPasswordChanged(String value) {
    // Marca el campo contraseña como "dirty" (modificado)
    final newPassword = Password.dirty(value);
    // Actualiza el estado con la nueva contraseña y valida el formulario
    state = state.copyWith(
      password: newPassword,
      isValid: Formz.validate([newPassword, state.user]),
    );
  }

  // Método para enviar el formulario
  onFormSubmit() async {
    // Marca todos los campos como "tocados" para mostrar errores si existen
    _touchEveryField();

    // Si el formulario no es válido, no hace nada
    if (!state.isValid) return;

    // Indica que se está enviando el formulario
    state = state.copyWith(isPosting: true);

    // Llama al callback de login con los valores actuales
    await loginUserCallback(state.user.value, state.password.value);

    // Indica que ya terminó el envío
    state = state.copyWith(isPosting: false);
  }

  // Marca todos los campos como "dirty" y valida el formulario
  _touchEveryField() {
    final user = UserFormZ.dirty(state.user.value);
    final password = Password.dirty(state.password.value);

    state = state.copyWith(
      isFormPosted:
          true, // Indica que el formulario fue enviado al menos una vez
      user: user,
      password: password,
      isValid: Formz.validate([user, password]),
    );
  }
}
