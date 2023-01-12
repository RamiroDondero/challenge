import 'dart:convert';

import 'package:woki_partner/features/reserva/infrastructure/models/client_data_model.dart';

import '../../domain/entities/reserva.dart';


class ReservaModel extends Reserva {

  final List<ClientDataModel?>? clientData;

  ReservaModel({
    required super.id,
    required this.clientData,
    required super.comment,
    required super.createdAt,
    required super.createdExpirationDate,
    required super.createdTimestamp,
    required super.day,
    super.partnerComment,
    required super.quantity,
    required super.sector,
    required super.shiftsTolerance,
    required super.showDay,
    required super.state,
    required super.updatedAt,
    required super.acceptedTimestamp,
    required super.confirmationPendingTimestamp,
    required super.arrivedTimestamp,
    required super.noArrivedTimestamp,
    required super.deletedByUserTimestamp,
    required super.rejectedTimestamp,
    required super.confirmedTimestamp,
    required super.editedByPartnerTimestamp,
  }) : super(clientData: clientData);

  factory ReservaModel.fromJson(String str) =>
      ReservaModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReservaModel.fromMap(Map<String, dynamic> json) => ReservaModel(
        id: json["id"],
        clientData: json["clientData"] == null 
            ? [] 
            : List<ClientDataModel?>.from( json["clientData"]!.map((x) => ClientDataModel.fromMap(x))),
        comment: json["comment"],
        createdAt: json["createdAt"],
        createdExpirationDate: json["createdExpirationDate"],
        createdTimestamp: json["createdTimestamp"],
        day: json["day"],
        quantity: json["quantity"],
        sector: sectorValues.map[json["sector"]],
        shiftsTolerance: json["shiftsTolerance"],
        showDay: json["showDay"],
        state: json["state"],
        updatedAt: json["updatedAt"],
        acceptedTimestamp: json["acceptedTimestamp"],
        confirmationPendingTimestamp: json["confirmationPendingTimestamp"],
        arrivedTimestamp: json["arrivedTimestamp"],
        noArrivedTimestamp: json["noArrivedTimestamp"],
        deletedByUserTimestamp: json["deletedByUserTimestamp"],
        rejectedTimestamp: json["rejectedTimestamp"],
        confirmedTimestamp: json["confirmedTimestamp"],
        editedByPartnerTimestamp: json["editedByPartnerTimestamp"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "clientData": clientData == null
            ? []
            : List<dynamic>.from(clientData!.map((x) => x!.toMap())),
        "comment": comment,
        "createdAt": createdAt,
        "createdExpirationDate": createdExpirationDate,
        "createdTimestamp": createdTimestamp,
        "day": day,
        "partnerComment": partnerComment,
        "quantity": quantity,
        "sector": sectorValues.reverse![sector],
        "shiftsTolerance": shiftsTolerance,
        "showDay": showDay,
        "state": state,
        "updatedAt": updatedAt,
        "acceptedTimestamp": acceptedTimestamp,
        "confirmationPendingTimestamp": confirmationPendingTimestamp,
        "arrivedTimestamp": arrivedTimestamp,
        "noArrivedTimestamp": noArrivedTimestamp,
        "deletedByUserTimestamp": deletedByUserTimestamp,
        "rejectedTimestamp": rejectedTimestamp,
        "confirmedTimestamp": confirmedTimestamp,
        "editedByPartnerTimestamp": editedByPartnerTimestamp,
      };
}

final sectorValues = EnumValues({"Patio": Sector.PATIO, "Salon": Sector.SALON});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}



// class ReservaModel {
//     ReservaModel({
//         required this.id,
//         // required this.bookingNotification,
//         required this.clientData,
//         required this.comment,
//         required this.createdAt,
//         required this.createdExpirationDate,
//         required this.createdTimestamp,
//         required this.day,
//         // required this.editionExpirationDate,
//         // required this.multipleTablesAssigned,
//         // required this.oldData,
//         // required this.originalBookingData,
//          this.partnerComment,
//         // required this.partnerId,
//         // required this.partnerName,
//         // required this.preferences,
//         // required this.providence,
//         required this.quantity,
//         required this.sector,
//         required this.shiftsTolerance,
//         required this.showDay,
//         required this.state,
//         // required this.suggestedTable,
//         // required this.timezone,
//         required this.updatedAt,
//         // required this.usersId,
//         required this.acceptedTimestamp,
//         required this.confirmationPendingTimestamp,
//         required this.arrivedTimestamp,
//         required this.noArrivedTimestamp,
//         required this.deletedByUserTimestamp,
//         required this.rejectedTimestamp,
//         required this.confirmedTimestamp,
//         required this.editedByPartnerTimestamp,
//     });

//     final String? id;
//     // final int? bookingNotification;
//     final List<ClientData?>? clientData;
//     final String? comment;
//     final DateTime? createdAt;
//     final DateTime? createdExpirationDate;
//     final DateTime? createdTimestamp;
//     final DateTime? day;
//     // final dynamic editionExpirationDate;
//     // final List<String?>? multipleTablesAssigned;
//     // final dynamic oldData;
//     // final dynamic originalBookingData;
//     final String? partnerComment;
//     // final String? partnerId;
//     // final String? partnerName;
//     // final List<dynamic>? preferences;
//     // final int? providence;
//     final int? quantity;
//     final Sector? sector;
//     final int? shiftsTolerance;
//     final DateTime? showDay;
//     final int? state;
//     // final List<dynamic>? suggestedTable;
//     // final int? timezone;
//     final DateTime? updatedAt;
//     // final List<String?>? usersId;
//     final DateTime? acceptedTimestamp;
//     final DateTime? confirmationPendingTimestamp;
//     final DateTime? arrivedTimestamp;
//     final DateTime? noArrivedTimestamp;
//     final DateTime? deletedByUserTimestamp;
//     final DateTime? rejectedTimestamp;
//     final DateTime? confirmedTimestamp;
//     final DateTime? editedByPartnerTimestamp;

//     factory ReservaModel.fromJson(String str) => ReservaModel.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory ReservaModel.fromMap(Map<String, dynamic> json) => ReservaModel(
//         id: json["id"],
//         // bookingNotification: json["bookingNotification"],
//         clientData: json["clientData"] == null ? [] : List<ClientData?>.from(json["clientData"]!.map((x) => ClientData.fromMap(x))),
//         comment: json["comment"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         createdExpirationDate: json["createdExpirationDate"],
//         createdTimestamp: json["createdTimestamp"],
//         day: DateTime.parse(json["day"]),
//         // editionExpirationDate: json["editionExpirationDate"],
//         // multipleTablesAssigned: json["multipleTablesAssigned"] == null ? [] : List<String?>.from(json["multipleTablesAssigned"]!.map((x) => x)),
//         // oldData: json["oldData"],
//         // originalBookingData: json["originalBookingData"],
//         // partnerComment: partnerCommentValues!.map[json["partnerComment"]],
//         // partnerId: partnerIdValues!.map[json["partnerId"]],
//         // partnerName: partnerNameValues!.map[json["partnerName"]],
//         // preferences: json["preferences"] == null ? [] : List<dynamic>.from(json["preferences"]!.map((x) => x)),
//         // providence: json["providence"],
//         quantity: json["quantity"],
//         sector: sectorValues.map[json["sector"]],
//         shiftsTolerance: json["shiftsTolerance"],
//         showDay: DateTime.parse(json["showDay"]),
//         state: json["state"],
//         // suggestedTable: json["suggestedTable"] == null ? [] : List<dynamic>.from(json["suggestedTable"]!.map((x) => x)),
//         // timezone: json["timezone"],
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         // usersId: json["usersId"] == null ? [] : List<String?>.from(json["usersId"]!.map((x) => x)),
//         acceptedTimestamp: json["acceptedTimestamp"],
//         confirmationPendingTimestamp: json["confirmationPendingTimestamp"],
//         arrivedTimestamp: json["arrivedTimestamp"],
//         noArrivedTimestamp: json["noArrivedTimestamp"],
//         deletedByUserTimestamp: json["deletedByUserTimestamp"],
//         rejectedTimestamp: json["rejectedTimestamp"],
//         confirmedTimestamp: json["confirmedTimestamp"],
//         editedByPartnerTimestamp: json["editedByPartnerTimestamp"],
//     );

//     Map<String, dynamic> toMap() => {
//         "id": id,
//         // "bookingNotification": bookingNotification,
//         "clientData": clientData == null ? [] : List<dynamic>.from(clientData!.map((x) => x!.toMap())),
//         "comment": comment,
//         "createdAt": createdAt?.toIso8601String(),
//         "createdExpirationDate": createdExpirationDate,
//         "createdTimestamp": createdTimestamp,
//         "day": day?.toIso8601String(),
//         // "editionExpirationDate": editionExpirationDate,
//         // "multipleTablesAssigned": multipleTablesAssigned == null ? [] : List<dynamic>.from(multipleTablesAssigned!.map((x) => x)),
//         // "oldData": oldData,
//         // "originalBookingData": originalBookingData,
//         "partnerComment": partnerComment,
//         // "partnerId": partnerIdValues.reverse![partnerId],
//         // "partnerName": partnerNameValues.reverse![partnerName],
//         // "preferences": preferences == null ? [] : List<dynamic>.from(preferences!.map((x) => x)),
//         // "providence": providence,
//         "quantity": quantity,
//         "sector": sectorValues.reverse![sector],
//         "shiftsTolerance": shiftsTolerance,
//         "showDay": showDay?.toIso8601String(),
//         "state": state,
//         // "suggestedTable": suggestedTable == null ? [] : List<dynamic>.from(suggestedTable!.map((x) => x)),
//         // "timezone": timezone,
//         "updatedAt": updatedAt?.toIso8601String(),
//         // "usersId": usersId == null ? [] : List<dynamic>.from(usersId!.map((x) => x)),
//         "acceptedTimestamp": acceptedTimestamp,
//         "confirmationPendingTimestamp": confirmationPendingTimestamp,
//         "arrivedTimestamp": arrivedTimestamp,
//         "noArrivedTimestamp": noArrivedTimestamp,
//         "deletedByUserTimestamp": deletedByUserTimestamp,
//         "rejectedTimestamp": rejectedTimestamp,
//         "confirmedTimestamp": confirmedTimestamp,
//         "editedByPartnerTimestamp": editedByPartnerTimestamp,
//     };
// }

// class ClientData {
//     ClientData({
//         required this.email,
//         required this.id,
//         required this.name,
//         required this.phone,
//         required this.token,
//     });

//     final String? email;
//     final String? id;
//     final String? name;
//     final String? phone;
//     final String? token;

//     factory ClientData.fromJson(String str) => ClientData.fromMap(json.decode(str));

//     String toJson() => json.encode(toMap());

//     factory ClientData.fromMap(Map<String, dynamic> json) => ClientData(
//         email: json["email"],
//         id: json["id"],
//         name: json["name"],
//         phone: json["phone"],
//         token: json["token"],
//     );

//     Map<String, dynamic> toMap() => {
//         "email": email,
//         "id": id,
//         "name": name,
//         "phone": phone,
//         "token": token,
//     };
// }



// enum Sector { PATIO, SALON }

// final sectorValues = EnumValues({
//     "Patio": Sector.PATIO,
//     "Salon": Sector.SALON
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String>? reverseMap;

//     EnumValues(this.map);

//     Map<T, String>? get reverse {
//         reverseMap ??= map.map((k, v) => MapEntry(v, k));
//         return reverseMap;
//     }
// }