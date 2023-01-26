
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:woki_partner/core/platform/mobile/network_info.dart';
import 'package:woki_partner/core/utils/agrupador_reservas.dart';
import 'package:woki_partner/core/utils/contador_reservas.dart';
import 'package:woki_partner/core/utils/filtrador_reservas.dart';
import 'package:woki_partner/core/utils/horario_Utc.dart';
import 'package:woki_partner/core/utils/indicador_state.dart';
import 'package:woki_partner/core/utils/maths.dart';
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
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectivity: sl()));
  sl.registerLazySingleton(() => const ContadorReservas());
  sl.registerLazySingleton(() => AgrupadorReservas(maths: sl()));
  sl.registerLazySingleton(() => const FiltradorReservas());
  sl.registerLazySingleton(() => const HorarioUtc());
  sl.registerLazySingleton(() => const IndicadorState());
  sl.registerLazySingleton(() => const Maths());

  // ! External
  sl.registerLazySingleton(() => Connectivity());
}

void initFeatures() {
  sl.registerFactory(() => ReservasBloc(
      getLisTReservas: sl(),
      agrupadorReservas: sl(),
      contadorReservas: sl(),
      filtradorReservas: sl(),
      horario: sl(),
      indicadorstate: sl()));

  //useCases
  sl.registerLazySingleton(() => GetLisTReservas(repository: sl()));
  //repository
  sl.registerLazySingleton<ReservaRepository>(() => ReservaRepositoryImpl(
        remoteDataSource: sl(),
        networkInfo: sl(),
      ));

  //datasources
  sl.registerLazySingleton<ReservaRemoteDataSource>(
      () => ReservaRemoteDataSourceImpl());
}
