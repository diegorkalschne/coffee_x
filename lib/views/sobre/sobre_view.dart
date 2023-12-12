import 'package:flutter/material.dart';

import '../../constants/enums.dart';
import '../../widgets/entre_em_contato_widget.dart';
import '../../widgets/footer_widget.dart';
import '../../widgets/header_widget.dart';

///Tela de "Sobre"
class SobreView extends StatefulWidget {
  const SobreView({super.key});

  @override
  State<SobreView> createState() => _SobreViewState();
}

class _SobreViewState extends State<SobreView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(title: 'Sobre', menuSelected: MenuOption.sobre.indexOption),
            const SizedBox(height: 100),
            const EntreEmContatoWidget(
              title: 'Conheça Um Pouco Da Nossa História',
              description: '           Há muito tempo atrás, em um reino distante, surgiu uma empresa com uma visão audaciosa: levar a paixão pelo café a todos os cantos do mundo. Fundada por um grupo de amantes do café, nossa empresa nasceu da vontade de compartilhar a magia dessa bebida milenar com as pessoas, e transformar o ato de saborear uma xícara em um momento verdadeiramente especial.\n'
                  '           Nossa missão é proporcionar experiências sensoriais únicas, por meio de uma seleção cuidadosa de grãos de café de origens diversas, que são habilmente torrados por nossos especialistas. Acreditamos que cada xícara de café é mais do que apenas uma bebida - é uma forma de viajar pelo mundo, descobrindo novos sabores e aromas, enquanto apreciamos a arte de preparar um café perfeito.\n'
                  '           Nosso compromisso com a qualidade nos levou a buscar parcerias com produtores locais em diferentes regiões do globo, fomentando o comércio justo e sustentável, além de promover práticas agrícolas responsáveis. Valorizamos o cuidado com o meio ambiente, buscando constantemente reduzir nosso impacto e contribuir para um mundo mais sustentável.\n'
                  '           Nossa empresa é guiada por valores sólidos, como a busca pela excelência, a paixão pelo café e o respeito às pessoas. Valorizamos o trabalho em equipe e a diversidade, reconhecendo que é na união de diferentes habilidades e perspectivas que alcançamos os melhores resultados.\n'
                  '           Estamos comprometidos em oferecer produtos e serviços de alta qualidade, criando uma experiência única para nossos clientes em todos os pontos de contato. Acreditamos que cada pessoa merece desfrutar do prazer de uma xícara de café excepcional, e é isso que nos inspira a cada dia.\n'
                  '           Junte-se a nós nessa jornada mágica do café e descubra o prazer de uma xícara que encanta todos os sentidos. Bem-vindo ao mundo magnífico do café! Bem-vindo a Coffee X!',
              showButton: false,
            ),
            const SizedBox(height: 100),
            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}
