import 'package:flutter/material.dart';

import '../../constants/enums.dart';
import '../../widgets/entre_em_contato_widget.dart';
import '../../widgets/footer_widget.dart';
import '../../widgets/header_widget.dart';

///Tela de "Parcerias"
class ParceriasView extends StatefulWidget {
  const ParceriasView({super.key});

  @override
  State<ParceriasView> createState() => _ParceriasViewState();
}

class _ParceriasViewState extends State<ParceriasView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(title: 'Parcerias', menuSelected: MenuOption.parcerias.indexOption),
            const SizedBox(height: 100),
            const EntreEmContatoWidget(
              title: 'Será Um Prazer Ter Você Conosco',
              description: '           Você já pensou em se tornar um parceiro em nossa missão de encantar e satisfazer os amantes do café em todo o mundo? Nossa loja oferece uma grande variedade de produtos e equipamentos de café de alta qualidade, projetados para surpreender e satisfazer os paladares mais exigentes. Somos uma equipe de especialistas em cafés, apaixonados por descobrir os melhores grãos e equipamentos que o mundo tem a oferecer. Temos o compromisso de levar a satisfação do café não apenas a nossos clientes, mas também a parceiros que compartilham nossos valores e visão. Se você é um amante do café, um fornecedor de grãos ou um especialista em equipamentos de café, nós queremos trabalhar com você para levar a nossa missão ainda mais longe. Juntos, podemos criar uma comunidade de amantes do café, unidos em nossa busca incansável pela perfeição. Entre em contato conosco e juntos, vamos criar uma experiência de café única e memorável.',
            ),
            const SizedBox(height: 100),
            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}
