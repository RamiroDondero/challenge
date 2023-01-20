
import 'package:flutter/cupertino.dart';
import 'package:woki_partner/core/constants/custom_theme_data.dart';
import 'package:woki_partner/features/reserva/presentation/bloc/reservas/reservas_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woki_partner/features/reserva/presentation/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ReservasBloc, ReservasState>(
        builder: (context, state) {
          return SafeArea(
            child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  children: [
                    
                    const Padding(
                      padding:  EdgeInsets.only(right: 8),
                      child:  _AddButton(),
                    ),
        
                    const SizedBox(height: 15),
        
                    _BotonesEstadoReserva(),
        
                    const SizedBox(height: 15),

                    state.currentPage == 1 
                    ? const _ListaEsperaTitle()
                    : const SizedBox(),

          const SizedBox(height: 15),
         
          state.currentPage == 1 ? _ListaEspera() : _ListaReservas(state)
        ],
      ),
    ),
          );
        },
      ),
    );
  }
}

class _ListaEsperaTitle extends StatelessWidget {
  
  const _ListaEsperaTitle();

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const  EdgeInsets.symmetric(horizontal:8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Divider(color: CustomThemeData.greyLines),
                Text('Lista de espera' , style: CustomThemeData.horaGrupoReservas,),
                Divider(color: CustomThemeData.greyLines),
              ]
            ),
          );
  }
} 



class _AddButton extends StatelessWidget {
  const _AddButton();

  @override
  Widget build(BuildContext context) {
    return const Align(alignment: Alignment.centerRight, child: AddButton());
  }
}

class _BotonesEstadoReserva extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ReservasBloc>(context);

    final List<Map<String, dynamic>> botones = [
      {'text': 'RESERVAS', 'cant': bloc.state.reservasVivas},
      {'text': 'ESPERA', 'cant': bloc.state.cantEnListaEspera},
      {'text': 'NO VINO', 'cant': bloc.state.noConcurrieron},
      {'text': 'INGRESADOS', 'cant': bloc.state.ingreasadas},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
              4,
              (index) => GestureDetector(
                    onTap: (() {
                      bloc.add(ChangePageEvent(index));
                      bloc.add(ListUpdateEvent());
                    }),
                    child: StateButton(
                        text: botones[index]['text'],
                        cant: botones[index]['cant'],
                        selected:
                            bloc.state.currentPage == index ? true : false),
                  ))),
    );
  }
}

class _ListaReservas extends StatelessWidget {
  final ReservasState state;
  const _ListaReservas(this.state);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: state.listaReservasAgrupadas.length,
        itemBuilder: (BuildContext context, int index) {
          return state.listaReservasAgrupadas[index].reservas.isEmpty
              ? const SizedBox()
              : GrupoTarjetas(
                  grupoReservas: state.listaReservasAgrupadas[index]);
        },
      ),
    );
  }
}

class _ListaEspera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lista = BlocProvider.of<ReservasBloc>(context).state.listaEspera;
    return Expanded(child: ListView.builder(
      itemCount: lista.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(left: 8,top: 15 ,right: 8),
          child: CardReserva(
                                nombre: lista[index]['nombre'],
                                sector: lista[index]['sector'],
                                personas: lista[index]['personas'],
                                telefono: lista[index]['telefono'],
                                comentario: lista[index]['comentario'],
                                horaOespera: Row(
                                  children:
                                  lista[index]['demora'] != 0 
                                  ?
                                  [
                                    const Text('Tiempo de espera', style: CustomThemeData.subtitle),
                                    const SizedBox(width: 2),
                                    Text('${lista[index]['demora']}',style: CustomThemeData.demora)
                                  ]
                                  :
                                  [
                                    const Text('En espera de una mesa')
                                  ] 
                                ),
                                bubble: true,
                                bubbleNum: index + 1, 
                                iconHoraOcalendario: const CustomIcon(CupertinoIcons.clock),
                              ),
        );
      },
    ),);
  }
}

