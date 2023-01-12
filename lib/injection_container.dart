import 'package:get_it/get_it.dart';
import 'package:woki_partner/features/reserva/application/get_list_reservas.dart';
import 'package:woki_partner/features/reserva/domain/repositories/reserva_repository.dart';
import 'package:woki_partner/features/reserva/infrastructure/repositories/reserva_respository_impl.dart';

import 'package:woki_partner/features/reserva/presentation/bloc/reservas/reservas_bloc.dart';

import 'features/reserva/infrastructure/datasources/reserva_remote_data_source.dart';

final sl = GetIt.instance;

Future<void> init() async  {
  // ! Feature - Reservas
  initFeatures();
  // ! Core
  // ! External
}

void initFeatures() {
  sl.registerFactory(() => ReservasBloc(getLisTReservas: sl()));

  //useCases
  sl.registerLazySingleton(() => GetLisTReservas(repository: sl()));

  //repository
  sl.registerLazySingleton<ReservaRepository>(
      () => ReservaRepositoryImpl(dataSource: sl()));

  //datasources
  sl.registerLazySingleton<ReservaRemoteDataSource>(
      () => ReservaRemoteDataSourceImpl());
}
