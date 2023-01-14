import 'package:dartz/dartz.dart';
import 'package:woki_partner/features/reserva/application/usecase.dart';
import 'package:woki_partner/features/reserva/domain/entities/grupo_reservas.dart';
import 'package:woki_partner/features/reserva/domain/repositories/reserva_repository.dart';

import '../../../core/error/failures.dart';

class GetLisTReservas implements UseCase<List<GrupoReservas>, NoParams> {
  final ReservaRepository repository;

  GetLisTReservas({required this.repository});

  @override
  Future<Either<Failure, List<GrupoReservas>>> call(NoParams params) async {
    final listaReservas = await repository.getListReservas();

    String rangoHorario(int index) {
      int x = 3 * index;
      int y = 3 * index + 3;
      x = x == 24 ? 0 : x;
      y = y == 24 ? 0 : y;
      final start = x <= 9 ? '0$x' : '$x';
      final end = y <= 9 ? '0$y' : '$y';
      return '$start:00hs - $end:00hs';
    }

    final List<GrupoReservas> listaAgrupada = List.generate(
        8,
        (index) =>
            GrupoReservas(rangoHorario: rangoHorario(index), reservas: []));

    final lista_TimeZone = listaReservas.fold(
        (failure) => null,
        (listaReservas) => listaReservas.map((reserva) {
              final day = DateTime.parse(reserva.day);
              final dayTimeZone = day.subtract(const Duration(hours: 3));

              switch (dayTimeZone.hour) {
                case 0:
                case 1:
                case 2:
                  final copyReserva =
                      reserva.copyWith(day: dayTimeZone.toUtc().toString());
                  listaAgrupada[0].reservas.add(copyReserva);
                  break;

                case 3:
                case 4:
                case 5:
                  final copyReserva =
                      reserva.copyWith(day: dayTimeZone.toUtc().toString());
                  listaAgrupada[1].reservas.add(copyReserva);
                  break;

                case 6:
                case 7:
                case 8:
                  final copyReserva =
                      reserva.copyWith(day: dayTimeZone.toUtc().toString());
                  listaAgrupada[2].reservas.add(copyReserva);
                  break;

                case 9:
                case 10:
                case 11:
                  final copyReserva =
                      reserva.copyWith(day: dayTimeZone.toUtc().toString());
                  listaAgrupada[3].reservas.add(copyReserva);
                  break;

                case 12:
                case 13:
                case 14:
                  final copyReserva =
                      reserva.copyWith(day: dayTimeZone.toUtc().toString());
                  listaAgrupada[4].reservas.add(copyReserva);
                  break;

                case 15:
                case 16:
                case 17:
                  final copyReserva =
                      reserva.copyWith(day: dayTimeZone.toUtc().toString());
                  listaAgrupada[5].reservas.add(copyReserva);
                  break;

                case 18:
                case 19:
                case 20:
                  final copyReserva =
                      reserva.copyWith(day: dayTimeZone.toUtc().toString());
                  listaAgrupada[6].reservas.add(copyReserva);
                  break;

                case 21:
                case 22:
                case 23:
                  final copyReserva =
                      reserva.copyWith(day: dayTimeZone.toUtc().toString());
                  listaAgrupada[7].reservas.add(copyReserva);
                  break;

                default:
                  break;
              }

              return reserva;
            }).toList());

    return Right(listaAgrupada);
  }
}
