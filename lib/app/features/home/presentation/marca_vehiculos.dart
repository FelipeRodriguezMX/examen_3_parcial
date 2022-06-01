import 'package:examen/app/core/core_presentation/global_states/vehiculo_provider.dart';
import 'package:examen/app/core/core_presentation/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VehiculosPage extends StatelessWidget {
  const VehiculosPage({Key? key, required this.marcaId}) : super(key: key);
  final int marcaId;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SimplePage(
        child: body(context),
        appBar: AppBar(
          title: const Text('Vehiculos'),
          automaticallyImplyLeading: false,
          elevation: 3,
        ),
        bottomAppBar: const BottomAppBar(
          elevation: 3,
          color: Colors.blue,
          child: CustomBottomAppBar(),
        ),
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
    // return MovieList(movies: vehiculoProvider.movies!);
    return ListView.builder(
        itemCount: vehiculoProvider.filter(marcaId).length,
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              child: ListTile(
                title: Text(
                    'Model: ${vehiculoProvider.filter(marcaId)[index].modelo}'),
                subtitle:
                    Text('Año: ${vehiculoProvider.filter(marcaId)[index].ano}'),
              ),
            ),
          );
        });
  }
}
