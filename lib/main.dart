import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/router.dart';
import 'features/auth/auth_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            routerConfig: router,
          );
        },
      ),
    );
  }
}