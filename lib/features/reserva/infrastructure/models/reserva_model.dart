import 'dart:convert';

import '../../../user/infrastructure/models/client_data_model.dart';
import '../../domain/entities/reserva.dart';

class ReservaModel extends Reserva {
  
  final List<ClientDataModel> clientData;

  const ReservaModel({
    required this.clientData,
    required super.comment,
    required super.day,
    required super.quantity,
    required super.sector,
    required super.showDay,
    required super.state,
  }) : super(clientData: clientData);

  factory ReservaModel.fromJson(String str) => ReservaModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReservaModel.fromMap(Map<String, dynamic> json) => ReservaModel(
        clientData: List<ClientDataModel>.from(
            json["clientData"].map((x) => ClientDataModel.fromMap(x))),
        comment: json["comment"] ?? '',
        day: json["day"] ?? '',
        quantity: json["quantity"] ?? '',
        sector: json["sector"] ?? '',
        showDay: json["showDay"] ?? '',
        state: json["state"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "clientData": List<dynamic>.from(clientData.map((x) => x.toMap())),
        "comment": comment,
        "day": day,
        "quantity": quantity,
        "sector": sector,
        "showDay": showDay,
        "state": state,
      };
}

