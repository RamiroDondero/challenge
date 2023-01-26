class IndicadorState {
  const IndicadorState();

  /// Determina el o los state que habra que filtrar dependiendo de la solapa (boton) (currenPage)
  /// que se encuentre seleccionada
  List<int> determinarState(int currenPage) {
    switch (currenPage) {
      case 0:
        return [4, 5];
      case 2:
        return [6];
      case 3:
        return [7];
      default:
        return [];
    }
  }
}
