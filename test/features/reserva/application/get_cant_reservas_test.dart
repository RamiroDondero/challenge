
import 'package:flutter_test/flutter_test.dart';
import 'package:woki_partner/features/reserva/application/get_cant_reservas.dart';
import 'package:woki_partner/features/reserva/domain/entities/reserva.dart';

void main() {
  late GetCantReservas getCantReservas;

  setUp(() {
    getCantReservas = const GetCantReservas();
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

  const cant = 1;

  group('get cant Reservas', () {
    test('debe retornar un int', () {
      // act
      final result = getCantReservas.getCantReservas(listaReservas, [4, 6, 8]);
      // assert
      expect(result, cant);
    });
  });
}
