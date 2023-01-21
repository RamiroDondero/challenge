import '../domain/entities/grupo_reservas.dart';
import '../domain/entities/reserva.dart';

class GetListGrupoReservas {
  
  const GetListGrupoReservas();

  /// Este metodo devuelve una lista de [GrupoReservas] (Entidad) cada entidad dispondra de su Rango Horario 
  /// y ademas dependiendo de la solapa 'CurrentPage' 'boton' del menu que hayamos seleccionado
  /// filtra las que se mostraran.
  List<GrupoReservas> getListGrupoReservas( List<Reserva> listaReservas, int currentPage) {
   
    final List<int> states = determinarState(currentPage);

    final List<GrupoReservas> listaAgrupada = crearLista();

    listaReservas.map((reserva) {
     
      final copyReserva = actualizarHorarioReservaUTC(reserva);
      final day = DateTime.parse(copyReserva.day);
     

      switch (day.hour) {
        case 0:
        case 1:
        case 2:
          for (final state in states) {
            if (copyReserva.state == state) {
              listaAgrupada[0].reservas.add(copyReserva);
            }
          }
          break;

        case 3:
        case 4:
        case 5:
          for (final state in states) {
            if (copyReserva.state == state) {
              listaAgrupada[1].reservas.add(copyReserva);
            }
          }
          break;

        case 6:
        case 7:
        case 8:
          for (final state in states) {
            if (copyReserva.state == state) {
              listaAgrupada[2].reservas.add(copyReserva);
            }
          }
          break;
        case 9:
        case 10:
        case 11:
          for (final state in states) {
            if (copyReserva.state == state) {
              listaAgrupada[3].reservas.add(copyReserva);
            }
          }
          break;

        case 12:
        case 13:
        case 14:
          for (final state in states) {
            if (copyReserva.state == state) {
              listaAgrupada[4].reservas.add(copyReserva);
            }
          }
          break;

        case 15:
        case 16:
        case 17:
          for (final state in states) {
            if (copyReserva.state == state) {
              listaAgrupada[5].reservas.add(copyReserva);
            }
          }
          break;

        case 18:
        case 19:
        case 20:
          for (final state in states) {
            if (copyReserva.state == state) {
              listaAgrupada[6].reservas.add(copyReserva);
            }
          }
          break;

        case 21:
        case 22:
        case 23:
          for (final state in states) {
            if (copyReserva.state == state) {
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

  /// Recibe como parametro el indice de la lista de 8 [GrupoReservas] y de acuerdo a ese dato
  /// establece el rango horario que le corresponde . Lo devuelve en String. 
  String rangoHorario(int index) {
    int x = 3 * index;
    x = x == 24 ? 0 : x;
    int y = x + 3;
    y = y == 24 ? 0 : y;

    final start = x <= 9 ? '0$x' : '$x';
    final end = y <= 9 ? '0$y' : '$y';
    
    return '$start:00hs - $end:00hs';
  }



  /// Crea una lista de 8 [GrupoReservas] (Entidad). Son 8 debido a que la franja horaria de cada grupo
  /// es de 3 hs .. 8 * 3 = 24 hs en total 
  List<GrupoReservas> crearLista() {
    return List.generate( 8, (index) => GrupoReservas(rangoHorario: rangoHorario(index), reservas: []));
  }


  /// Actualizamos el horario de la Reserva en UTC diferencia de 3 horas.
  Reserva actualizarHorarioReservaUTC(Reserva reserva) {
    final day = DateTime.parse(reserva.day);
    final dayTimeZone = day.subtract(const Duration(hours: 3));
    final String hora = dayTimeZone.hour.toString();
    final String min = dayTimeZone.minute < 9 ? '0${dayTimeZone.minute}' : '${dayTimeZone.minute}';
    final String horaReserva = '$hora:$min hs';
    return reserva.copyWith(day: dayTimeZone.toUtc().toString(), horaReserva: horaReserva);
  }

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
        return [0];
    }
  }
}
