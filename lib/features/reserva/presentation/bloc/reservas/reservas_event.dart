part of 'reservas_bloc.dart';

abstract class ReservasEvent extends Equatable {
  const ReservasEvent();
  @override
  List<Object> get props => [];
}

class LoadingEvent extends ReservasEvent {}

class ChangePageEvent extends ReservasEvent {
  final int page;
  const ChangePageEvent(this.page);
}

class ListUpdateEvent extends ReservasEvent {}

class AddListaEsperaEvent extends ReservasEvent {
  final Map<String, dynamic> reserva;
  const AddListaEsperaEvent(this.reserva);
}
