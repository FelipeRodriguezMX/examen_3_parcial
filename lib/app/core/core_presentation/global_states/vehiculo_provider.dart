import 'dart:async';
import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:examen/app/core/core_domain/entities/entites.dart';
import 'package:examen/app/core/core_domain/usecases/usecases.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class VehiculoProvider with ChangeNotifier {
  VehiculoProvider() {
    vehiculos = null;
    failure = null;
  }
  List<Vehiculo>? vehiculos;
  bool? failure;
  bool isLoading = true;

  final VehiculoUseCases vehiculosUseCases = GetIt.instance();

  bool isEmpty() => vehiculos == null;

  void notify() => notifyListeners();

  void clear() {
    vehiculos = null;
    isLoading = true;
    failure = null;
  }

  void getVehiculos() async {
    final either = await vehiculosUseCases.getAll();
    inspect(either);
    eitherCheck(either);
  }

  void eitherCheck(Either<bool, List<Vehiculo>> either) {
    either.fold((left) {
      failure = true;
      isLoading = false;
      notifyListeners();
    }, (right) {
      vehiculos = right;
      isLoading = false;
      notifyListeners();
    });
  }

  FutureOr<String?> create(Vehiculo vehiculo, BuildContext context) async {
    final either = await vehiculosUseCases.createVehiculo(vehiculo);
    return either.fold((left) {
      return 'Error';
    }, (right) {
      getVehiculos();
      Navigator.of(context).pop();
      return null;
    });
  }

  Future<Marca?> getMarca(int id, BuildContext context) async {
    final either = await vehiculosUseCases.getMarcaById(id);
    return either.fold((left) {
      return null;
    }, (right) {
      Navigator.of(context).pop();
      return right;
    });
  }

  List<Vehiculo> filter(int id) {
    return vehiculos!.where((element) => element.marca_id == id).toList();
  }
}
