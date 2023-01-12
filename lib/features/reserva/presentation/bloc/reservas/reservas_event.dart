part of 'reservas_bloc.dart';

abstract class ReservasEvent extends Equatable {
  const ReservasEvent();

  @override
  List<Object> get props => [];
}


class GetListReservasEvent extends ReservasEvent{}
