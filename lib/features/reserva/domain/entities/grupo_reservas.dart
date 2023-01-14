import 'reserva.dart';

class GrupoReservas {
  final String rangoHorario;
  final List<Reserva> reservas;

  GrupoReservas({
     this.rangoHorario = '',
     required this.reservas
    });
}
