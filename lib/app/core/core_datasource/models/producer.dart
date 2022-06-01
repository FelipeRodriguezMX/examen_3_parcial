part of './models.dart';

class MarcaModel extends Marca {
  MarcaModel({
    required int? id,
    required String marca,
  }) : super(
          id: id,
          marca: marca,
        );
  factory MarcaModel.fromJson(Map<String, dynamic> json) => MarcaModel(
        id: json["id"],
        marca: json["marca"],
      );
}
