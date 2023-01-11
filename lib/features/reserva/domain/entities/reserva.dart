
import 'client_data.dart';

class Reserva {

    final String? id;
    final List<ClientData?>? clientData;
    final String? comment;
    final String? createdAt;
    final String? createdExpirationDate;
    final String? createdTimestamp;
    final String? day;
    final String? partnerComment;
    final int? quantity;
    final Sector? sector;
    final int? shiftsTolerance;
    final String? showDay;
    final int? state;
    final String? updatedAt;
    final String? acceptedTimestamp;
    final String? confirmationPendingTimestamp;
    final String? arrivedTimestamp;
    final String? noArrivedTimestamp;
    final String? deletedByUserTimestamp;
    final String? rejectedTimestamp;
    final String? confirmedTimestamp;
    final String? editedByPartnerTimestamp;


   Reserva({
        required this.id,
        required this.clientData,
        required this.comment,
        required this.createdAt,
        required this.createdExpirationDate,
        required this.createdTimestamp,
        required this.day,
        this.partnerComment,
        required this.quantity,
        required this.sector,
        required this.shiftsTolerance,
        required this.showDay,
        required this.state,
        required this.updatedAt,
        required this.acceptedTimestamp,
        required this.confirmationPendingTimestamp,
        required this.arrivedTimestamp,
        required this.noArrivedTimestamp,
        required this.deletedByUserTimestamp,
        required this.rejectedTimestamp,
        required this.confirmedTimestamp,
        required this.editedByPartnerTimestamp,
    });


  

}

enum Sector { PATIO, SALON }