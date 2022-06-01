import 'dart:developer';

import 'package:examen/app/core/core_domain/entities/entites.dart';
import 'package:examen/app/core/core_presentation/global_states/vehiculo_provider.dart';
import 'package:examen/app/core/core_presentation/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VehiculoData extends StatefulWidget {
  const VehiculoData({Key? key, required this.data}) : super(key: key);
  final Vehiculo data;

  @override
  State<VehiculoData> createState() => _VehiculoDataState();
}

class _VehiculoDataState extends State<VehiculoData> {
  Marca? _marca;
  @override
  void initState() {
    super.initState();
    getMarca();
  }

  getMarca() async {
    inspect(widget.data.marca_id);
    final marca = await Provider.of<VehiculoProvider>(context, listen: true)
        .getMarca(widget.data.marca_id!, context);
    setState(() {
      _marca = marca;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SimplePage(
      appBar: AppBar(
        title: const Text('Películas'),
        elevation: 3,
      ),
      child: Center(
        child: Column(
          children: [
            const Text('Modelo'),
            Text(
              widget.data.modelo,
              style: const TextStyle(fontSize: 20),
            ),
            const Text('Año'),
            Text(
              widget.data.ano,
              style: const TextStyle(fontSize: 20),
            ),
            if (_marca != null) Text(_marca!.marca),
          ],
        ),
      ),
    );
  }
}
