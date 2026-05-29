import 'package:flutter/widgets.dart';
import 'auth_provider.dart';

class AuthProviderScope extends InheritedWidget {
  final AuthProvider auth;

  const AuthProviderScope({
    super.key,
    required this.auth,
    required super.child,
  });

  static AuthProvider of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<AuthProviderScope>();
    return scope!.auth;
  }

  @override
  bool updateShouldNotify(AuthProviderScope oldWidget) => false;
}