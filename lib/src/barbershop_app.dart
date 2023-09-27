import 'package:asyncstate/asyncstate.dart';
import 'package:curso_dw_barbershop/src/core/ui/barbershop_thema.dart';
import 'package:curso_dw_barbershop/src/core/ui/widgets/barbersho_loader.dart';
import 'package:curso_dw_barbershop/src/features/auth/login/login_page.dart';
import 'package:curso_dw_barbershop/src/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

class BarbershopApp extends StatelessWidget {
  const BarbershopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncStateBuilder(
        customLoader: const BarbershoLoader(),
        builder: (asyncNavigatorObserver) {
          return MaterialApp(
            theme: BarbershopThema.themeData,
            navigatorObservers: [asyncNavigatorObserver],
            title: 'Curso DW Barber Shop',
            routes: {
              '/': (_) => const SplashPage(),
              '/auth/login' :(_) => const  LoginPage(),
            },
          );
        });
  }
}
