import 'package:flutter_test/flutter_test.dart';
import 'package:woki_partner/features/reserva/application/get_list_grupo_reservas.dart';

void main() {
  late GetListGrupoReservas getListGrupoReservas;

  setUp(() {
    getListGrupoReservas = const GetListGrupoReservas();
  });

  group('determinarState', () {
    const int currentPage = 0;
    const List state = [4, 5];
    test('debe retornar una List<int> de states cuando se pasa un currentPage',
        () {
      // act
      final result = getListGrupoReservas.determinarState(currentPage);
      // assert
      expect(result, state);
    });
  });

  group('rangoHorario', () {
    const  int number = 8;
    const String horario = '00:00hs - 03:00hs';

    test('debe retornar un String cuando se pasa un entero', () {
      // act
      final result = getListGrupoReservas.rangoHorario(number);
      // assert
      expect(result, horario);
    });
  });
}
