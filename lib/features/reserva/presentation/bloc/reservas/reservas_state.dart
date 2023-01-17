part of 'reservas_bloc.dart';

class ReservasState extends Equatable {
  final List<Reserva> listaReservas;
  final List<GrupoReservas> listaReservasAgrupadas;
  final int currentPage;
  final int reservasVivas;
  final int cantEnListaEspera;
  final int ingreasadas;
  final int noConcurrieron;

  final List<Map<String, dynamic>> listaEspera = [
    {'nombre': 'ramiro' , 'telefono':'2235973940', "personas":2, 'comentario': 'hola' , "sector":'Patio' , 'demora': 5},
    {'nombre': 'ramiro' , 'telefono':'2235973940', "personas":3, 'comentario': 'hola' , "sector":'Patio' , 'demora': 5},
    
  ];

   ReservasState(
      {this.reservasVivas = 0,
      this.cantEnListaEspera = 0,
      this.noConcurrieron = 0,
      this.ingreasadas = 0,
      this.currentPage = 0,
      required this.listaReservasAgrupadas,
      required this.listaReservas});

  @override
  List<Object> get props => [
        listaReservasAgrupadas,
        listaReservas,
        currentPage,
        ingreasadas,
        noConcurrieron,
        cantEnListaEspera,
        reservasVivas
      ];

  ReservasState copyWith(
          {int? currentPage,
          int? reservasVivas,
          int? cantEnListaEspera,
          int? ingreasadas,
          int? noConcurrieron,
          List<Reserva>? listaReservas,
          List<GrupoReservas>? listaReservasAgrupadas}) =>
      ReservasState(
          reservasVivas: reservasVivas ?? this.reservasVivas,
          cantEnListaEspera: cantEnListaEspera ?? this.cantEnListaEspera,
          ingreasadas: ingreasadas ?? this.ingreasadas,
          noConcurrieron: noConcurrieron ?? this.noConcurrieron,
          currentPage: currentPage ?? this.currentPage,
          listaReservas: listaReservas ?? this.listaReservas,
          listaReservasAgrupadas:
              listaReservasAgrupadas ?? this.listaReservasAgrupadas);
}
