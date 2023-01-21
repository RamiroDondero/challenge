import '../domain/entities/reserva.dart';

class GetCantReservas  {
  const GetCantReservas();


  /// Recibe una lista de reservas y un arreglo de valores de state que quiero filtrar
  /// Devuelve la cantidad de reservas que tienen el state solicitado.
  int getCantReservas(List<Reserva> reservas, List<int> state) {
    int cant = 0;

    for (final e in state) {
      for (final reserva in reservas) {
        reserva.state == e ? cant = cant + 1 : cant;
      }
    }

    return cant;
  } 
}
