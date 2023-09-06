import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:portal_de_empleo/presentation/widgets/menu_appbar.dart';
import 'package:portal_de_empleo/presentation/widgets/menu_drawer.dart';

class TreePage extends StatelessWidget {
  const TreePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    List<Map<String, dynamic>> vacantesRecomendadas = [
      
      {
        'nombre': 'Desarrollador FullStack',
        'cantidadVacantes': 5,
        'estado': 'Aplica',
        'descripcion': 'Experiencia en Flutter y Spring Boot.',
        'ubicacion': 'Medellin',
      },
      {
        'nombre': 'Desarrollador java',
        'cantidadVacantes': 2,
        'estado': 'Aplica',
        'descripcion': 'Experiencia en Oracle, javaScrit, MSQL',
        'ubicacion': 'Envigado',
      },
      {
        'nombre': 'Ingeniero Software',
        'cantidadVacantes': 6,
        'estado': 'No Aplica',
        'descripcion': 'Experiencia en php y Laravel.',
        'ubicacion': 'Bogota',
      },
      {
        'nombre': 'Desarrollador Junior',
        'cantidadVacantes': 5,
        'estado': 'Aplica',
        'descripcion': 'Experiencia en Python',
        'ubicacion': 'Medellin',
      },
      {
        'nombre': 'Desarrollador Senior',
        'cantidadVacantes': 1,
        'estado': 'No Aplica',
        'descripcion': 'Experiencia en sqlSERVER Y MSQL',
        'ubicacion': 'Rio Negro',
      },
    
    ];

    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: const MenuAppBar(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('../../assets/images/fondoTreePage.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'OFERTAS RECOMENDADAS',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 300, 
                    autoPlay: true, 
                  ),
                  items: vacantesRecomendadas.map<Widget>((vacante) {
                    return Container(
                      width: double.infinity,
                      margin:const  EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        
                        
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            
                            Text(
                              vacante['nombre'] as String,
                              style:const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                            const SizedBox(height: 20,),

                            Text(
                              'Vacantes: ${vacante['cantidadVacantes']}',
                              style:const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                            const SizedBox(height: 20,),

                              Text(
                                vacante['estado'] as String,
                                  style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: vacante['estado'] == 'Aplica' ? Colors.green : Colors.red,
                                  ),
                                ),
                                const SizedBox(height: 20,),

                            Text(
                              'Descripción: ${vacante['descripcion']}',
                              style:const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                            const SizedBox(height: 20,),

                            Text(
                              'Ubicación: ${vacante['ubicacion']}',
                              style:const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),

                              const SizedBox(height: 20),
                              ElevatedButton(
                              onPressed: vacante['estado'] == 'Aplica'
                                ? () {
          
                                final snackBar = SnackBar(
                                content: const Text('POSTULACION EXITOSA'),
                                duration:const  Duration(seconds: 5), 
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                }
                                : null, 
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 46, 61, 90)
                                ),
                                child: const Text("APLICAR"),
                              ),
                          ],
                          
                        ),
                                                
                      ),
                      
                    );
                    
                  }).toList(),
                ),
                
                // const SizedBox(height: 30),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.pop(context);
                //   },
                //   child: const Text("Regresar Al Menu"),
                // ),

                
              ],
            ),
          ),
        ),
      ),
    );
  }
}