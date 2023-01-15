
import '../domain/entities/grupo_reservas.dart';
import '../domain/entities/reserva.dart';

class GetListGrupoReservas {
  const GetListGrupoReservas();

  String rangoHorario(int index) {
    int x = 3 * index;
    int y = 3 * index + 3;
    x = x == 24 ? 0 : x;
    y = y == 24 ? 0 : y;
    final start = x <= 9 ? '0$x' : '$x';
    final end = y <= 9 ? '0$y' : '$y';
    return '$start:00hs - $end:00hs';
  }

  List<GrupoReservas> crearLista(int grupos) {
    return List.generate(
        grupos,
        (index) =>
            GrupoReservas(rangoHorario: rangoHorario(index), reservas: []));
  }

  Reserva actualizarHorarioReservaUTC(Reserva reserva, DateTime day) =>
      reserva.copyWith(day: day.toUtc().toString());

  List determinarState(int currenPage) {
    switch (currenPage) {
      case 0:
        return [4, 5];
      case 2:
        return [6];
      case 3:
        return [7];
      default:
        return [0];
    }
  }

  List<GrupoReservas> agruparReservas(
      List<Reserva> listaReservas, int currentPage) {
    final state = determinarState(currentPage);

    final List<GrupoReservas> listaAgrupada = crearLista(8);

    listaReservas.map((reserva) {
      final day = DateTime.parse(reserva.day);
      final dayTimeZone = day.subtract(const Duration(hours: 3));
      final copyReserva = actualizarHorarioReservaUTC(reserva, dayTimeZone);

      switch (dayTimeZone.hour) {
        case 0:
        case 1:
        case 2:
          for (final i in state) {
            if (copyReserva.state == i){
              listaAgrupada[0].reservas.add(copyReserva);
            }
          }
          break;

        case 3:
        case 4:
        case 5:
          for (final i in state) {
            if (copyReserva.state == i){
              listaAgrupada[1].reservas.add(copyReserva);
            }
          }
          break;

        case 6:
        case 7:
        case 8:
          for (final i in state) {
            if (copyReserva.state == i){
              listaAgrupada[2].reservas.add(copyReserva);
            }
          }
          break;
        case 9:
        case 10:
        case 11:
          for (final i in state) {
            if (copyReserva.state == i){
              listaAgrupada[3].reservas.add(copyReserva);
            }
          }
          break;

        case 12:
        case 13:
        case 14:
          for (final i in state) {
            if (copyReserva.state == i){
              listaAgrupada[4].reservas.add(copyReserva);
            }
          }
          break;

        case 15:
        case 16:
        case 17:
          for (final i in state) {
            if (copyReserva.state == i){
              listaAgrupada[5].reservas.add(copyReserva);
            }
          }
          break;

        case 18:
        case 19:
        case 20:
         for (final i in state) {
            if (copyReserva.state == i){
              listaAgrupada[6].reservas.add(copyReserva);
            }
          }
          break;

        case 21:
        case 22:
        case 23:
          for (final i in state) {
            if (copyReserva.state == i){
              listaAgrupada[7].reservas.add(copyReserva);
            }
          }
          break;

        default:
          break;
      }
    }).toList();

    return listaAgrupada;
  }
}
