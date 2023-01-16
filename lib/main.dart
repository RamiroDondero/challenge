
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woki_partner/features/reserva/presentation/bloc/reservas/reservas_bloc.dart';
import 'package:woki_partner/features/reserva/presentation/pages/home_page.dart';
import 'features/reserva/presentation/widgets/cards/card_reserva.dart';
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
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: const HomePage(),
    );
  }
}


class TestScreen extends StatelessWidget {
   
  const TestScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: CardReserva(
            nombre: 'nombre',
            sector: 'ubicaion',
            personas: 9,
            telefono: 'telefonoReserva',
            checkAndDiscount: true,
            horaOespera: Text('hola'),
            bubble: true,
            ),
        ),
      )
    );
  }
}





// Center(
//         child: Stack(
//           alignment: Alignment.centerLeft,
//           children: [
//               Container(color: Colors.red , height: 120,),
//               Positioned( top: 15, left: 15, child: Container(color: Colors.blue, width: 100 , height: 100,)),
//               Positioned( top: 5, left: 8, child: CircleAvatar(radius: 12)),
//             ],),
//       ),