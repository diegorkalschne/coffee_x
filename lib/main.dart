import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'constants/routes/local_routes.dart';
import 'constants/theme/theme_app.dart';
import 'models/coffee_model.dart';
import 'router_app.dart';
import 'widgets/custom_scroll_behavior.dart';
import 'widgets/no_glow_effect.dart';

//Ponto de entrada da aplicação
void main() => runApp(const CoffeXApp());

//Lista de produtos adicionados ao carrinho
//Declara de forma global para facilitar o gerenciamento do estado da aplicação
final List<CoffeeModel> shopProducts = [];

class CoffeXApp extends StatelessWidget {
  const CoffeXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.lightTheme,
      initialRoute: LocalRoutes.HOME,
      title: 'Coffee X',
      color: Colors.brown,
      builder: (context, child) {
        //Sobrescrevendo o builder do MaterialApp para tirar o efeito de glow das listas
        return ScrollConfiguration(
          behavior: const NoGlowEffect(),
          child: child!,
        );
      },
      scrollBehavior: CustomScrollBehavior(),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [Locale('pt', 'BR')],
      onGenerateRoute: RouterApp.onGenerateRoute,
    );
  }
}
