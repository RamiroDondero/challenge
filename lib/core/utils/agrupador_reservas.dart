import 'package:woki_partner/core/utils/maths.dart';
import 'package:woki_partner/features/reserva/domain/entities/grupo_reservas.dart';

import '../../features/reserva/domain/entities/reserva.dart';

class AgrupadorReservas {
  final Maths maths;

  const AgrupadorReservas({required this.maths});

  List<GrupoReservas> listarGrupoReservas( List<Reserva> reservas, int rangoHorario) {
    final listaAgrupada = _generarListaGrupoReservas(rangoHorario);

    return listaAgrupada.map((grupo) {
      final res = reservas.where((reserva) =>

        DateTime.parse(reserva.day).hour >= grupo.start &&
        DateTime.parse(reserva.day).hour <= grupo.end
        
        ).toList();

      grupo.reservas.addAll(res);
      return grupo;
    }).toList();
  }

  List<GrupoReservas> _generarListaGrupoReservas(int rangoHorario) {
    if (maths.multiploDeUnNumero(rangoHorario, 24) == true) {
      final cantGrupos = 24 ~/ rangoHorario;

      return List.generate(cantGrupos, (index) {
        final startAndEnd = _getStartAndEnd(index, rangoHorario);
        return GrupoReservas(
            reservas: [], start: startAndEnd.first, end: startAndEnd.last);
      });
    } else {
      return [];
    }
  }

  List<int> _getStartAndEnd(int index, int rango) {
    int start = rango * index;
    start = start == 24 ? 0 : start;

    int end = start + rango -1;
    end = end == 24 ? 0 : end;

    return [start, end];
  }
}
