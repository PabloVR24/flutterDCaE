import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register_cubit/register_cubit.dart';

import '../widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Usuario'),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
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

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              label: 'Nombre de Usuario',
              onChanged: (value) {
                registerCubit.usernameChanged(value);
                _formKey.currentState?.validate();
              },
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
              onChanged: (value) {
                registerCubit.emailChanged(value);
                _formKey.currentState?.validate();
              },
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo Requerido';
                if (value.trim().isEmpty) return 'Campo Requerido';
                final emailRegExp = RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                );
                if (!emailRegExp.hasMatch(value)) return 'Correo Invalido';
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              label: 'Contraseña',
              obscureText: true,
              onChanged: (value) {
                registerCubit.passwordChanged(value);
                _formKey.currentState?.validate();
              },
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
                registerCubit.onSubmit();
              },
              label: const Text('Crear Usuario'),
              icon: const Icon(Icons.save),
            )
          ],
        ));
  }
}