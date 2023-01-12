import 'dart:convert';
import 'dart:io';

import 'package:woki_partner/core/error/exception.dart';

import '../models/reserva_model.dart';

abstract class ReservaRemoteDataSource {
  /// vamos a llamar al backend por peticion http
  ///
  /// en caso de error arroja [ServerException]
  Future<List<ReservaModel>> getListReserva();
}

class ReservaRemoteDataSourceImpl implements ReservaRemoteDataSource {
  @override
  Future<List<ReservaModel>> getListReserva() {
    try {
      final resp =  File('test/fixtures/datos_prueba_tecnica.json').readAsStringSync();
      final List decoded = json.decode(resp);
      final lista = decoded.map((e) => ReservaModel.fromMap(e)).toList();

      return Future.value(lista);
    } catch (e) {
      return Future.value([]);
    }
  }
}
