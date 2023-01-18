import 'package:equatable/equatable.dart';

class ClientData extends Equatable {
  
    final String email;
    final String id;
    final String name;
    final String phone;
    final String token;

  const ClientData({
        required this.email,
        required this.id,
        required this.name,
        required this.phone,
        required this.token,
    });
    
      @override  
      List<Object?> get props =>[ 
        email,
        id,
        name,
        phone,
        token
      ];

}