import '../../features/reserva/domain/entities/reserva.dart';

class HorarioUtc {
  const HorarioUtc();

  /// Actualizamos el horario de la Reserva en UTC diferencia de 3 horas.
  Reserva ajustarHorarioUTC(Reserva reserva) {
    final DateTime day = DateTime.parse(reserva.day);
    final String newDay =
        day.subtract(Duration(hours: reserva.timezone.abs())).toString();
    return reserva.copyWith(day: newDay);
  }
}
