import '../interfaces/icoffee.dart';
import '../models/coffee_api_model.dart';
import '../repositories/coffee_repository.dart';

///Controller para os 'Cafés', utilizando a implementação da classe 'ICoffee' como forma de "contrato"
class CoffeeController implements ICoffee {
  @override
  Future<List<CoffeeApiModel>> fetchCoffess() async {
    final response = await CoffeeRepository.fetchCoffess();

    List data = response; //Lista de cafés recebidas da API

    return data.map((e) => CoffeeApiModel.fromWeb(e)).toList(); //Faz um map convertendo para CoffeeApiModel e retorna uma lista
  }
}
