import 'package:flutter/material.dart';

import '../constants/assets/assets_path.dart';
import '../utils/function_utils.dart';
import 'cs_icon.dart';

///Widget padrão utilizado para ser o rodapé da aplicação
class FooterWidget extends StatefulWidget {
  const FooterWidget({super.key});

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  Widget _icon(String icon, VoidCallback? onTap) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      child: CsIcon.medium(asset: icon, color: theme.primaryColor),
    );
  }

  Widget _item(String icon, String text) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _icon(icon, null),
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              color: theme.primaryColor,
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.tertiary,
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 30,
            spreadRadius: 5,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      AssetsPath.LOGO_COFFEX,
                      width: 250,
                      height: 250,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _item(AssetsPath.EMAIL, 'coffee@x.com.br'),
                          _item(AssetsPath.WHATSAPP, '(55) 9 9999-9999'),
                          _item(AssetsPath.PIN, 'Rua do comércio, 75, Santa Rosa - RS, 98970-001'),
                        ],
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: SizedBox(
                          width: 350,
                          child: Column(
                            children: [
                              Text(
                                'Siga-nos nas redes sociais',
                                style: TextStyle(
                                  color: theme.primaryColor,
                                  fontSize: 30,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  _icon(AssetsPath.YOUTUBE, () {
                                    openUrl('https://www.youtube.com/');
                                  }),
                                  _icon(AssetsPath.LINKEDIN, () {
                                    openUrl('https://www.linkedin.com/');
                                  }),
                                  _icon(AssetsPath.INSTAGRAM, () {
                                    openUrl('https://www.instagram.com/');
                                  }),
                                  _icon(AssetsPath.FACEBOOK, () {
                                    openUrl('https://www.facebook.com/');
                                  }),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              'Coffee X todos os direitos reservados © 2023',
              style: TextStyle(
                color: theme.primaryColor,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
