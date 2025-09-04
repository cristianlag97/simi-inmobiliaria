part of 'inputs.dart';

// Define input validation errors
enum UserFormZError { empty, less, more }

// Extend FormzInput and provide the input type and error type.
class UserFormZ extends FormzInput<String, UserFormZError> {
  // Call super.pure to represent an unmodified form input.
  const UserFormZ.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const UserFormZ.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == UserFormZError.empty) return 'El campo es requerido';
    if (displayError == UserFormZError.less) return 'Mínimo 4 caracteres';

    if (displayError == UserFormZError.more) {
      return 'Pasaste el límite de carácteres';
    }
    // if()

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  UserFormZError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return UserFormZError.empty;
    if (value.length < 4) return UserFormZError.less;
    if (value.length > 100) return UserFormZError.more;
    return null;
  }
}
