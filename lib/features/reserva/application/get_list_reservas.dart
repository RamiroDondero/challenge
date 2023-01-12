import 'package:dartz/dartz.dart';
import 'package:woki_partner/features/reserva/application/usecase.dart';
import 'package:woki_partner/features/reserva/domain/repositories/reserva_repository.dart';

import '../../../core/error/failures.dart';
import '../domain/entities/reserva.dart';

class GetLisTReservas implements UseCase<List<Reserva>, NoParams> {
  final ReservaRepository repository;

  GetLisTReservas({required  this.repository});

  @override
  Future<Either<Failure, List<Reserva>>> call(noParams) {
    return repository.getListReservas();
  }
}
