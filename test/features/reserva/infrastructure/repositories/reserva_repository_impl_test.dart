import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:woki_partner/core/error/exception.dart';
import 'package:woki_partner/core/error/failures.dart';
import 'package:woki_partner/core/platform/mobile/network_info.dart';
import 'package:woki_partner/features/reserva/domain/entities/reserva.dart';
import 'package:woki_partner/features/reserva/infrastructure/datasources/reserva_remote_data_source.dart';
import 'package:woki_partner/features/reserva/infrastructure/models/reserva_model.dart';
import 'package:woki_partner/features/reserva/infrastructure/repositories/reserva_respository_impl.dart';

import 'reserva_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NetworkInfo>()])
@GenerateNiceMocks([MockSpec<ReservaRemoteDataSource>()])
void main() {
  late MockNetworkInfo networkInfo;
  late MockReservaRemoteDataSource remoteDataSource;
  late ReservaRepositoryImpl repository;

  setUp(() {
    networkInfo = MockNetworkInfo();
    remoteDataSource = MockReservaRemoteDataSource();
    repository = ReservaRepositoryImpl(
        remoteDataSource: remoteDataSource,
        networkInfo: networkInfo);
  });

  group('get Lista Reservas', () {
    const tReservaModel = ReservaModel(
        clientData: [],
        comment: '',
        day: '',
        quantity: 0,
        sector: '',
        showDay: '',
        state: 0);

    final List<ReservaModel> listaReservaModel = [tReservaModel];

    final List<Reserva> listaReserva = listaReservaModel;

    test(
      "verificar si el dispositivo esta en linea",
      () {
        // arrenge
        when(networkInfo.isConnected()).thenAnswer((_) async => true);
        // act
        repository.getListReservas();
        // assert
        verify(networkInfo.isConnected());
      },
    );

    group('si el dispositivo esta en linea', () {
      setUp(() {
        when(networkInfo.isConnected()).thenAnswer((_) async => true);
      });

      test(
          'debe retornar una lista de Reservas cuando se invoca ReservaRemoteDataSource',
          () async {
        // arrenge
        when(remoteDataSource.getListReserva())
            .thenAnswer((_) async => listaReservaModel);
        // act
        final result = await repository.getListReservas();
        // assert
        verify(remoteDataSource.getListReserva());
        expect(result, Right(listaReserva));
      });
     
    });

    test(
        'debe retornar un ServerFailure si remoteReservasDataSource devuelve un Server Exception',
        () async {
      // arrenge
      when(networkInfo.isConnected()).thenAnswer((_) async => true);
      when(remoteDataSource.getListReserva()).thenThrow(ServerException());
      // act
      final result = await repository.getListReservas();
      // assert
      expect(result, Left(ServerFailure()));
    });

    group('si el dispositivo esta en offline', () {
      setUp(() {
        when(networkInfo.isConnected()).thenAnswer((_) async => false);
      });

    });
  });
}
