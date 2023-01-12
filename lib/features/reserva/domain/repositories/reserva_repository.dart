import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/reserva.dart';


abstract class ReservaRepository {
  Future<Either<Failure, List<Reserva>>> getListReservas();
}
