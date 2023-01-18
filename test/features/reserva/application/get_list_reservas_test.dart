import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:woki_partner/features/reserva/application/get_list_reservas.dart';
import 'package:woki_partner/core/useCase/usecase.dart';
import 'package:woki_partner/features/reserva/domain/entities/reserva.dart';
import 'package:woki_partner/features/reserva/domain/repositories/reserva_repository.dart';

import 'get_list_reservas_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ReservaRepository>()])
void main() {
  late MockReservaRepository reservasRepository;

  late GetLisTReservas useCase;

  setUp(() {
    reservasRepository = MockReservaRepository();
    useCase = GetLisTReservas(repository: reservasRepository);
  });

  const reserva = Reserva(
      clientData: [],
      comment: 'comment',
      day: 'day',
      quantity: 2,
      sector: 'sector',
      showDay: 'showDay',
      state: 6);

  final List<Reserva> listaReservas = [reserva];

  test('debería traer mi lista de reservas del Repositorio', () async {
    // arrenge
    when(reservasRepository.getListReservas())
        .thenAnswer((_) async => Right(listaReservas));
    // act
    final result = await useCase(NoParams());
    // assert
    expect(result, Right(listaReservas));
    verify(reservasRepository.getListReservas());
    verifyNoMoreInteractions(reservasRepository);
  });
}
