//! 1 - State del provider

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:teslo_shop/features/shared/infrastructure/inputs/input_full_name.dart';
import 'package:teslo_shop/features/shared/shared.dart';

class RegisterFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final Name name;
  final Email email;
  final Password password;
  final Password passwordRepeat;

  RegisterFormState(
      {this.isPosting = false,
      this.isFormPosted = false,
      this.passwordRepeat = const Password.pure(),
      this.isValid = false,
      this.name = const Name.pure(),
      this.email = const Email.pure(),
      this.password = const Password.pure()});

  RegisterFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    Name? name,
    Email? email,
    Password? password,
    Password? passwordRepeat,
  }) =>
      RegisterFormState(
        isPosting: isPosting ?? this.isPosting,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isValid: isValid ?? this.isValid,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        passwordRepeat: passwordRepeat ?? this.passwordRepeat,
      );

  @override
  String toString() {
    return '''
    LoginFormState: 
    isPosting: $isPosting
    isFormPosted: $isFormPosted
    isValid: $isValid
    name: $name
    email: $email
    password: $password
    passwordRepeat: $passwordRepeat
           ''';
  }
}

//! Como implementamos el notifier
class RegisterFormNotifier extends StateNotifier<RegisterFormState> {
  RegisterFormNotifier() : super(RegisterFormState());

  onNameChanged(String value) {
    final newName = Name.dirty(value);
    state = state.copyWith(
        name: newName,
        isValid: Formz.validate(
            [newName, state.email, state.password, state.passwordRepeat]));
  }

  onEmailChanged(String value) {
    final newEmail = Email.dirty(value);
    state = state.copyWith(
        email: newEmail,
        isValid: Formz.validate(
            [newEmail, state.password, state.name, state.passwordRepeat]));
  }

  onPasswordChange(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
        password: newPassword,
        isValid: Formz.validate(
            [newPassword, state.email, state.name, state.passwordRepeat]));
  }

  onPasswordRepeatChange(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
        passwordRepeat: newPassword,
        isValid: Formz.validate(
            [newPassword, state.email, state.name, state.password]));
  }

  onFormSubmit() {
    _touchEveryField();
    if (!state.isValid) return;
  }

  _touchEveryField() {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    final passwordRepeat = Password.dirty(state.passwordRepeat.value);
    final name = Name.dirty(state.name.value);

    state = state.copyWith(
        isFormPosted: true,
        name: name,
        email: email,
        password: password,
        passwordRepeat: passwordRepeat,
        isValid: Formz.validate([email, password, passwordRepeat, name]));
  }
}
//! StateNotifierProvider - Consume Afuera

final registerFormProvider =
    StateNotifierProvider.autoDispose<RegisterFormNotifier, RegisterFormState>(
        (ref) {
  return RegisterFormNotifier();
});
