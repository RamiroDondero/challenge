import '../../features/reserva/domain/entities/reserva.dart';

class ContadorReservas {
  const ContadorReservas();

  /// Recibe una lista de reservas y un arreglo de valores de state que quiero filtrar
  /// Devuelve la cantidad de reservas que tienen el state solicitado.
  int getCantReservas(List<Reserva> reservas, List<int> states) {
    int cant = 0;

    for (final state in states) {
      cant = cant + reservas.where((reserva) => reserva.state == state).length;
    }

    return cant;
  }
}
