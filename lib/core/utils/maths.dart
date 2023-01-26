class Maths {
  const Maths();

  bool multiploDeUnNumero(int valor, int mult) {
    final res = mult % valor;
    return res == 0 ? true : false;
  }
}
