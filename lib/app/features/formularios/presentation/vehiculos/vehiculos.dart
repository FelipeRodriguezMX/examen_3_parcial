import 'dart:developer';

import 'package:examen/app/core/core_domain/entities/entites.dart';
import 'package:examen/app/core/core_presentation/global_states/marca_provider.dart';
import 'package:examen/app/core/core_presentation/global_states/vehiculo_provider.dart';
import 'package:examen/app/core/core_presentation/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VehiculosConfig extends StatefulWidget {
  const VehiculosConfig({Key? key}) : super(key: key);

  @override
  State<VehiculosConfig> createState() => _VehiculosConfigState();
}

class _VehiculosConfigState extends State<VehiculosConfig> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController modeloController = TextEditingController();
  final TextEditingController anoController = TextEditingController();
  int value = 1;
  Future<void> guardar(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;
    final vehiculo = Vehiculo(
      id: null,
      modelo: modeloController.text,
      ano: anoController.text,
      marca_id: value,
      marca: null,
    );

    final result = await Provider.of<VehiculoProvider>(context, listen: false)
        .create(vehiculo, context);
    if (result != null) return log(result);
    modeloController.clear();
    anoController.clear();
    value = 1;
  }

  @override
  void initState() {
    super.initState();
    context.read<VehiculoProvider>().clear();
  }

  @override
  Widget build(BuildContext context) {
    return SimplePage(
      child: body(context),
      appBar: AppBar(
        title: const Text('Vehiculos'),
        elevation: 3,
      ),
      bottomAppBar: const BottomAppBar(
        elevation: 3,
        shape: CircularNotchedRectangle(),
        color: Colors.blue,
        child: BlankBottomAppBar(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showModal('Guardar', 'Crear vehiculo'),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget body(BuildContext context) {
    final vehiculoProvider =
        Provider.of<VehiculoProvider>(context, listen: true);
    if (vehiculoProvider.isEmpty() && vehiculoProvider.isLoading == true) {
      vehiculoProvider.getVehiculos();
      return const Center(child: CircularProgressIndicator());
    }
    if (vehiculoProvider.failure == true &&
        vehiculoProvider.isLoading == false) {
      return const Center(child: Text('Hubo un error'));
    }
    if (vehiculoProvider.failure == true &&
        vehiculoProvider.isLoading == false) {
      return const Center(child: Text('Hubo un error'));
    }
    if (vehiculoProvider.vehiculos!.isEmpty &&
        vehiculoProvider.isLoading == false) {
      return const Center(child: Text('No hay vehiculos'));
    }
    return ListView.builder(
      itemCount: vehiculoProvider.vehiculos!.length,
      itemBuilder: (context, index) {
        return Card(
          child: InkWell(
            onTap: () {},
            child: ListTile(
              title: Text(vehiculoProvider.vehiculos![index].modelo),
            ),
          ),
        );
      },
    );
  }

  Future<void> _showModal(String buttonText, String title) async {
    final marcaProvider = Provider.of<MarcaProvider>(context, listen: false);

    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(title, style: const TextStyle(fontSize: 20)),
                InputWithValidation(
                  controller: modeloController,
                  hintText: 'Modelo',
                  label: 'Modelo',
                  validator: (String value) =>
                      (value.isEmpty) ? 'Campo vació' : null,
                ),
                InputWithValidation(
                  controller: anoController,
                  hintText: 'Año',
                  label: 'Año',
                  validator: (String value) =>
                      (value.isEmpty) ? 'Campo vació' : null,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: DropdownButtonFormField(
                    value: value,
                    items: marcaProvider.marcas!
                        .map(
                          (e) => DropdownMenuItem(
                            value: e.id,
                            child: Text(e.marca),
                          ),
                        )
                        .toList(),
                    onChanged: (int? _value) {
                      log(_value.toString());
                      setState(() {
                        value = _value!;
                      });
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.red),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                CustomElevatedButton(
                    title: buttonText, onPressed: () => guardar(context)),
              ],
            ),
          ),
        );
      },
    );
  }
}
