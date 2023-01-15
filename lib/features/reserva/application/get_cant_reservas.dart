import '../domain/entities/reserva.dart';

class GetCantReservas {
  const GetCantReservas();

  int getCantReservas(List<Reserva> reservas, List state) {
    int cant = 0;

    for (final e in state) {
      for (final reserva in reservas) {
        reserva.state == e ? cant = cant + 1 : cant;
      }
    }

    return cant;
  }
}
