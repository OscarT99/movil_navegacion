import 'dart:io';

import 'package:flutter/material.dart';
import 'package:portal_de_empleo/presentation/screens/ofertas_empleo/register_employment.dart';
import 'package:portal_de_empleo/presentation/widgets/menu_appbar.dart';
import 'package:portal_de_empleo/presentation/widgets/menu_drawer.dart';
import '../../../datas/employment/employment_list.dart';
import '../../../domain/models/employment/employment.dart';

class secondPage extends StatefulWidget {
  const secondPage({super.key});

  @override
  State<secondPage> createState() => _secondPageState();
}

class _secondPageState extends State<secondPage> {
  int paginaActual = 1;
  int elementosPorPagina = 6;

  // Reemplaza vacantes por jobOffers

  List<Employment> obtenerElementosPaginaActual() {
    int indiceInicio = (paginaActual - 1) * elementosPorPagina;
    int indiceFin = indiceInicio + elementosPorPagina;

    if (indiceInicio >= jobOffers.length) {
      return [];
    }

    if (indiceFin > jobOffers.length) {
      indiceFin = jobOffers.length;
    }

     return jobOffers.sublist(indiceInicio, indiceFin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MenuAppBar(),
      drawer: MenuDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${jobOffers.length} ofertas de empleo',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterEmployment()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: const EdgeInsets.all(16.0),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_circle, size: 24.0),
                      SizedBox(width: 10.0),
                      Text(
                        'Agregar',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: obtenerElementosPaginaActual().length,
              itemBuilder: (BuildContext context, int indice) {
                Employment empleo = obtenerElementosPaginaActual()[indice];
                return GestureDetector(
                  onTap: () {
                    _mostrarDetalleEmpleo(empleo);
                  },
                  child: Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      title: Text(
                        '${empleo.name}',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'N° Vacantes: ${empleo.numberOfVacancies}',
                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                  ),
                                  Icon(Icons.people_outline)
                                ],
                              ),
                              Text(
                                'Estado: ${empleo.state ? 'Activo' : 'Inactivo'}',
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: paginaActual > 1
                    ? () {
                        setState(() {
                          paginaActual--;
                        });
                      }
                    : null,
                icon: Icon(Icons.arrow_back),
              ),
              Text('Página $paginaActual'),
              IconButton(
                onPressed: (paginaActual * elementosPorPagina) < jobOffers.length
                    ? () {
                        setState(() {
                          paginaActual++;
                        });
                      }
                    : null,
                icon: Icon(Icons.arrow_forward),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _mostrarDetalleEmpleo(Employment empleo) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detalles del Empleo'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.file(
                  File(empleo.image),
                  height: 200,
                  width: 400,                  
                ),
                const SizedBox(height: 20,),
                Text('Nombre: ${empleo.name}'),
                Text('Descripción: ${empleo.description}'),
                Text('Número de Vacantes: ${empleo.numberOfVacancies}'),
                Text('Estado: ${empleo.state ? 'Activo' : 'Inactivo'}'),
                Text('Fecha de Publicación: ${empleo.publicationDate.toString()}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _eliminarEmpleo(empleo);
                Navigator.of(context).pop();
              },
              child: Text('Eliminar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  void _eliminarEmpleo(Employment empleo) {
    setState(() {
      jobOffers.remove(empleo);
    });
  }
}
