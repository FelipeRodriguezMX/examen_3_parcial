part of './repositorys.dart';

class VehiculoRepositoryImplementation extends IVehiculoRepository {
  VehiculoRepositoryImplementation({required this.sqlHelper});
  ISqlHelper sqlHelper;

  @override
  Future<Either<bool, bool>> createVehiculo(Vehiculo vehiculo) async {
    try {
      final query =
          'INSERT INTO vehiculo ( modelo, ano,marca_id) VALUES ("${vehiculo.modelo}", "${vehiculo.ano}",${vehiculo.marca_id})';

      final result = await sqlHelper.insert(query: query);
      if (result == true) return const Right(true);
      return const Left(false);
    } catch (e) {
      inspect(e);
      return const Left(false);
    }
  }

  @override
  Future<Either<bool, List<Vehiculo>>> getAllVehiculos() async {
    try {
      const query = 'SELECT * FROM vehiculo';
      final result = await sqlHelper.get(query);
      if (result.isEmpty) return const Right([]);
      final vehiculos =
          result.map((item) => VehiculoModel.fromJson(item)).toList();
      return Right(vehiculos);
    } catch (e) {
      inspect(e);
      return const Left(false);
    }
  }

  @override
  Future<Either<bool, Marca>> getMarcaById(int id) async {
    try {
      final query = 'SELECT * FROM Marca WHERE id = $id';
      final result = await sqlHelper.get(query);
      final marca = MarcaModel.fromJson(result[0]);
      return Right(marca);
    } catch (e) {
      inspect(e);
      return const Left(false);
    }
  }
}
