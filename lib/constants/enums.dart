///Opções do menu de navegação
enum MenuOption {
  inicio('Início', 0),
  cafe('Cafés', 1),
  equipamentos('Equipamentos', 2),
  parcerias('Parcerias', 3),
  sobre('Sobre', 4);

  const MenuOption(this.title, this.indexOption);

  final String title;
  final int indexOption;
}
