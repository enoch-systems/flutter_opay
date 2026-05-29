import 'package:go_router/go_router.dart';
import '../features/auth/login_screen.dart';
import '../features/wallet/wallet_screen.dart';

import '../features/auth/auth_provider.dart';

final router = GoRouter(
  redirect: (context, state) {
    final auth = AuthProviderScope.of(context); // simple access hook

    final loggedIn = auth.user.isNotEmpty;

    final goingToLogin = state.matchedLocation == '/';

    if (!loggedIn && !goingToLogin) return '/';
    if (loggedIn && goingToLogin) return '/wallet';

    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/wallet',
      builder: (context, state) => const WalletScreen(),
    ),
  ],
);