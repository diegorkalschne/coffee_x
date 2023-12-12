import 'package:flutter/material.dart';

import '../../models/coffee_api_model.dart';
import '../cs_circular_progress_indicador.dart';

///Card utilizado para exibir os itens de cafés vindo da API
class CardCoffeeApi extends StatelessWidget {
  const CardCoffeeApi({
    required this.coffee,
    super.key,
  });

  final CoffeeApiModel coffee; //Café a ser exibido

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: theme.primaryColor,
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                coffee.image,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
                //Exibição de loading da imagem
                loadingBuilder: (_, child, chuck) {
                  if (chuck == null) {
                    return child;
                  }

                  return const SizedBox(
                    height: 150,
                    width: 150,
                    child: CsCircularProgressIndicador.dark(),
                  );
                },
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Nome do café
                  Text(
                    coffee.title,
                    style: TextStyle(
                      fontSize: 22,
                      color: theme.colorScheme.tertiary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  //Descrição do café
                  Text(
                    coffee.description,
                    style: TextStyle(
                      fontSize: 18,
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Ingredientes:',
                    style: TextStyle(
                      fontSize: 18,
                      color: theme.colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //Lista de ingredientes
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: coffee.ingredients.length,
                    itemBuilder: (_, index) {
                      final ingredient = coffee.ingredients[index];

                      return Text(
                        '- $ingredient',
                        style: TextStyle(
                          fontSize: 16,
                          color: theme.colorScheme.secondary,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
