import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';

final AppRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/push-datails/:messageID',
    builder: (context, state) =>
        DetailsScreen(pushMessageID: state.pathParameters['messageID'] ?? ''),
  )
]);

