import 'dart:developer';

import 'package:examen/app/core/core_domain/entities/entites.dart';
import 'package:examen/app/core/core_presentation/global_states/marca_provider.dart';
import 'package:examen/app/core/core_presentation/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MarcasConfig extends StatefulWidget {
  const MarcasConfig({Key? key}) : super(key: key);

  @override
  State<MarcasConfig> createState() => _MarcasConfigState();
}

class _MarcasConfigState extends State<MarcasConfig> {
  @override
  void initState() {
    super.initState();
    context.read<MarcaProvider>().clear();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController marcaController = TextEditingController();

  Future<void> guardar(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;
    final marca = Marca(id: null, marca: marcaController.text);

    final result = await Provider.of<MarcaProvider>(context, listen: false)
        .create(marca, context);
    if (result != null) return log(result);
    marcaController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SimplePage(
      child: body(context),
      appBar: AppBar(
        title: const Text('Marcas'),
        elevation: 3,
      ),
      bottomAppBar: const BottomAppBar(
        elevation: 3,
        shape: CircularNotchedRectangle(),
        color: Colors.blue,
        child: BlankBottomAppBar(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showModal('Guardar', 'Crear marca'),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget body(BuildContext context) {
    final marcaProvider = Provider.of<MarcaProvider>(context, listen: true);
    if (marcaProvider.isEmpty() && marcaProvider.isLoading == true) {
      marcaProvider.getMarcas();
      return const Center(child: CircularProgressIndicator());
    }
    if (marcaProvider.failure == true && marcaProvider.isLoading == false) {
      return const Center(child: Text('Hubo un error'));
    }
    if (marcaProvider.failure == true && marcaProvider.isLoading == false) {
      return const Center(child: Text('Hubo un error'));
    }
    if (marcaProvider.marcas!.isEmpty && marcaProvider.isLoading == false) {
      return const Center(child: Text('No hay marcas'));
    }
    return ListView.builder(
      itemCount: marcaProvider.marcas!.length,
      itemBuilder: (context, index) {
        return Card(
          child: InkWell(
            onTap: () {},
            child: ListTile(
              title: Text(marcaProvider.marcas![index].marca),
              trailing: CustomIconButton(icon: Icons.edit, onPress: () {}),
            ),
          ),
        );
      },
    );
  }

  Future<void> _showModal(String buttonText, String title) async {
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
                  controller: marcaController,
                  hintText: 'Marca',
                  label: 'Marca',
                  validator: (String value) =>
                      (value.isEmpty) ? 'Campo vació' : null,
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
