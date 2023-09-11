// import 'package:flutter/material.dart';                                                                                                                   
// import 'package:portal_de_empleo/presentation/screens/ofertas_empleo/second_page.dart';
// import 'package:portal_de_empleo/presentation/screens/third_page.dart';
// import '../screens/home_page.dart';


// class MenuDrawer extends StatelessWidget {
//   const MenuDrawer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         children: [
//           const DrawerHeader(
//             child: Text('',style: TextStyle(fontSize: 30)),
//             decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/job.png'),
//             ),
//           ),
//         ),          
//           ListTile(
//             leading: Icon(Icons.home,color: Colors.black),
//             title: Text('Inicio',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
//             onTap: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context) => PrimeraPagina()));
//             }
//           ),

//           ListTile(
//             leading: Icon(Icons.search,color: Colors.black),
//             title: Text('Empleos disponibles',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
//             onTap: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context) => secondPage()));
//             }
//           ),

//           ListTile(
//             leading: Icon(Icons.work,color: Colors.black),
//             title: Text('Empleos recomendados',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
//             onTap: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context) => TreePage()));
//             }
//           ),
            
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:portal_de_empleo/presentation/screens/login/login.dart';
import 'package:portal_de_empleo/presentation/screens/ofertas_empleo/second_page.dart';
import 'package:portal_de_empleo/presentation/screens/third_page.dart';
import '../screens/home_page.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text('', style: TextStyle(fontSize: 30)),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/job.png'),
                fit: BoxFit.cover, // Ajusta la imagen para cubrir completamente el espacio del DrawerHeader
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.black),
            title: Text('Inicio', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PrimeraPagina()));
            },
          ),
          ListTile(
            leading: Icon(Icons.search, color: Colors.black),
            title: Text('Empleos disponibles', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => secondPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.work, color: Colors.black),
            title: Text('Empleos recomendados', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TreePage()));
            },
          ),
          Divider(), // Línea divisoria entre los elementos existentes y "Cerrar Sesión"
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.black),
            title: Text('Cerrar Sesión', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            onTap: () {
              // Navegar a la página de inicio de sesión
              Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
            },
          ),
        ],
      ),
    );
  }
}
