part of './usecases.dart';

class VehiculoUseCases {
  VehiculoUseCases(this.repository);
  final IVehiculoRepository repository;

  Future<Either<bool, bool>> createVehiculo(Vehiculo vehiculo) =>
      repository.createVehiculo(vehiculo);

  Future<Either<bool, List<Vehiculo>>> getAll() => repository.getAllVehiculos();
  Future<Either<bool, Marca>> getMarcaById(int id) =>
      repository.getMarcaById(id);
}
