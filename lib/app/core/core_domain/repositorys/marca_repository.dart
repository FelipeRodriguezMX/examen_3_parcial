part of './repositorys.dart';

abstract class IMarcaRepository {
  Future<Either<bool, bool>> createMarca(Marca marca);
  Future<Either<bool, List<Marca>>> getAllMarca();
}
