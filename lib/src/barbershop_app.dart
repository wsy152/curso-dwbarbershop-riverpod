import 'package:curso_dw_barbershop/src/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

class BarbershopApp extends StatelessWidget {

  const BarbershopApp({ super.key });

   @override
   Widget build(BuildContext context) {
       return MaterialApp(
        title: 'Curso DW Barber Shop',
        routes:  {
          '/' : (_) => const SplashPage()

        },

       );
  }
}