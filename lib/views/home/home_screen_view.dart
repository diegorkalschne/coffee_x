import 'package:flutter/material.dart';

import '../../constants/assets/assets_path.dart';
import '../../constants/enums.dart';
import '../../constants/routes/local_routes.dart';
import '../../main.dart';
import '../../models/coffee_model.dart';
import '../../widgets/cs_elevated_button.dart';
import '../../widgets/cs_icon.dart';
import '../../widgets/footer_widget.dart';
import '../../widgets/header_widget.dart';
import '../../widgets/main_coffee_widget.dart';
import '../../widgets/products_show_widget.dart';

///Tela inicial da aplicação
class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  late CoffeeModel selectedCoffee; //Armazena o atual café selecionado

  //Lista de produtos que é exibido na página inicial
  final products = [
    CoffeeModel(id: 0, name: 'Black Coffee X', description: 'Apresentamos a você o néctar dos grãos cuidadosamente selecionados: nosso Café Preto Premium. Cada gole é uma jornada sensorial rumo à perfeição do sabor e ao despertar dos sentidos.', image: AssetsPath.COFFEE_MAIN, price: 10),
    CoffeeModel(id: 1, name: 'Combo Café Gelado', description: 'Gosta da sensação única que o inverno proporciona? Reviva momentos inesquecíveis agora com o nosso super Combo Gelado', image: AssetsPath.COFFEE_ONE, price: 15),
    CoffeeModel(id: 2, name: 'Coffee Cream', description: 'Cremosidade é a sua praia? Ama café? Caso a resposta seja positiva para as duas perguntas, o Coffee Cream é perfeito para você', image: AssetsPath.COFFEE_TWO, price: 20),
    CoffeeModel(id: 3, name: 'Coffee Canela', description: 'Faltou até descrição para este cafezinho. Experimente agora o doce aroma que só a canela no Coffee pode te oferecer', image: AssetsPath.COFFEE_THREE, price: 12),
  ];

  @override
  void initState() {
    super.initState();

    selectedCoffee = products.first;
  }

  ///Método para adicionar um café ao carrinho de compras
  void onShopAdd(CoffeeModel coffee) {
    setState(() {
      shopProducts.add(coffee);
    });
  }

  ///Método para selecionar um café e ele aparecer como café principal no site
  void onSelectCoffee(CoffeeModel coffee, int index) {
    if (coffee.name == selectedCoffee.name) return;

    setState(() {
      selectedCoffee = coffee;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(
              menuSelected: MenuOption.inicio.indexOption,
              children: [
                //Exibição do café selecionado
                Positioned(
                  top: 120,
                  left: 0,
                  right: 0,
                  child: MainCoffeeWidget(
                    coffee: selectedCoffee,
                    onShopAdd: onShopAdd,
                  ),
                ),
                //Exibição da lista de produtos disponíveis
                Positioned(
                  bottom: -120,
                  child: ProductsShowWidget(
                    products: products,
                    onSelect: onSelectCoffee,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 200),
            const _SectionCardHistory(), //Seção do card de "Viaje num universo de aromas e sabores"
            const SizedBox(height: 50),
            const _SectionInsumos(), //Seção da parte de insumos e equipamentos
            const SizedBox(height: 100),
            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}

class _SectionCardHistory extends StatefulWidget {
  const _SectionCardHistory();

  @override
  State<_SectionCardHistory> createState() => _SectionCardHistoryState();
}

class _SectionCardHistoryState extends State<_SectionCardHistory> {
  Widget _rowIcon(String icon, String text) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CsIcon.medium(asset: icon, color: theme.colorScheme.secondary),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 30,
                color: theme.colorScheme.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(AssetsPath.BACKGROUND_HISTORY),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30).copyWith(bottom: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Viaje num universo de aromas e sabores',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 50,
                    color: theme.colorScheme.tertiary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                '    Adentre o fascinante mundo do café, onde cada xícara é uma aventura sensorial que cativa todos os seus sentidos. Dos mais distantes campos de cultivo aos momentos preciosos em que você saboreia, o café é uma experiência que transcende o simples ato de beber. É um mergulho profundo em uma sinfonia de aromas e sabores, uma dança complexa que transforma cada gole em uma jornada única.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 30,
                  color: theme.colorScheme.secondary,
                ),
              ),
              const SizedBox(height: 5),
              _rowIcon(AssetsPath.CHA, 'Aromas que Contam Histórias'),
              _rowIcon(AssetsPath.CORACAO, 'Sabores que Despertam Emoções'),
              _rowIcon(AssetsPath.AVENTURAS, 'Um Convite à Exploração'),
              _rowIcon(AssetsPath.XICARA, 'O Café é uma Arte Viva'),
              const SizedBox(height: 10),
              CsElevatedButton(
                label: 'Conheça Nossos Insumos',
                icon: const CsIcon.medium(asset: AssetsPath.SHOP),
                isBold: true,
                size: 50,
                onTap: () {
                  Navigator.pushNamed(context, LocalRoutes.COFFEE);
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionInsumos extends StatefulWidget {
  const _SectionInsumos();

  @override
  State<_SectionInsumos> createState() => _SectionInsumosState();
}

class _SectionInsumosState extends State<_SectionInsumos> {
  Widget _item(String image, String text, VoidCallback onTap) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Image.asset(
                AssetsPath.PRATO,
                width: 300,
                height: 300,
              ),
              Image.asset(
                image,
                width: 300,
                height: 300,
              ),
            ],
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: theme.colorScheme.secondary,
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            'Muito mais do que apenas um café',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 50,
              color: theme.colorScheme.tertiary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: _item(AssetsPath.INSUMO_ONE, 'Insumos de Café', () {
                Navigator.pushNamed(context, LocalRoutes.COFFEE);
              }),
            ),
            Expanded(
              child: _item(AssetsPath.INSUMO_TWO, 'Máquinas de Café', () {
                Navigator.pushNamed(context, LocalRoutes.EQUIPAMENTOS);
              }),
            ),
            Expanded(
              child: _item(AssetsPath.INSUMO_THREE, 'Produtos Personalizados', () {
                Navigator.pushNamed(context, LocalRoutes.EQUIPAMENTOS);
              }),
            ),
          ],
        ),
      ],
    );
  }
}
