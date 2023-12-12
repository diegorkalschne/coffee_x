import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/assets/assets_path.dart';
import '../../main.dart';
import '../../models/carrinho_model.dart';
import '../../models/coffee_model.dart';
import '../../utils/function_utils.dart';
import '../../widgets/cards/card_coffee_shop.dart';
import '../../widgets/cs_elevated_button.dart';
import '../../widgets/cs_icon.dart';
import '../../widgets/footer_widget.dart';
import '../../widgets/header_widget.dart';

///Tela responsável por exibir o carrinho de compras do usuário, informar o total e realizar a compra
class CarrinhoView extends StatefulWidget {
  const CarrinhoView({super.key});

  @override
  State<CarrinhoView> createState() => _CarrinhoViewState();
}

class _CarrinhoViewState extends State<CarrinhoView> {
  List<CarrinhoModel> products = []; //Lista de produtos agrupado por tipo

  @override
  void initState() {
    super.initState();

    //Inicia verificando os produtos que estão no carrinho, para agrupá-los por tipo de produto
    _checkProducts();
  }

  ///Verifica todos os itens do carrinho e agrupa por tipo de café
  void _checkProducts() {
    for (var coffee in shopProducts) {
      if (!products.any((element) => element.coffeBase.id == coffee.id)) {
        //Caso não contenha nenhum café desse tipo na lista

        final coffessType = shopProducts.where((element) => element.id == coffee.id).toList(); //Busca todos os cafés do mesmo tipo (por ID)
        final carrinho = CarrinhoModel(coffeBase: coffee, coffees: coffessType);

        products.add(carrinho);
      }
    }
  }

  ///Ações ao confirmar a compra
  void _onBuy() async {
    final theme = Theme.of(context);

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Compra Confirmada',
            style: TextStyle(
              fontSize: 22,
              color: theme.colorScheme.tertiary,
            ),
          ),
          content: Text.rich(
            TextSpan(
              children: [
                const TextSpan(text: 'Parabéns, sua compra foi confirmada.\nAnote o número do seu pedido: '),
                TextSpan(
                  text: '#${Random().nextInt(999)}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: '\n\nCoffee X agradece a preferência!'),
              ],
            ),
            style: TextStyle(
              fontSize: 18,
              color: theme.colorScheme.secondary,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Fechar',
                style: TextStyle(color: theme.colorScheme.tertiary, fontSize: 18),
              ),
            ),
          ],
        );
      },
    );

    setState(() {
      shopProducts.clear();
      products.clear();
    });
  }

  ///Método para remover um grupo de cafés do carrinho
  void _onRemoveCoffee(CoffeeModel coffee) {
    products.removeWhere((element) => element.coffeBase == coffee);
    shopProducts.removeWhere((element) => element.id == coffee.id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(title: 'Carrinho de Compras', menuSelected: -1, key: UniqueKey()), //Opção '-1' para não mostrar nada selecionado no menu
            const SizedBox(height: 100),

            if (products.isNotEmpty) ...[
              Text(
                'Total: ${realFormatCurrency(products.fold<double>(0.0, (previousValue, element) => previousValue + element.total))}',
                style: TextStyle(
                  fontSize: 50,
                  color: theme.colorScheme.tertiary,
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (_, index) {
                  final product = products[index];

                  return CardCoffeeShop(
                    coffee: product.coffeBase,
                    totalPrice: product.total,
                    count: product.coffees.length,
                    onRemove: _onRemoveCoffee,
                  );
                },
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: CsElevatedButton(
                  label: 'Confirmar Compra',
                  size: 40,
                  onTap: _onBuy,
                  icon: const CsIcon.medium(asset: AssetsPath.SHOP),
                ),
              ),
            ] else ...[
              Center(
                child: Column(
                  children: [
                    Text(
                      'O carrinho de compras está vazio',
                      style: TextStyle(
                        fontSize: 50,
                        color: theme.colorScheme.tertiary,
                      ),
                    ),
                    SvgPicture.asset(AssetsPath.SHOP_CART),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 100),
            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}
