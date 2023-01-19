import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:woki_partner/features/reserva/domain/entities/reserva.dart';
import 'package:woki_partner/features/reserva/infrastructure/models/reserva_model.dart';
import 'package:woki_partner/features/user/infrastructure/models/client_data_model.dart';

// import '../../../../../lib/core/fixtures/fixture_reader.dart';

void main() {
  final tReservaModel = ReservaModel(
      clientData: [
        ClientDataModel(
            email: 'joaquingoroso@gmail.com',
            id: '9in4AwY6avasO6zrGS1YmWC3wGk2',
            name: 'Joaquín Goroso',
            phone: '2254419994',
            token:
                'fs60tvOMYUIttHvK8bx34N:APA91bEAWNNEEK3QLBI7Fi-53bOTNGUvTmw5jybZ7FoldnqTb6L264cLVq3D-gP6S-fJ5stT5Gsj-w039kYflny3pRo8qEprNsYf79RhaMRGJ3d9eN647AOchjqeoskD9eoTiSOGcEc7')
      ],
      comment: '',
      day: '2023-01-08T22:00:00Z',
      quantity: 3,
      sector: 'Patio',
      showDay: '2023-01-08T22:00:00Z',
      state: 8);

  test('Deberia extender de la entidad Reserva', () {
    // assert
    expect(tReservaModel, isA<Reserva>());
  });

  // group('fromJson', () {
  //   test('retorna un ReservaModel valido cuando recibe un Json', () {
  //     // arrenge
  //     final List<dynamic> listaMaps =
  //         json.decode(fixture('datos_prueba_tecnica.json'));
  //     final jsonMap = listaMaps[0];
  //     // act
  //     final result = ReservaModel.fromMap(jsonMap);
  //     // assert
  //     expect(result, tReservaModel);
  //   });
  // });

  group('toJson', () {
    test('retorna un Json valido cuando recibe un ReservaModel', () {
      // act
      final result = tReservaModel.toMap();
      // assert
      final jsonExpected = {
        "clientData": [
          {
            "email": 'joaquingoroso@gmail.com',
            "id": '9in4AwY6avasO6zrGS1YmWC3wGk2',
            "name": 'Joaquín Goroso',
            "phone": '2254419994',
            "token":'fs60tvOMYUIttHvK8bx34N:APA91bEAWNNEEK3QLBI7Fi-53bOTNGUvTmw5jybZ7FoldnqTb6L264cLVq3D-gP6S-fJ5stT5Gsj-w039kYflny3pRo8qEprNsYf79RhaMRGJ3d9eN647AOchjqeoskD9eoTiSOGcEc7'
          }
      ],
      "comment": '',
      "day": '2023-01-08T22:00:00Z',
      "quantity": 3,
      "sector": 'Patio',
      "showDay": '2023-01-08T22:00:00Z',
      "state": 8
      };
      expect( result, jsonExpected );
    });
  });
}
