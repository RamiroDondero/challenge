import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woki_partner/core/custom_theme_data.dart';
import 'package:woki_partner/features/reserva/presentation/bloc/reservas/reservas_bloc.dart';
import 'features/reserva/presentation/widgets/widgets.dart';
import 'features/reserva/presentation/pages/home_page.dart';
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
      theme: CustomThemeData.customTheme,
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
   

    return const Scaffold(
        body: Text('test')
    );
  }
}
