import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:portal_de_empleo/presentation/widgets/menu_appbar.dart';
import 'package:portal_de_empleo/presentation/widgets/menu_drawer.dart';

class TreePage extends StatelessWidget {
  TreePage({Key? key}) : super(key: key);
  final List<Map<String, dynamic>> filtroOfertas = [
     {
    'empresa': 'Microsoft',
    'nombre vacante': 'Ingeniero de Software Senior',
    'requisitos': '10 años de experiencia en desarrollo de software',
    'contacto': 'contacto@microsoft.com',
    'salario': 9000000,
    'imagen': 'assets/images/microsoft.jpg',
  },
  {
    'empresa': 'Apple',
    'nombre vacante': 'Desarrollador iOS',
    'requisitos': '5 años de experiencia en desarrollo iOS',
    'contacto': 'contacto@apple.com',
    'salario': 8000000,
    'imagen': 'assets/images/apple.png',
  },
  {
    'empresa': 'Google',
    'nombre vacante': 'Ingeniero de Backend',
    'requisitos': 'Experiencia en desarrollo de sistemas backend',
    'contacto': 'contacto@google.com',
    'salario': 8500000,
    'imagen': 'assets/images/Google.jpeg',
  },
  {
    'empresa': 'Oracle',
    'nombre vacante': 'Desarrollador de Bases de Datos',
    'requisitos': 'Conocimientos avanzados en bases de datos',
    'contacto': 'contacto@oracle.com',
    'salario': 7500000,
    'imagen': 'assets/images/oracle.jpg',
  },
  
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: MenuAppBar(),
        drawer: MenuDrawer(),
        body: Container(
          child: Center(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.person_search,
                        size: 70,
                      ),
                      Text(
                        'FILTRO DE OFERTAS',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  const SizedBox(height: 10),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 600,
                      autoPlay: true,
                    ),
                    items: filtroOfertas.map<Widget>((oferta) {
                      return Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Card(
                          child: Column(
                            children: [
                              Image.asset(
                                oferta['imagen'] as String,
                                width: 220,
                                height: 220,
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.business_center,
                                  size: 20.0,
                                  color: Colors
                                      .blue, // O cualquier otro tono de gris oscuro que prefieras
                                ),
                                title: Text(
                                  oferta['empresa'] as String,
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(height: 3),
                              ListTile(
                                leading: Icon(
                                  Icons.work, // Icono de vacante
                                  size: 24.0,
                                  color: const Color.fromARGB(255, 12, 12, 12), // Color del icono
                                ),
                                title: Text(
                                  'Nombre de vacante: ${oferta['nombre vacante']}',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(height: 3),
                              ListTile(
                                leading: Icon(
                                  Icons.check_circle, // Icono de requisitos
                                  size: 24.0,
                                  color: Colors.orange, // Color del icono
                                ),
                                title: Text(
                                  'Requisitos: ${oferta['requisitos']}',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(height: 5),
                              ListTile(
                                leading: Icon(
                                  Icons.phone, // Icono de contacto
                                  size: 24.0,
                                  color: Colors.red, // Color del icono
                                ),
                                title: Text(
                                  'Contacto: ${oferta['contacto']}',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(height: 5),
                              ListTile(
                                leading: Icon(
                                  Icons.attach_money, // Icono de salario
                                  size: 24.0,
                                  color: Color.fromARGB(
                                      255, 25, 226, 42), // Color del icono
                                ),
                                title: Text(
                                  'Salario: \$${oferta['salario']}',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(height: 5),
                             ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Postulación Exitosa'),
                                        content: Text('Tu postulacion para la vacante se realizo con exito', ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Aceptar'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Text('Postularme'),
                              )
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
