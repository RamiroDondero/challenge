import '../models/reserva_model.dart';

abstract class ReservaLocalDataSource {
  /// vamos a buscar la ultimaa lista [List<ReservaModel>] almacenada en cache;
  ///
  /// en caso de error arroja [CacheException]
  Future<List<ReservaModel>> getLastListReservaModel();
  Future<void> cacheListReservaModel(List<ReservaModel> lista);
}


