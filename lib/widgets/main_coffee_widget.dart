import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../constants/assets/assets_path.dart';
import '../models/coffee_model.dart';
import '../utils/function_utils.dart';
import 'cs_elevated_button.dart';
import 'cs_icon.dart';

///Widget utilizado para exibir, na página inicial, qual é o café que está atualmente selecionado
///
///Exibe também o botão de adicionar ao carrinho, possibilitando a inclusão do item selecionado ao carrinho de compras
class MainCoffeeWidget extends StatelessWidget {
  const MainCoffeeWidget({
    required this.coffee,
    required this.onShopAdd,
    super.key,
  });

  final CoffeeModel coffee; //Café atualmente selecionado
  final void Function(CoffeeModel) onShopAdd; //Callback para quando adicionar o café ao carrinho

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Nome do café
              Text(
                coffee.name,
                style: TextStyle(
                  fontSize: 80,
                  color: theme.primaryColor,
                  shadows: const [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: Offset(5, 0),
                    )
                  ],
                ),
              ),
              //Descrição do café
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  '\t\t\t\t\t${coffee.description}',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                    color: theme.primaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              //Botão de adicionar ao carrinho
              CsElevatedButton(
                label: 'Adicionar ao carrinho',
                onTap: () => onShopAdd(coffee),
                icon: const CsIcon.small(asset: AssetsPath.SHOP),
                hasShadown: true,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 100),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                AssetsPath.PRATO,
                width: 250,
                height: 250,
              ),
              //Exibição da imagem do café selecionado, com uma rotação na sua imagem para ela ficar inclinada
              Positioned(
                top: -140,
                right: -60,
                child: Transform.rotate(
                  angle: (math.pi * -20) / 180,
                  child: Image.asset(
                    coffee.image,
                    width: 400,
                    height: 400,
                  ),
                ),
              ),
              //Preço do café
              Positioned(
                bottom: -80,
                right: -10,
                child: Text(
                  '${realFormatCurrency(coffee.price)}',
                  style: TextStyle(
                    fontSize: 80,
                    color: theme.primaryColor,
                    shadows: const [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: Offset(5, 0),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
