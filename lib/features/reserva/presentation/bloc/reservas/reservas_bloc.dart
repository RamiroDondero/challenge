import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:woki_partner/features/reserva/application/get_list_reservas.dart';
import 'package:woki_partner/features/reserva/application/usecase.dart';

import '../../../domain/entities/reserva.dart';

part 'reservas_event.dart';
part 'reservas_state.dart';

class ReservasBloc extends Bloc<ReservasEvent, ReservasState> {
  final GetLisTReservas getLisTReservas;

  ReservasBloc({required this.getLisTReservas}) : super(const ReservasState()) {
    on<GetListReservasEvent>((event, emit) async {
      final failureOrReserva = await getLisTReservas.call(NoParams());
      failureOrReserva.fold(
          (l) => null,
          (reservas) => emit(const ReservasState().copyWith(listaReservas: reservas)));
     
    });
  }
}
