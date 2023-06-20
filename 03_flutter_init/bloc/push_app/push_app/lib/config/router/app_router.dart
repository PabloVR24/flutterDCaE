import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';

final AppRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  )
]);
