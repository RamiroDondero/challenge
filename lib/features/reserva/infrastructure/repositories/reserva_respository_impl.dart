import 'package:woki_partner/features/reserva/domain/entities/reserva.dart';
import 'package:woki_partner/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:woki_partner/features/reserva/domain/repositories/reserva_repository.dart';
import 'package:woki_partner/features/reserva/infrastructure/datasources/reserva_remote_data_source.dart';

class ReservaRepositoryImpl extends ReservaRepository {
  final ReservaRemoteDataSource dataSource;

  ReservaRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<Reserva>>> getListReservas() async {
    return Right(await dataSource.getListReserva());
  }
}
