import '../models/coffee_api_model.dart';

///Interface utilizada para controlar a implementação dos métodos necessários, declarados abaixo
abstract class ICoffee {
  ///Utilizado para buscar exemplos (nome, descrição, imagem e ingredientes) de cafés de uma API
  Future<List<CoffeeApiModel>> fetchCoffess();
}
