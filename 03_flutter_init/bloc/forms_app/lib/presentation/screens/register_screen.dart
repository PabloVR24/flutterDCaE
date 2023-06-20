import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Usuario'),
      ),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              FlutterLogo(
                size: 100,
              ),
              SizedBox(
                height: 20,
              ),
              _RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              label: 'Nombre de Usuario',
              onChanged: (value) => username = value,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo Requerido';
                if (value.trim().isEmpty) return 'Campo Requerido';
                if (value.length < 6) return 'Minimo 6 letras';
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              label: 'Correo Electronico',
              onChanged: (value) => email = value,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo Requerido';
                if (value.trim().isEmpty) return 'Campo Requerido';
                final emailRegExp = RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                );
                if(!emailRegExp.hasMatch(value)) return 'Correo Invalido';
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              label: 'Contraseña',
              obscureText: true,
              onChanged: (value) => password = value,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo Requerido';
                if (value.trim().isEmpty) return 'Campo Requerido';
                if (value.length < 6) return 'Minimo 6 letras';
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton.tonalIcon(
              onPressed: () {
                final isValid = _formKey.currentState!.validate();
                if (!isValid) return;
              },
              label: const Text('Crear Usuario'),
              icon: const Icon(Icons.save),
            )
          ],
        ));
  }
}
