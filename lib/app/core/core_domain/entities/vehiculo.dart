part of './entites.dart';

class Vehiculo {
  Vehiculo({
    required this.id,
    required this.marca,
    required this.modelo,
    required this.ano,
    required this.marca_id,
  });
  int? id;
  Marca? marca;
  String modelo;
  String ano;
  int? marca_id;
}
