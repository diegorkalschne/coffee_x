import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

///Widget utilizado para indicar carregamento
class CsCircularProgressIndicador extends StatelessWidget {
  const CsCircularProgressIndicador({
    this.withMessage = false,
    this.message,
    this.color,
    this.size = 35,
    super.key,
  });

  const CsCircularProgressIndicador.light({
    this.withMessage = false,
    this.message,
    this.size = 35,
    super.key,
  }) : color = Colors.white;

  const CsCircularProgressIndicador.dark({
    this.withMessage = false,
    this.message,
    this.size = 35,
    super.key,
  }) : color = null;

  final Color? color; //Cor da indicação do carregamento
  final bool withMessage; //Se exibe mensagem na indicação
  final String? message; //Qual mensagem exibir
  final double size; //Tamanho do circular

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LoadingAnimationWidget.hexagonDots(
            color: color ?? theme.colorScheme.tertiary,
            size: size,
          ),
          if (withMessage) ...[
            const SizedBox(height: 20),
            Text(
              message ?? 'Carregando Dados',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: theme.colorScheme.tertiary,
                fontSize: 16,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
