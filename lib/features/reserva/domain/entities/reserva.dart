import 'package:equatable/equatable.dart';

import '../../../user/domain/entity/client_data.dart';

class Reserva extends Equatable {

  final List<ClientData> clientData;
  final String comment;
  final String day;
  final int quantity;
  final String sector;
  final String showDay;
  final int state;
  final String horaReserva;
  
  const Reserva({
    this.horaReserva = '',
    required this.clientData,
    required this.comment,
    required this.day,
    required this.quantity,
    required this.sector,
    required this.showDay,
    required this.state,
  });

  Reserva copyWith({
    List<ClientData>? clientData,
    String? comment,
    String? day,
    int? quantity,
    String? sector,
    String? showDay,
    int? state,
    String? horaReserva
  }) =>
      Reserva(
          horaReserva: horaReserva ?? this.horaReserva,
          clientData: clientData ?? this.clientData,
          comment: comment ?? this.comment,
          day: day ?? this.day,
          quantity: quantity ?? this.quantity,
          sector: sector ?? this.sector,
          showDay: showDay ?? this.showDay,
          state: state ?? this.state);
          
            
            
  @override
  List<Object?> get props => [
    clientData,
    comment,
    day,
    quantity,
    sector,
    showDay,
    state,
    horaReserva
  ];
}
