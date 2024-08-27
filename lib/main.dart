import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'dashboard.dart';
import 'screens/aritmatika.dart';
import 'screens/keliling_bangun_datar.dart';
import 'screens/luas_permukaan_bangun_ruang.dart';
import 'screens/perpangkatan.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Dashboard(),
      ),
      GoRoute(
        path: '/aritmatika',
        builder: (context, state) => Aritmatika(),
      ),
      GoRoute(
        path: '/keliling-bangun-datar',
        builder: (context, state) => KelilingBangunDatar(),
      ),
      GoRoute(
        path: '/luas-permukaan-bangun-ruang',
        builder: (context, state) => LuasPermukaanBangunRuang(),
      ),
      GoRoute(
        path: '/perpangkatan',
        builder: (context, state) => Perpangkatan(),
      ),
    ],
  );
});

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: goRouter.routerDelegate,
      routeInformationParser: goRouter.routeInformationParser,
      routeInformationProvider: goRouter.routeInformationProvider,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
