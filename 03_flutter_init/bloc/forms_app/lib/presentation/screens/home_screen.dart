import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:  [
          ListTile(
            title: const Text('Cubits'),
            subtitle: const Text('Gesto de Estado Simple'),
            trailing: const Icon(Icons.arrow_circle_right_outlined),
            onTap: ()=>{context.push('/cubits')},
          ),
           ListTile(
            title: const Text('Bloc'),
            subtitle: const Text('Gesto de Estado Avanzado'),
            trailing: const Icon(Icons.arrow_circle_right_outlined),
            onTap: ()=>{context.push('/bloc')},
          ),
        ],
      ),
    );
  }
}
