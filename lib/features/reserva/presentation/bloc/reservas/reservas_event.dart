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
