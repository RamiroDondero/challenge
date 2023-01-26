import '../../features/reserva/domain/entities/reserva.dart';

class FiltradorReservas {
  const FiltradorReservas();

  List<Reserva> filtrarReservasPorState(
      List<Reserva> reservas, List<int> states) {
    List<Reserva> res = [];

    for (final state in states) {
      res = [...res, ...reservas.where((reserva) => reserva.state == state)];
    }

    return res;
  }
}
