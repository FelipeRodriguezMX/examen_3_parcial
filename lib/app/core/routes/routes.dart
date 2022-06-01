import 'package:examen/app/core/core_domain/entities/entites.dart';
import 'package:examen/app/features/formularios/formularios.dart';
import 'package:examen/app/features/formularios/presentation/marcas/marcas.dart';
import 'package:examen/app/features/formularios/presentation/vehiculos/vehiculos.dart';
import 'package:examen/app/features/vehiculos/presentation/vehiculo_data.dart';
import 'package:examen/app/features/vehiculos/vehiculos.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/home.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute<dynamic>(builder: (context) => const Home());
      case '/vehiculos':
        return MaterialPageRoute<dynamic>(
            builder: (context) => const VehiculosPage());
      case '/settings':
        return MaterialPageRoute<dynamic>(
            builder: (context) => const FormsPage());
      case '/formsListMarcas':
        return MaterialPageRoute<dynamic>(
            builder: (context) => const MarcasConfig());
      case '/formsListVehiculos':
        return MaterialPageRoute<dynamic>(
            builder: (context) => const VehiculosConfig());
      case '/vehiculoData':
        if (args is Vehiculo) {
          return MaterialPageRoute<dynamic>(
            builder: (context) => VehiculoData(data: args),
          );
        }
        break;
      default:
        return _errorRoute();
    }
    return null;
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('ERROR'),
            centerTitle: true,
          ),
          body: const Center(
            child: Text('Pagina no encontrada'),
          ),
        );
      },
    );
  }
}
