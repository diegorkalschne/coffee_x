import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../constants/assets/assets_path.dart';
import '../constants/enums.dart';
import '../constants/routes/local_routes.dart';
import '../main.dart';
import 'cs_icon.dart';

///Widget para controlar o menu de navegação utilizado no header
class MenuNavigation extends StatefulWidget {
  const MenuNavigation({
    required this.items,
    required this.onSelected,
    required this.onShop,
    this.initialSelected,
    super.key,
  });

  final List<MenuOption> items; //Lista de itens a ser exibido no menu
  final void Function(int) onSelected; //Callback para quando uma das opções for selecionada
  final VoidCallback onShop; //Callback para quando clicar no carrinho de compras
  final int? initialSelected; //Controla qual é o menu que deve vir selecionado

  @override
  State<MenuNavigation> createState() => _MenuNavigationState();
}

class _MenuNavigationState extends State<MenuNavigation> {
  int selected = 0; //Controla qual das opções do menu está selecionada, para exibir um indicador

  @override
  void initState() {
    super.initState();

    //Verifica qual das opções deve vir selecionada
    if (widget.initialSelected != null) {
      selected = widget.initialSelected!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Logo da Coffee X
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              onTap: () {
                //Permite clicar na logo e voltar pra home
                String currentRoute = ModalRoute.of(context)!.settings.name!;
                if (currentRoute == LocalRoutes.HOME) return; //Evitar duplicação de tela ao navegar

                Navigator.pushNamed(context, LocalRoutes.HOME);
              },
              child: Image.asset(
                AssetsPath.LOGO_COFFEX,
                width: 100,
                height: 100,
              ),
            ),
          ),
          const SizedBox(width: 20),
          //Exibição das opções do menu
          Expanded(
            child: SizedBox(
              height: 40,
              child: ListView.separated(
                itemCount: widget.items.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  final item = widget.items[index];

                  return _MenuItem(
                    title: item.title,
                    index: index,
                    selected: selected == index,
                    onSelect: (option) {
                      setState(() {
                        selected = option;
                      });

                      widget.onSelected(option);
                    },
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(width: 20),
              ),
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              //Botão do carrinho de compras
              InkWell(
                onTap: widget.onShop,
                child: CsIcon.medium(
                  asset: AssetsPath.SHOP,
                  color: theme.primaryColor,
                ),
              ),
              //Badge para exibir a quantidade de itens no carrinho de compras
              Positioned(
                right: -10,
                top: -10,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 12,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      shopProducts.length > 99 ? '99+' : '${shopProducts.length}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: shopProducts.length > 99 ? 12 : 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//Classe privada auxiliar para ajudar na construção do menu
class _MenuItem extends StatefulWidget {
  const _MenuItem({
    required this.title,
    required this.index,
    required this.selected,
    required this.onSelect,
  });

  final String title;
  final int index;
  final bool selected;
  final void Function(int) onSelect;

  @override
  State<_MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<_MenuItem> {
  double underlineWidth = 0; //Largura que deverá ter o container com o sublinhado de selecionado
  final key = GlobalKey(); //Utilizado para capturar a RenderBox do Widget

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      //Obter o tamnho real do Widget através da sua RenderBox, utilizado para definir o comprimento (largura) que deverá ter o sublinhado de selecionado
      final renderBox = key.currentContext!.findRenderObject() as RenderBox;

      setState(() {
        underlineWidth = renderBox.size.width;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: () => widget.onSelect(widget.index),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          //Exibição do texto da opção do menu (início, cafés,...)
          Text(
            widget.title,
            key: key,
            style: TextStyle(
              color: widget.selected ? theme.colorScheme.tertiary : theme.primaryColor,
              fontSize: 25,
            ),
          ),
          //Indicação do sublinhado de selecionado. Só fica visível para o item atualmente selecionado
          Visibility(
            visible: widget.selected,
            child: Container(
              width: underlineWidth,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.5,
                  color: theme.colorScheme.tertiary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
