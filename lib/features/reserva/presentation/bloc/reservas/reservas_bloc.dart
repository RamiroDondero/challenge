import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:woki_partner/core/utils/agrupador_reservas.dart';
import 'package:woki_partner/core/utils/horario_Utc.dart';
import 'package:woki_partner/core/utils/filtrador_reservas.dart';
import 'package:woki_partner/core/utils/indicador_state.dart';
import 'package:woki_partner/features/reserva/application/get_list_reservas.dart';
import 'package:woki_partner/core/useCase/usecase.dart';
import 'package:woki_partner/features/reserva/domain/entities/grupo_reservas.dart';

import '../../../../../core/utils/contador_reservas.dart';
import '../../../domain/entities/reserva.dart';

part 'reservas_event.dart';
part 'reservas_state.dart';

class ReservasBloc extends Bloc<ReservasEvent, ReservasState> {
  final GetLisTReservas getLisTReservas;
  final HorarioUtc horario;
  final IndicadorState indicadorstate;
  final ContadorReservas contadorReservas;
  final FiltradorReservas filtradorReservas;
  final AgrupadorReservas agrupadorReservas;



  ReservasBloc({
    required this.agrupadorReservas,
    required this.filtradorReservas,
    required this.indicadorstate,
    required this.horario,
    required this.getLisTReservas,
    required this.contadorReservas,

    
  }) : super(const ReservasState( listaReservas: [], listaReservasAgrupadas: [], listaEspera: [])) {
    on<LoadingEvent>((event, emit) async {
      final failureOrReserva = await getLisTReservas(NoParams());

      failureOrReserva.fold((l) => null, (reservas) {

        final listaReservas = reservas.map((reserva) => horario.ajustarHorarioUTC(reserva)).toList();

        final states = indicadorstate.determinarState(state.currentPage);
        final listaReservasPorState = filtradorReservas.filtrarReservasPorState(listaReservas, states);
        final listaGrupoReservas = agrupadorReservas.listarGrupoReservas(listaReservasPorState, 3);

        final vivas = contadorReservas.getCantReservas(reservas, [4, 5]);

        final noConcurrieron =  contadorReservas.getCantReservas(reservas, [6]);

        final ingresadas = contadorReservas.getCantReservas(reservas, [7]);

        final enListaEspera = state.listaEspera.length;

        emit(state.copyWith(
            reservasVivas: vivas,
            noConcurrieron: noConcurrieron,
            ingreasadas: ingresadas,
            listaReservas: listaReservas,
            cantEnListaEspera: enListaEspera,
            listaReservasAgrupadas: listaGrupoReservas));
      });
    });

    on<ChangePageEvent>((event, emit) {
      emit(state.copyWith(currentPage: event.page));
    });

    on<ListUpdateEvent>((event, emit) {
        final states = indicadorstate.determinarState(state.currentPage);
        final listaReservasPorState = filtradorReservas.filtrarReservasPorState(state.listaReservas, states);
        final listaGrupoReservas = agrupadorReservas.listarGrupoReservas(listaReservasPorState, 3);
      emit(state.copyWith(listaReservasAgrupadas: listaGrupoReservas));
    });

    on<AddListaEsperaEvent>((event, emit) {
      final nuevaLista = [...state.listaEspera, event.reserva];
      emit(state.copyWith(
          listaEspera: nuevaLista,
          currentPage: 1,
          cantEnListaEspera: state.cantEnListaEspera + 1));
    });

    add(LoadingEvent());
  }
}
