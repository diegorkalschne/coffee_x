import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Recebe uma `message` e uma `imagePath` e exibe de forma centralizada na tela
///
/// Utilizada para exibir avisos ao usuário
class NenhumaInformacao extends StatelessWidget {
  const NenhumaInformacao({
    required this.message,
    this.imagePath,
    this.actions,
    super.key,
  });

  final String message; //Mensagem a ser exibida
  final String? imagePath; //Imagem a ser exibida (será um asset)
  final List<Widget>? actions; //Possível lista de Widgets a ser exibida abaixo da mensagem (geralmente um botão)

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 600),
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (imagePath != null) ...[
                if (imagePath!.endsWith('.svg')) ...[
                  //Caso seja uma imagem SVG
                  SvgPicture.asset(
                    '$imagePath',
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.height * 0.35,
                  ),
                ] else ...[
                  //Assume que é qualquer outro tipo de imagem
                  Image.asset(
                    '$imagePath',
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: MediaQuery.of(context).size.height * 0.35,
                  ),
                ],
                const SizedBox(height: 15),
              ],
              //Mensagem exibida
              Text(
                '$message',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: theme.colorScheme.tertiary,
                  fontSize: 18,
                ),
              ),
              //Lista de ações
              if (actions != null) ...[
                const SizedBox(height: 20),
                Column(children: actions!),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
