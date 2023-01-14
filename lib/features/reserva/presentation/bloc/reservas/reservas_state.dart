part of 'reservas_bloc.dart';

class ReservasState extends Equatable {
  final List<GrupoReservas> listaReservasAgrupadas;

  const ReservasState({this.listaReservasAgrupadas = const [] });

  @override
  List<Object> get props => [listaReservasAgrupadas];

  ReservasState copyWith({
    List<GrupoReservas>? listaReservasAgrupadas
  }) =>  ReservasState(
    listaReservasAgrupadas: listaReservasAgrupadas ?? this.listaReservasAgrupadas
  );
}
