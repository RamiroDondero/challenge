import 'dart:convert';

import 'package:woki_partner/features/user/domain/entity/client_data.dart';

class ClientDataModel extends ClientData {
  
    ClientDataModel({
        required super.email,
        required super.id,
        required super.name,
        required super.phone,
        required super.token,
    });

    factory ClientDataModel.fromJson(String str) => ClientDataModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ClientDataModel.fromMap(Map<String, dynamic> json) => ClientDataModel(
        email: json["email"],
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        token: json["token"],
    );

    Map<String, dynamic> toMap() => {
        "email": email,
        "id": id,
        "name": name,
        "phone": phone,
        "token": token,
    };
}
