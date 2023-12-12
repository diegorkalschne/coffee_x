import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../constants/assets/assets_path.dart';
import '../../constants/enums.dart';
import '../../controllers/coffee_controller.dart';
import '../../models/coffee_api_model.dart';
import '../../widgets/cards/card_coffee_api.dart';
import '../../widgets/cs_circular_progress_indicador.dart';
import '../../widgets/entre_em_contato_widget.dart';
import '../../widgets/footer_widget.dart';
import '../../widgets/header_widget.dart';
import '../../widgets/nunhuma_informacao.dart';

///Tela utilizada para exibir um texto sobre os cafés oferecidos pela empresa
///
///Busca cafés de uma API externa
class CoffeeView extends StatefulWidget {
  const CoffeeView({super.key});

  @override
  State<CoffeeView> createState() => _CoffeeViewState();
}

class _CoffeeViewState extends State<CoffeeView> {
  List<CoffeeApiModel> coffess = []; //Lista de cafés da API
  bool _hasError = false; //Indica que houve algum erro durante a busca na API
  bool _loading = true; //Controla se a busca da API foi finalizada ou ainda está carregando

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      //Busca os cafés utilizando SchedulerBinding para evitar erros por causa do setState na inicialização da página
      _fetchCoffees();
    });
  }

  ///Busca os cafés vindos da API
  void _fetchCoffees() async {
    try {
      //Reseta o estado atual
      _loading = true;
      _hasError = false;

      //Busca os cafés
      final listCoffees = await CoffeeController().fetchCoffess();

      //Define a nova lista de cafés, caso não tenha dado erro
      coffess = listCoffees;
    } catch (_) {
      _hasError = true;
    } finally {
      _loading = false;
    }

    //Atualiza o estado da página
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Texto fixo da página
            HeaderWidget(title: 'Cafés', menuSelected: MenuOption.cafe.indexOption),
            const SizedBox(height: 100),
            const EntreEmContatoWidget(
              title: 'O Melhor Café Que Você Já Tomou',
              description: '           Você já imaginou começar suas manhãs com um poderoso e revigorante elixir? O café, uma poção mágica destilada nas profundezas das florestas de grãos torrados, possui um incrível aroma que desperta os sentidos e concede àqueles que o consomem a energia necessária para enfrentar os desafios do dia. Seja um aventureiro destemido em busca de uma xícara cheia de sabor e vigor ou um mago cansado necessitando de um estímulo para recarregar suas energias, o café é o aliado perfeito para potencializar suas habilidades. Com seus poderes encantadores, o café irá acelerar seus reflexos, ampliar sua concentração e, com um toque de criatividade, transformar o comum em uma aventura extraordinária. Não perca tempo, aventure-se neste mundo místico do café e descubra o poder que ele tem a lhe oferecer!',
            ),
            const SizedBox(height: 70),

            //Está carregando
            Builder(
              builder: (_) {
                if (_loading) {
                  return const CsCircularProgressIndicador.dark(withMessage: true);
                }

                //Deu erro na API
                if (!_loading && _hasError) {
                  return const NenhumaInformacao(
                    message: 'Aconteceu um erro inesperado ao buscar os cafés e seus produtos. Por favor, tente recarregar a página',
                    imagePath: AssetsPath.ERROR,
                  );
                }

                //Não tem nenhum café para exibir
                if (coffess.isEmpty) {
                  return const NenhumaInformacao(
                    message: 'Não há produtos para exibir',
                    imagePath: AssetsPath.EMPTY,
                  );
                }

                //Exibindo a lista de cafés vindo da API
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: coffess.length,
                  itemBuilder: (_, index) {
                    final coffee = coffess[index];

                    return CardCoffeeApi(coffee: coffee);
                  },
                );
              },
            ),

            const SizedBox(height: 100),
            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}
