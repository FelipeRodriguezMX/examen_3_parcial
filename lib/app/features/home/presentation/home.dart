import 'package:examen/app/core/core_presentation/global_states/marca_provider.dart';
import 'package:examen/app/core/core_presentation/global_widgets/global_widgets.dart';
import 'package:examen/app/features/home/presentation/marca_vehiculos.dart';
// import 'package:examen/app/core/sql_lite/fill_data.dart';
import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    context.read<MarcaProvider>().clear();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SimplePage(
        child: body(context),
        appBar: AppBar(
          title: const Text('Marcas'),
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
    // return MovieList(movies: marcaProvider.movies!);
    return ListView.builder(
      itemCount: marcaProvider.marcas!.length,
      itemBuilder: (context, index) {
        return Card(
          child: InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => VehiculosPage(
                        marcaId: marcaProvider.marcas![index].id!,
                      )),
            ),
            child: ListTile(
              title: Text('Marca: ${marcaProvider.marcas![index].marca}'),
            ),
          ),
        );
      },
    );
  }
}
