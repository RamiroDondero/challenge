
import '../../../user/domain/entity/client_data.dart';

class Reserva {

    final List<ClientData?>? clientData;
    final String? comment;
    final String? day;
    final int? quantity;
    final String? sector;
    final String? showDay;
    final int? state;


   Reserva({
        required this.clientData,
        required this.comment,
        required this.day,
        required this.quantity,
        required this.sector,
        required this.showDay,
        required this.state,
    });


  

}

