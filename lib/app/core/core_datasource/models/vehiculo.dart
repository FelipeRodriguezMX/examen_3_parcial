part of './models.dart';

class VehiculoModel extends Vehiculo {
  VehiculoModel({
    required int? id,
    required Marca? marca,
    required String modelo,
    required String ano,
    required int? marca_id,
  }) : super(
          id: id,
          marca: marca,
          modelo: modelo,
          ano: ano,
          marca_id: marca_id,
        );

  factory VehiculoModel.fromJson(Map<String, dynamic> json) => VehiculoModel(
        id: json["id"],
        modelo: json["modelo"],
        ano: json["ano"],
        marca_id: json["marca_id"],
        marca:
            (json['marca'] == null) ? null : MarcaModel.fromJson(json["marca"]),
      );
}
