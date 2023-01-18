import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:woki_partner/core/platform/mobile/network_info.dart';
import 'package:woki_partner/features/reserva/application/get_cant_reservas.dart';
import 'package:woki_partner/features/reserva/application/get_list_grupo_reservas.dart';
import 'package:woki_partner/features/reserva/application/get_list_reservas.dart';
import 'package:woki_partner/features/reserva/domain/repositories/reserva_repository.dart';
import 'package:woki_partner/features/reserva/infrastructure/repositories/reserva_respository_impl.dart';

import 'package:woki_partner/features/reserva/presentation/bloc/reservas/reservas_bloc.dart';

import 'features/reserva/infrastructure/datasources/reserva_remote_data_source.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ! Feature - Reservas
  initFeatures();
  // ! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
  // ! External
}

void initFeatures() {
  sl.registerFactory(() => ReservasBloc(
      getLisTReservas: sl(),
      getListGrupoReservas: sl(),
      getCantidadReservas: sl()));

  //useCases
  sl.registerLazySingleton(() => GetLisTReservas(repository: sl()));
  sl.registerLazySingleton(() => const GetListGrupoReservas());
  sl.registerLazySingleton(() => const GetCantReservas());
  //repository
  sl.registerLazySingleton<ReservaRepository>(() => ReservaRepositoryImpl(
        remoteDataSource: sl(),
        networkInfo: sl(),
      ));

  //datasources
  sl.registerLazySingleton<ReservaRemoteDataSource>(
      () => ReservaRemoteDataSourceImpl());
}
