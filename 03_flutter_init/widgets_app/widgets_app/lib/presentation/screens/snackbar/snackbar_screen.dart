import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackBarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'OK', onPressed: () {}),
      duration: const Duration(seconds: 2),
    ));
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¿Estas Seguro?'),
        content: const Text(
            'Enim commodo cupidatat do nisi mollit elit ullamco sint velit nisi excepteur fugiat ex dolore. Fugiat magna Lorem dolore adipisicing occaecat proident ex id amet et laboris id. Nulla occaecat pariatur adipisicing ad magna ea. Eiusmod velit aute commodo nulla ullamco sunt eiusmod. Laborum adipisicing enim consectetur consectetur commodo aliquip culpa laboris nisi consequat amet dolor. Ullamco sunt esse fugiat ad quis proident labore voluptate id officia non ut ullamco mollit. Nulla dolore commodo ipsum nulla qui non est adipisicing Lorem nulla Lorem dolore quis.'),
        actions: [
          TextButton(onPressed: () => context.pop(), child: Text('Cancelar')),
          FilledButton(onPressed: () => context.pop(), child: Text('Aceptar'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBars y dialogos'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                      'Irure ex occaecat amet quis. Dolore aliqua deserunt magna nulla magna mollit ex minim incididunt ex. Minim consectetur nostrud ad laboris officia ex ullamco minim esse minim consectetur. Esse cillum ad et sunt enim nulla sit officia ullamco anim nisi consectetur id pariatur.')
                ]);
              },
              child: const Text('Licencias Usadas')),
          FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostrar Dialogo')),
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar SnackBar'),
        onPressed: () => showCustomSnackbar(context),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
