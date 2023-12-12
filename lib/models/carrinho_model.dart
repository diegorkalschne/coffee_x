import 'coffee_model.dart';

///Model utilizada apenas na tela do carrinho de compras
///
///Função principal é permitir agrupar os cafés por tipo e calcular o total de cada grupo
class CarrinhoModel {
  CarrinhoModel({
    required this.coffeBase,
    required this.coffees,
  });

  late final CoffeeModel coffeBase; //Apenas para guardar o tipo de café pertencente a lista
  late final List<CoffeeModel> coffees;

  double get total => coffees.length * coffeBase.price;
}
