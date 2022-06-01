import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:examen/app/core/core_domain/entities/entites.dart';
import 'package:examen/app/core/core_domain/usecases/usecases.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class MarcaProvider with ChangeNotifier {
  MarcaProvider() {
    marcas = null;
    failure = null;
  }
  List<Marca>? marcas;
  bool? failure;
  bool isLoading = true;

  final MarcaUseCases marcaUseCases = GetIt.instance();

  bool isEmpty() => marcas == null;

  void notify() => notifyListeners();

  void clear() {
    marcas = null;
    isLoading = true;
    failure = null;
  }

  void getMarcas() async {
    final either = await marcaUseCases.getAll();
    eitherCheck(either);
  }

  FutureOr<String?> create(Marca marca, BuildContext context) async {
    final either = await marcaUseCases.createMarca(marca);
    return either.fold((left) {
      return 'Error';
    }, (right) {
      getMarcas();
      Navigator.of(context).pop();
      return null;
    });
  }

  void eitherCheck(Either<bool, List<Marca>> either) {
    either.fold((left) {
      failure = true;
      isLoading = false;
      notifyListeners();
    }, (right) {
      marcas = right;
      isLoading = false;
      notifyListeners();
    });
  }
}
