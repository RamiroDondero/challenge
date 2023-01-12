part of 'reservas_bloc.dart';

class ReservasState extends Equatable {
  final List<Reserva> listaReservas;

  const ReservasState({this.listaReservas = const [] });

  @override
  List<Object> get props => [listaReservas];

  ReservasState copyWith({
    List<Reserva>? listaReservas
  }) =>  ReservasState(
    listaReservas: listaReservas ?? this.listaReservas
  );
}
