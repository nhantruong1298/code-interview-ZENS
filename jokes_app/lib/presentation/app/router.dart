import 'package:go_router/go_router.dart';
import 'package:jokes_app/presentation/features/jokes/views/jokes_page.dart';

const initialPath = '/';

final router = GoRouter(routes: [
  GoRoute(
      path: initialPath,
      builder: (context, state) => const JokesPage(),
      routes: const []),
]);
