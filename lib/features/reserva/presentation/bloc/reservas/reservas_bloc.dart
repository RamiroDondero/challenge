import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:woki_partner/features/reserva/application/get_list_grupo_reservas.dart';
import 'package:woki_partner/features/reserva/application/get_list_reservas.dart';
import 'package:woki_partner/core/useCase/usecase.dart';
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
      {
      required this.getCantidadReservas,
      required this.getListGrupoReservas,
      required this.getLisTReservas
      })
      : super(const ReservasState(
            listaReservas:[], listaReservasAgrupadas: [] , listaEspera: [])) {

    on<LoadingEvent>((event, emit) async {

        final failureOrReserva = await getLisTReservas(NoParams());
        
        failureOrReserva.fold((l) => null, (reservas) {
        
        final listaGrupoReservas = getListGrupoReservas.getListGrupoReservas(reservas, state.currentPage);
        
        final vivas = getCantidadReservas.getCantReservas(reservas, [4, 5]);
        
        final noConcurrieron = getCantidadReservas.getCantReservas(reservas, [6]);
        
        final ingresadas = getCantidadReservas.getCantReservas(reservas, [7]);
        
        final enListaEspera = state.listaEspera.length;
        
        emit(state.copyWith(
            reservasVivas: vivas,
            noConcurrieron: noConcurrieron,
            ingreasadas: ingresadas,
            listaReservas: reservas,
            cantEnListaEspera: enListaEspera,
            listaReservasAgrupadas: listaGrupoReservas
            ));
      });
    });

    on<ChangePageEvent>((event, emit) {
      emit(state.copyWith(currentPage: event.page));
    });

    on<ListUpdateEvent>((event, emit) {
      final listaGrupoReservas = getListGrupoReservas.getListGrupoReservas(
          state.listaReservas, state.currentPage);
      emit(state.copyWith(listaReservasAgrupadas: listaGrupoReservas));
    });

    on<AddListaEsperaEvent>((event, emit) {
      final nuevaLista = [...state.listaEspera, event.reserva];
      emit(state.copyWith(
        listaEspera: nuevaLista ,
        currentPage: 1,
        cantEnListaEspera: state.cantEnListaEspera + 1));
    });

    add(LoadingEvent());
  }
}
