import 'package:flutter/material.dart';

///Widget padrão para tratar a exibição de ícones
///
///Permite utilizar os próprios Icons do MaterialDesign ou então utilizar assets externos
class CsIcon extends StatelessWidget {
  const CsIcon({
    this.icon,
    this.asset,
    this.color,
    this.size = 24,
    super.key,
  }) : assert(icon != null || asset != null, 'Informe ao menos um icon ou um asset');

  const CsIcon.large({
    this.icon,
    this.asset,
    this.color,
    super.key,
  })  : size = 55,
        assert(icon != null || asset != null, 'Informe ao menos um icon ou um asset');

  const CsIcon.medium({
    this.icon,
    this.asset,
    this.color,
    super.key,
  })  : size = 46,
        assert(icon != null || asset != null, 'Informe ao menos um icon ou um asset');

  const CsIcon.small({
    this.icon,
    this.asset,
    this.color,
    super.key,
  })  : size = 28,
        assert(icon != null || asset != null, 'Informe ao menos um icon ou um asset');

  final IconData? icon; //Ícone para exibir utilizando o MaterialDesign
  final String? asset; //Exibir imagem através dos assets da aplicação
  final Color? color; //Cor padrão do ícone/imagem
  final double size; //Tamanho do ícone

  @override
  Widget build(BuildContext context) {
    if (asset != null) {
      return Image.asset(
        asset!,
        color: color,
        width: size,
        height: size,
        fit: BoxFit.cover,
      );
    }

    return Icon(
      icon,
      color: color,
      size: size,
    );
  }
}
