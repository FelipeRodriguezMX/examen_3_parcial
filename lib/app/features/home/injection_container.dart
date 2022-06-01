import 'package:examen/app/core/core_datasource/repositorys/repositorys.dart';
import 'package:examen/app/core/core_domain/repositorys/repositorys.dart';
import 'package:examen/app/core/core_domain/usecases/usecases.dart';
import 'package:examen/app/core/sql_lite/sql_helper.dart';
import 'package:examen/injection_container.dart';

void homeInjectionContainer() {
  getIt
    ..registerLazySingleton<IMarcaRepository>(
      () => MarcaRepositoryImplementation(
        sqlHelper: getIt<ISqlHelper>(),
      ),
    )
    ..registerLazySingleton<IVehiculoRepository>(
      () => VehiculoRepositoryImplementation(
        sqlHelper: getIt<ISqlHelper>(),
      ),
    )
    ..registerLazySingleton<MarcaUseCases>(
      () => MarcaUseCases(
        getIt<IMarcaRepository>(),
      ),
    )
    ..registerLazySingleton<VehiculoUseCases>(
      () => VehiculoUseCases(
        getIt<IVehiculoRepository>(),
      ),
    );
}
