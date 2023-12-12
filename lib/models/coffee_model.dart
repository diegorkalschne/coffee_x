///Model principal dos cafés, utilizado na home para exibir os cafés disponíveis (produtos)
///
///Constroí um objeto café
class CoffeeModel {
  CoffeeModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
  });

  late final int id;
  late final String name;
  late final String description;
  late final String image;
  late final double price;
}
