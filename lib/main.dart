

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woki_partner/features/reserva/presentation/bloc/reservas/reservas_bloc.dart';
import 'package:woki_partner/features/reserva/presentation/pages/home_page.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(const MyState());
}

class MyState extends StatelessWidget {
  const MyState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<ReservasBloc>(),
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final reservasBloc = BlocProvider.of<ReservasBloc>(context);
    reservasBloc.add(GetListReservasEvent());

    return  MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'), 
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: const HomePage(),
    );
  }
}

// class TestScreen extends StatelessWidget {
//   const TestScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return   Scaffold(
//       body: GrupoTarjetas(reservas: [
//         Reserva(
//           id: '',
//          clientData: [ClientData(email: 'email', id: 'id', name: 'name', phone: 'phone', token: 'token')],
//           comment: 'comment',
//            createdAt: 'createdAt',
//             createdExpirationDate: 'createdExpirationDate',
//              createdTimestamp: 'createdTimestamp',
//               day: 'day',
//                quantity: 0,
//                 sector: Sector.PATIO,
//                  shiftsTolerance: 0,
//                   showDay: 'showDay',
//                    state: 0,
//                     updatedAt: 'updatedAt',
//                      acceptedTimestamp: 'acceptedTimestamp',
//                       confirmationPendingTimestamp: 'confirmationPendingTimestamp',
//                        arrivedTimestamp: 'arrivedTimestamp',
//                         noArrivedTimestamp: 'noArrivedTimestamp', 
//                         deletedByUserTimestamp: 'deletedByUserTimestamp',
//                          rejectedTimestamp: 'rejectedTimestamp',
//                           confirmedTimestamp: 'confirmedTimestamp', 
//                           editedByPartnerTimestamp: 'editedByPartnerTimestamp'
//                           )
//       ],)
//       );
//   }
// }

