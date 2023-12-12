import 'package:flutter/material.dart';

import '../constants/assets/assets_path.dart';
import 'cs_elevated_button.dart';
import 'cs_icon.dart';

///Widget padrão para as telas que possuem apenas um título, uma descrição e o botão de entrar em contato. A única coisa que muda nessas telas é o título e a descrição
class EntreEmContatoWidget extends StatelessWidget {
  const EntreEmContatoWidget({
    required this.title,
    required this.description,
    this.showButton = true,
    super.key,
  });

  final String title; //Título da seção
  final String description; //Descrição da seção
  final bool showButton; //Controla se exibe ou não o botão de "Entrar em contato"

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(AssetsPath.BACKGROUND_HISTORY),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30).copyWith(bottom: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  '$title',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 50,
                    color: theme.colorScheme.tertiary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                '$description',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 30,
                  color: theme.colorScheme.secondary,
                ),
              ),
              const SizedBox(height: 10),
              if (showButton) ...[
                CsElevatedButton(
                  label: 'Entre em Contato (55) 9 9999-9999',
                  icon: const CsIcon.medium(asset: AssetsPath.WHATSAPP),
                  isBold: true,
                  size: 50,
                  onTap: () {
                    ScaffoldMessenger.of(context).clearSnackBars();

                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Obrigado por entrar em contato'),
                      behavior: SnackBarBehavior.floating,
                    ));
                  },
                ),
                const SizedBox(height: 10),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
