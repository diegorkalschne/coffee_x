import 'package:flutter/material.dart';

import '../../models/coffee_model.dart';
import '../../utils/function_utils.dart';
import '../cs_icon.dart';

///Card utilizado para exibir os cafés comprados, no carrinho de compras
class CardCoffeeShop extends StatelessWidget {
  const CardCoffeeShop({
    required this.coffee,
    required this.totalPrice,
    required this.count,
    required this.onRemove,
    super.key,
  });

  final CoffeeModel coffee; //Tipo do café
  final double totalPrice; //Preço total
  final int count; //Quantidade adicionada
  final void Function(CoffeeModel) onRemove; //Função de callback para remover um café

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: theme.primaryColor,
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Indicação da quantidade de cafés adicionados ao carrinho daquele grupo
            Tooltip(
              message: 'Quantidade comprada',
              child: CircleAvatar(
                backgroundColor: theme.colorScheme.tertiary,
                child: Text(
                  '${count}x',
                  style: TextStyle(
                    color: theme.primaryColor,
                  ),
                ),
              ),
            ),
            Image.asset(coffee.image, width: 150, height: 150),
            const SizedBox(width: 10),
            //Nome do café
            Expanded(
              child: Text(
                coffee.name,
                style: TextStyle(
                  fontSize: 25,
                  color: theme.colorScheme.tertiary,
                ),
              ),
            ),
            //Exibindo o preço total
            Text(
              '${realFormatCurrency(totalPrice)}',
              style: TextStyle(
                fontSize: 25,
                color: theme.colorScheme.tertiary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 10),
            //Botão de remover o grupo de café da lista de produtos adicionados ao carrinho
            Tooltip(
              message: 'Remover café',
              child: InkWell(
                onTap: () => onRemove(coffee),
                borderRadius: BorderRadius.circular(10),
                child: CsIcon.medium(
                  icon: Icons.delete_forever,
                  color: theme.colorScheme.tertiary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
