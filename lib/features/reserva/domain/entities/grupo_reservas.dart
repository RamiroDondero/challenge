import 'reserva.dart';

class GrupoReservas {
  final List<Reserva> reservas;
  final int start;
  final int end;
  String get rangoHora => '$start:00hs - $end:00hs';

  GrupoReservas({
    this.start = 0,
    this.end = 0,
    required this.reservas,
  });
}
