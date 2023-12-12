import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'constants/assets/assets_path.dart';
import 'constants/routes/local_routes.dart';
import 'views/carrinho/carrinho_view.dart';
import 'views/coffee/coffee_view.dart';
import 'views/equipamentos/equipamentos_view.dart';
import 'views/home/home_screen_view.dart';
import 'views/parcerias/parcerias_view.dart';
import 'views/sobre/sobre_view.dart';
import 'widgets/footer_widget.dart';
import 'widgets/header_widget.dart';

class RouterApp {
  ///Controla o roteamento de toda a aplicação
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LocalRoutes.HOME:
        return _PageBuilder(
          child: const HomeScreenView(),
          settings: settings,
        );

      case LocalRoutes.COFFEE:
        return _PageBuilder(
          child: const CoffeeView(),
          settings: settings,
        );

      case LocalRoutes.EQUIPAMENTOS:
        return _PageBuilder(
          child: const EquipamentosView(),
          settings: settings,
        );

      case LocalRoutes.PARCERIAS:
        return _PageBuilder(
          child: const ParceriasView(),
          settings: settings,
        );

      case LocalRoutes.SOBRE:
        return _PageBuilder(
          child: const SobreView(),
          settings: settings,
        );

      case LocalRoutes.SHOP:
        return _PageBuilder(
          child: const CarrinhoView(),
          settings: settings,
        );

      //Default é utilizado caso a página requisitada não tenha sido encontrada (famoso 404)
      default:
        return _PageBuilder(
          child: const _Page404(),
          settings: settings,
        );
    }
  }
}

class _PageBuilder extends PageRouteBuilder {
  ///Responsável pelo efeito de 'fade transition' entre as transições de telas
  _PageBuilder({
    required this.child,
    required this.settings,
  }) : super(
          settings: settings,
          transitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, secAnimation, child) {
            final fadeAnimation = CurvedAnimation(
              curve: Curves.easeInToLinear,
              reverseCurve: Curves.easeInToLinear,
              parent: animation,
            );

            final theme = Theme.of(context);

            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                children: [
                  Container(color: theme.scaffoldBackgroundColor),
                  FadeTransition(
                    opacity: fadeAnimation,
                    child: child,
                  ),
                ],
              ),
            );
          },
          pageBuilder: (context, animation, secAnimation) => child,
        );

  final Widget child;

  @override
  final RouteSettings settings;
}

///Tela padrão para erros 404 na navegação local do site
class _Page404 extends StatelessWidget {
  const _Page404();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderWidget(title: 'Ops... Página Inexistente', menuSelected: -1),
            const SizedBox(height: 100),
            Center(
              child: Column(
                children: [
                  Text(
                    'A página que você estava procurando infelizmente não existe',
                    style: TextStyle(
                      fontSize: 50,
                      color: theme.colorScheme.tertiary,
                    ),
                  ),
                  SvgPicture.asset(AssetsPath.PAGE_404),
                ],
              ),
            ),
            const SizedBox(height: 100),
            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}
