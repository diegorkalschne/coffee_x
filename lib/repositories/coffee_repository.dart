import '../constants/routes/web_routes.dart';
import '../services/http_service.dart';

///Repository para fazer as chamadas via API
class CoffeeRepository {
  static Future<List> fetchCoffess() async {
    return await HttpService.get(url: WebRoutes.COFFEES);
  }
}
