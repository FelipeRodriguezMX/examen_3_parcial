part of './repositorys.dart';

class MarcaRepositoryImplementation extends IMarcaRepository {
  MarcaRepositoryImplementation({required this.sqlHelper});
  ISqlHelper sqlHelper;

  @override
  Future<Either<bool, bool>> createMarca(Marca marca) async {
    try {
      final query = 'INSERT INTO Marca (marca) VALUES ("${marca.marca}")';
      final result = await sqlHelper.insert(query: query);
      if (result == true) return const Right(true);
      return const Left(false);
    } catch (e) {
      return const Left(false);
    }
  }

  @override
  Future<Either<bool, List<Marca>>> getAllMarca() async {
    try {
      const query = 'SELECT * FROM Marca';
      final result = await sqlHelper.get(query);
      if (result.isEmpty) return const Right([]);
      final marcas = result.map((item) => MarcaModel.fromJson(item)).toList();
      return Right(marcas);
    } catch (e) {
      return const Left(false);
    }
  }
}
