import 'package:flutter/material.dart';

///Botão padrão da aplicação
///
///Permite utilização de ícone e sombra na sua construção
class CsElevatedButton extends StatelessWidget {
  const CsElevatedButton({
    required this.label,
    required this.onTap,
    this.icon,
    this.hasShadown = false,
    this.size = 18,
    this.isBold = false,
    super.key,
  });

  final String label; //Label de exibição do botão
  final Widget? icon; //Ícone do botão
  final bool hasShadown; //Controla se há sombra ou não no botão
  final double size; //Tamanho do botão
  final VoidCallback? onTap; //Callback para quando clicar no botão
  final bool isBold; //Controla se a label é em negrito ou normal

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        boxShadow: hasShadown
            ? const [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 20,
                  spreadRadius: 1,
                  offset: Offset(10, 10),
                ),
              ]
            : null,
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(theme.colorScheme.tertiary),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: BorderSide(color: theme.primaryColor, width: 3),
          )),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.w300,
                  height: 1,
                ),
              ),
              if (icon != null) ...[
                const SizedBox(width: 10),
                icon!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
