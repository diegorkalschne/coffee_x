///Model utilizada para tratar os cafés recebidos via API
class CoffeeApiModel {
  CoffeeApiModel.fromWeb(Map data) {
    id = data['id'];
    title = data['title'];
    description = data['description'];
    image = data['image'];
    ingredients = (data['ingredients'] as List).map<String>((e) => e).toList();
  }

  late final int id;
  late final String title;
  late final String description;
  late final String image;
  late final List<String> ingredients;
}
