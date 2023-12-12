import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

///ScrollBehavior customizado para facilitar a navegação na web utilizando o mouse e o touchpad
class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
