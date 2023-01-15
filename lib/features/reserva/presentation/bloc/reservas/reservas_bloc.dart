import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:woki_partner/features/reserva/application/get_list_grupo_reservas.dart';
import 'package:woki_partner/features/reserva/application/get_list_reservas.dart';
import 'package:woki_partner/features/reserva/application/usecase.dart';
import 'package:woki_partner/features/reserva/domain/entities/grupo_reservas.dart';

import '../../../application/get_cant_reservas.dart';
import '../../../domain/entities/reserva.dart';

part 'reservas_event.dart';
part 'reservas_state.dart';

class ReservasBloc extends Bloc<ReservasEvent, ReservasState> {
  final GetLisTReservas getLisTReservas;
  final GetListGrupoReservas getListGrupoReservas;
  final GetCantReservas getCantidadReservas;

  ReservasBloc(
      {required this.getCantidadReservas,
      required this.getListGrupoReservas,
      required this.getLisTReservas})
      : super(const ReservasState(
            listaReservas: [], listaReservasAgrupadas: [])) {
              
    on<LoadingEvent>((event, emit) async {
      final failureOrReserva = await getLisTReservas.call(NoParams());
      failureOrReserva.fold((l) => null, (reservas) {
        final listaGrupoReservas =
            getListGrupoReservas.agruparReservas(reservas, state.currentPage);
        final vivas = getCantidadReservas.getCantReservas(reservas, [4, 5]);
        final noConcurrieron =
            getCantidadReservas.getCantReservas(reservas, [6]);
        final ingresadas = getCantidadReservas.getCantReservas(reservas, [7]);

        emit(state.copyWith(
            reservasVivas: vivas,
            noConcurrieron: noConcurrieron,
            ingreasadas: ingresadas,
            listaReservas: reservas,
            listaReservasAgrupadas: listaGrupoReservas));
      });
    });

    on<ChangePageEvent>((event, emit) {
      emit(state.copyWith(currentPage: event.page));
    });

    on<ListUpdateEvent>((event, emit) {
      final listaGrupoReservas = getListGrupoReservas.agruparReservas(
          state.listaReservas, state.currentPage);
      emit(state.copyWith(listaReservasAgrupadas: listaGrupoReservas));
    });

    add(LoadingEvent());
  }
}
