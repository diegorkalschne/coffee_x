import 'package:flutter/material.dart';

import '../../constants/enums.dart';
import '../../widgets/entre_em_contato_widget.dart';
import '../../widgets/footer_widget.dart';
import '../../widgets/header_widget.dart';

///Tela de "Equipamentos"
class EquipamentosView extends StatefulWidget {
  const EquipamentosView({super.key});

  @override
  State<EquipamentosView> createState() => _EquipamentosViewState();
}

class _EquipamentosViewState extends State<EquipamentosView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(title: 'Equipamentos', menuSelected: MenuOption.equipamentos.indexOption),
            const SizedBox(height: 100),
            const EntreEmContatoWidget(
              title: 'O Melhor Você Encontra Aqui',
              description: '           Você já sonhou em possuir equipamentos de café tão incríveis que parecem ter sido forjados nas profundezas das fornalhas dos dragões? Prepare-se para adentrar um universo mágico de sabores e experiências sensoriais inigualáveis. Nossos equipamentos, verdadeiros artefatos lendários, foram projetados por mestres artesãos, utilizando tecnologias ancestrais e conhecimentos arcanos. Cada moedor, máquina de espresso e aeropress é encantado com a magia do melhor café, transformando a simples preparação em uma autêntica batalha pelo paladar perfeito. Descubra uma nova dimensão de aroma e sabor, onde cada xícara vira uma jornada em busca do máximo prazer sensorial. Equipado com essas ferramentas sagradas, você se tornará o verdadeiro herói do café, conquistando o poder de despertar e encantar a todos com suas habilidades baristas. Aventure-se neste universo fascinante, onde a excelência do café se une à magia dos equipamentos, e deixe-se envolver pela fantasia sensorial que só os melhores equipamentos de café podem proporcionar!',
            ),
            const SizedBox(height: 100),
            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}
