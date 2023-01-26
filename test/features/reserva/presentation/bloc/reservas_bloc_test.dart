import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:woki_partner/core/useCase/usecase.dart';
import 'package:woki_partner/core/utils/contador_reservas.dart';
import 'package:woki_partner/features/reserva/application/get_list_grupo_reservas.dart';
import 'package:woki_partner/features/reserva/application/get_list_reservas.dart';
import 'package:woki_partner/features/reserva/domain/entities/grupo_reservas.dart';
import 'package:woki_partner/features/reserva/domain/entities/reserva.dart';
import 'package:woki_partner/features/reserva/presentation/bloc/reservas/reservas_bloc.dart';

import 'reservas_bloc_test.mocks.dart';

  @GenerateNiceMocks([MockSpec<GetLisTReservas>()])
  @GenerateNiceMocks([MockSpec<GetListGrupoReservas>()])
  @GenerateNiceMocks([MockSpec<GetCantReservas>()])
 void main() {
  
  late MockGetLisTReservas getLisTReservas;
  late MockGetListGrupoReservas getListGrupoReservas;
  late MockGetCantReservas getCantReservas;
  late ReservasBloc bloc;

  setUp((){
     getCantReservas = MockGetCantReservas();
     getListGrupoReservas = MockGetListGrupoReservas();
     getLisTReservas = MockGetLisTReservas();
     bloc = ReservasBloc(
          getCantidadReservas: getCantReservas,
          getListGrupoReservas: getListGrupoReservas,
          getLisTReservas: getLisTReservas
          );
  });  

  group('LoadingEvent', () {
    List<Reserva> tListaReserva = [];
    List<GrupoReservas> tListGrupoReservas = [];
    int tCantReservas = 0;
    test('los metodos getCantReservas , getListGrupoReservas , getLisTReservas deberan ser llamados', () {
      // arrenge
      when(getLisTReservas(any)).thenAnswer((_) async => Right(tListaReserva));
      when(getListGrupoReservas.getListGrupoReservas(any, any)).thenReturn(tListGrupoReservas);
      when(getCantReservas.getCantReservas(any , any)).thenReturn(tCantReservas);
      // act
      bloc.add(LoadingEvent());
      // assert
      verify(getLisTReservas(NoParams()));
      verify(getListGrupoReservas.getListGrupoReservas(tListaReserva, bloc.state.currentPage));
      verify(getCantReservas.getCantReservas(tListaReserva, [4,5]));
    });
  });

  group('ListUpdateEvent', () {
    int page = 1;
    List<Reserva> tListaReserva = [];
    List<GrupoReservas> tListGrupoReservas = [];
    
    test('el metodo getListGrupoReservas debe ser llamado', () {
      // arrenge
      when(getListGrupoReservas.getListGrupoReservas(any, any)).thenReturn(tListGrupoReservas);
      // act
      bloc.add(ListUpdateEvent());
      // assert
      verify(getListGrupoReservas.getListGrupoReservas(tListaReserva, page));
    });
  });
  

} 