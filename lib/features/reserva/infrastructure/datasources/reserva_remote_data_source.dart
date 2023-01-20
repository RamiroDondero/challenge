import 'dart:convert';

import 'package:woki_partner/core/error/exception.dart';

import 'package:flutter/services.dart' show rootBundle;

import '../models/reserva_model.dart';

abstract class ReservaRemoteDataSource {
  /// vamos a llamar al backend por peticion http
  ///
  /// en caso de error arroja [ServerException]
  Future<List<ReservaModel>> getListReserva();
}

class ReservaRemoteDataSourceImpl implements ReservaRemoteDataSource {
  @override
  Future<List<ReservaModel>> getListReserva() async {
    try {
      
      final String resp = await rootBundle.loadString('assets/datos_prueba_tecnica.json');
      final List decoded = json.decode(resp);
      final lista = decoded.map((e) => ReservaModel.fromMap(e)).toList();
      return Future.value(lista);
      
    } catch (e) {
      return Future.value([]);
    }
  }
}
