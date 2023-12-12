import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

///Formatar double para valor monetário em real brasileiro (R$)
String realFormatCurrency(double? value) {
  if (value == null) return '';

  final currencyFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  return currencyFormat.format(value);
}

///Abrir uma URL
///
///Valida se a URL informada é válida e pode ser aberta
Future<void> openUrl(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  }
}
