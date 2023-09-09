import 'package:flutter/material.dart';
import 'package:portal_de_empleo/presentation/screens/ofertas_empleo/second_page.dart';
import 'package:portal_de_empleo/presentation/widgets/menu_appbar.dart';

import '../widgets/menu_drawer.dart';

class primeraPagina extends StatelessWidget {
  const primeraPagina({super.key});
  
@override
Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
      drawer: MenuDrawer(),
      appBar: MenuAppBar(),
      body: Center(
        child: Container(          
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.supervisor_account,
                    size: 40,
                    color: Colors.black,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Desarrolladores S.A.S',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Image.asset(
                '../../assets/images/oferta.jpeg',
                width: 200,
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black87,
                    ),
                    children: [
                      TextSpan(
                        text:
                            'Únete a nosotros para dar el siguiente paso en tu carrera profesional. Juntos, construiremos el futuro digital.\n',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20), // Agregamos un espacio antes del botón
              ElevatedButton(
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>secondPage(),));
                  // Acción a realizar cuando se presione el botón
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 46, 61, 90)
                ),
                child: Text('Ofertas disponibles'), // Texto del botón
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

}
