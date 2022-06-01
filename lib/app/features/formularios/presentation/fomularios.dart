import 'package:examen/app/core/core_presentation/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';

class FormsPage extends StatelessWidget {
  const FormsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimplePage(
      child: body(context),
      appBar: AppBar(
        title: const Text('Forms'),
        elevation: 3,
      ),
    );
  }

  Widget body(BuildContext context) {
    return Column(
      children: [
        CustomElevatedButton(
            title: 'Marcas',
            onPressed: () =>
                Navigator.of(context).pushNamed('/formsListMarcas')),
        CustomElevatedButton(
            title: 'Vehiculos',
            onPressed: () =>
                Navigator.of(context).pushNamed('/formsListVehiculos')),
      ],
    );
  }
}
