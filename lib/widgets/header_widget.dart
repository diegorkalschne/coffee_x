import 'package:flutter/material.dart';

import '../constants/assets/assets_path.dart';
import '../constants/enums.dart';
import '../constants/routes/local_routes.dart';
import 'menu_navigation.dart';

///Widget reaproveitável do Header (cabeçalho) das páginas da aplicação
///
///Exibe os menus e o carrinho de compra, a navegação principal do site é feita através dele
class HeaderWidget extends StatefulWidget {
  const HeaderWidget({
    this.children,
    this.title,
    this.menuSelected,
    super.key,
  })  : assert(children != null || title != null, 'Informe um children ou um title'),
        assert(children == null || title == null, 'Informe apenas children ou apenas title');

  ///Possível lista de Widgets a serem exibidas no header
  final List<Widget>? children;

  ///Título a ser exibido no header
  final String? title;

  ///Qual das opções do menu está selecionada
  final int? menuSelected;

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  //Opções do menu de navegação
  final menuOptions = [MenuOption.inicio, MenuOption.cafe, MenuOption.equipamentos, MenuOption.parcerias, MenuOption.sobre];

  ///Método responsável por realizar a navegação entre telas, conforme a opção selecionada no menu
  void onMenuSelected(index) {
    String currentRoute = ModalRoute.of(context)!.settings.name!;
    String? route;

    if (index == MenuOption.inicio.indexOption) {
      route = LocalRoutes.HOME;
    } else if (index == MenuOption.cafe.indexOption) {
      route = LocalRoutes.COFFEE;
    } else if (index == MenuOption.equipamentos.indexOption) {
      route = LocalRoutes.EQUIPAMENTOS;
    } else if (index == MenuOption.parcerias.indexOption) {
      route = LocalRoutes.PARCERIAS;
    } else if (index == MenuOption.sobre.indexOption) {
      route = LocalRoutes.SOBRE;
    }

    //Vericação para evitar rotas inválidas e rotas duplicadas
    if (route != null && route != currentRoute) {
      Navigator.pushNamed(context, route);
    }
  }

  ///Navegar para o carrinho de compras
  void onShopSelected() {
    String currentRoute = ModalRoute.of(context)!.settings.name!;
    if (currentRoute == LocalRoutes.SHOP) return; //Evitar duplicação de tela ao navegar

    Navigator.pushNamed(context, LocalRoutes.SHOP);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 700,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsPath.BACKGROUND_IMAGE),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 30,
            spreadRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          MenuNavigation(
            items: menuOptions,
            onSelected: onMenuSelected,
            onShop: onShopSelected,
            initialSelected: widget.menuSelected,
          ),
          if (widget.children != null) ...[
            ...widget.children!, //Utilização de spread operator para poder adicionar os "vários" widgets que a lista pode ter
          ],
          if (widget.title != null) ...[
            Center(
              child: Text(
                widget.title!,
                style: TextStyle(
                  fontSize: 100,
                  color: theme.primaryColor,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
