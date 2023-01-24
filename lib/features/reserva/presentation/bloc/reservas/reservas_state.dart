part of 'reservas_bloc.dart';

class ReservasState extends Equatable {
  final List<Reserva> listaReservas;
  final List<GrupoReservas> listaReservasAgrupadas;
  final int currentPage;
  final int reservasVivas;
  final int cantEnListaEspera;
  final int ingreasadas;
  final int noConcurrieron;

  final List<Map<String, dynamic>> listaEspera;

   const ReservasState(
      {
      this.reservasVivas = 0,
      this.cantEnListaEspera = 0,
      this.noConcurrieron = 0,
      this.ingreasadas = 0,
      this.currentPage = 0,
      required this.listaEspera,
      required this.listaReservasAgrupadas,
      required this.listaReservas
      });

  @override
  List<Object> get props => [
        listaReservasAgrupadas,
        listaReservas,
        currentPage,
        ingreasadas,
        noConcurrieron,
        cantEnListaEspera,
        reservasVivas,
        listaEspera
      ];

  ReservasState copyWith(
          {
          int? currentPage,
          int? reservasVivas,
          int? cantEnListaEspera,
          int? ingreasadas,
          int? noConcurrieron,
          List<Map<String, dynamic>>? listaEspera,
          List<Reserva>? listaReservas,
          List<GrupoReservas>? listaReservasAgrupadas
          }) =>
      ReservasState(
          listaEspera: listaEspera ?? this.listaEspera,
          reservasVivas: reservasVivas ?? this.reservasVivas,
          cantEnListaEspera: cantEnListaEspera ?? this.cantEnListaEspera,
          ingreasadas: ingreasadas ?? this.ingreasadas,
          noConcurrieron: noConcurrieron ?? this.noConcurrieron,
          currentPage: currentPage ?? this.currentPage,
          listaReservas: listaReservas ?? this.listaReservas,
          listaReservasAgrupadas:listaReservasAgrupadas ?? this.listaReservasAgrupadas);
}
