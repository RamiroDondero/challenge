import 'package:woki_partner/core/error/exception.dart';
import 'package:woki_partner/core/platform/mobile/network_info.dart';
import 'package:woki_partner/features/reserva/domain/entities/reserva.dart';
import 'package:woki_partner/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:woki_partner/features/reserva/domain/repositories/reserva_repository.dart';
import 'package:woki_partner/features/reserva/infrastructure/datasources/reserva_remote_data_source.dart';

class ReservaRepositoryImpl extends ReservaRepository {
  final NetworkInfo networkInfo;
  final ReservaRemoteDataSource remoteDataSource;

  ReservaRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<Reserva>>> getListReservas() async {
    if (await networkInfo.isConnected()) {
      try {
        final listaReservas = await remoteDataSource.getListReserva();
        return Right(listaReservas);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return  const Right([]);
    }
  }
}
