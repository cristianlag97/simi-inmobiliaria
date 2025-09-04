import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simi_inmobiliaria/core/config/constans/constants.dart';
import 'package:simi_inmobiliaria/features/auth/presentation/widgets/custom_input.dart';
import 'package:toastify_flutter/toastify_flutter.dart';
import '../providers/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Imagen de fondo
          Image.asset(
            'assets/images/background.png', // usa aquí la imagen que te dio el cliente
            fit: BoxFit.cover,
          ),
          // Oscurecer ligeramente con un color semitransparente
          Container(color: Colors.black.withValues(alpha: 0.4)),

          // Contenido centrado
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: _LoginForm(),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginForm extends ConsumerStatefulWidget {
  const _LoginForm();

  @override
  ConsumerState<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<_LoginForm> {
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    final loginForm = ref.watch(loginFormProvider);
    final authState = ref.watch(authProvider);

    if (authState.errorMessage.isNotEmpty && authState.isShowError) {
      ToastifyFlutter.error(
        context,
        message: authState.errorMessage,
        position: ToastPosition.top,
        duration: 2,
        style: ToastStyle.flat,
      );
      Future.delayed(const Duration(seconds: 1), () {
        ref.read(authProvider.notifier).changeShowError();
      });
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Logo e identidad
        Image.asset('assets/images/logo.png', height: 150),
        const SizedBox(height: 16),
        const Text(
          'Simi\nGerencial',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 32),

        // Campo usuario
        CustomInput(
          label: 'Usuario',
          errorMessage:
              loginForm.isFormPosted ? loginForm.user.errorMessage : null,
          onChanged: ref.read(loginFormProvider.notifier).onUserChange,
        ),

        const SizedBox(height: 16),

        // Campo contraseña
        CustomInput(
          label: 'Clave de Ingreso',
          isPassword: true,
          obscureText: isPassword,
          onToggleVisibility:
              () => setState(() {
                isPassword = !isPassword;
              }),
          errorMessage:
              loginForm.isFormPosted ? loginForm.password.errorMessage : null,
          onChanged: ref.read(loginFormProvider.notifier).onPasswordChanged,
        ),

        const SizedBox(height: 24),

        // Botón
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: SimiColors.red,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed:
                loginForm.isPosting
                    ? null
                    : () {
                      ref.read(loginFormProvider.notifier).onFormSubmit();
                    },
            child: const Text(
              'INGRESAR',
              style: TextStyle(letterSpacing: 1.2, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
