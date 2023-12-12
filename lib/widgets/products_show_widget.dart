import 'package:flutter/material.dart';

import '../constants/assets/assets_path.dart';
import '../models/coffee_model.dart';

///Widget utilizado para exibir a lista de produtos (cafés) disponíveis para compra no site
class ProductsShowWidget extends StatefulWidget {
  const ProductsShowWidget({
    required this.products,
    required this.onSelect,
    super.key,
  });

  final List<CoffeeModel> products; //Lista de produtos a ser exibida
  final void Function(CoffeeModel, int) onSelect; //Ao selecionar um produto

  @override
  State<ProductsShowWidget> createState() => _ProductsShowWidgetState();
}

class _ProductsShowWidgetState extends State<ProductsShowWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //Transforma a lista em um map para ser possível saber o indíce através da 'key'
        children: widget.products.asMap().entries.map((entry) {
          final index = entry.key;
          final product = entry.value;

          return SizedBox(
            width: MediaQuery.of(context).size.width / 4,
            child: InkWell(
              onTap: () => widget.onSelect(product, index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Image.asset(
                        AssetsPath.PRATO,
                        width: 250,
                        height: 250,
                      ),
                      //Imagem do café
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 10,
                        child: Image.asset(
                          product.image,
                          width: 300,
                          height: 300,
                        ),
                      ),
                    ],
                  ),
                  //Nome do café
                  Flexible(
                    child: Text(
                      product.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
