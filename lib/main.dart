import 'package:examen/app/core/core_presentation/global_states/marca_provider.dart';
import 'package:examen/app/core/core_presentation/global_states/vehiculo_provider.dart';
import 'package:examen/app/core/routes/routes.dart';
import 'package:examen/app/core/sql_lite/sql_helper.dart';
import 'package:examen/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

void main() {
  mainInjectionContainer();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    ISqlHelper iSqlHelper = GetIt.instance();
    iSqlHelper.database();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MarcaProvider()),
        ChangeNotifierProvider(create: (context) => VehiculoProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
