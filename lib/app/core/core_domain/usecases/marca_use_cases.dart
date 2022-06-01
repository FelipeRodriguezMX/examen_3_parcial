part of './usecases.dart';

class MarcaUseCases {
  MarcaUseCases(this.repository);
  final IMarcaRepository repository;

  Future<Either<bool, bool>> createMarca(Marca marca) =>
      repository.createMarca(marca);

  Future<Either<bool, List<Marca>>> getAll() => repository.getAllMarca();
}
