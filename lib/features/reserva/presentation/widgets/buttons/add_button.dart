import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:woki_partner/core/constants/custom_theme_data.dart';

import '../widgets.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Container(
                decoration: CustomThemeData.formDraggable,
                child: DraggableScrollableSheet(
                  initialChildSize: 0.83,
                  maxChildSize: 0.83,
                  minChildSize: 0.0,
                  expand: false,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return const FormListaEspera();
                  },
                ));
          },
        );
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
            color: CustomThemeData.addButton, shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.only(top:14, right:9, left:15, bottom: 14.73),
              child: SvgPicture.asset('assets/add.svg',width:26 , height:21.27),
            ),
      ),
    );
  }
}
