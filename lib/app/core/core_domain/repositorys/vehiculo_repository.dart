part of './repositorys.dart';

abstract class IVehiculoRepository {
  Future<Either<bool, bool>> createVehiculo(Vehiculo vehiculo);
  Future<Either<bool, List<Vehiculo>>> getAllVehiculos();
  Future<Either<bool, Marca>> getMarcaById(int id);
}
