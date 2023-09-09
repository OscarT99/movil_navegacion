import 'package:flutter/material.dart';
import 'package:portal_de_empleo/presentation/screens/ofertas_empleo/register_employment.dart';
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
            child: Text('',style: TextStyle(fontSize: 30)),
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/preparacion.entrevista-turistium.jpg'),
            ),
          ),
        ),          
          ListTile(
            leading: Icon(Icons.home,color: Colors.black),
            title: Text('Inicio',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => PrimeraPagina()));
            }
          ),

          ListTile(
            leading: Icon(Icons.search,color: Colors.black),
            title: Text('Empleos disponibles',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => secondPage()));
            }
          ),

          ListTile(
            leading: Icon(Icons.work,color: Colors.black),
            title: Text('Empleos recomendados',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => TreePage()));
            }
          ),
            
        ],
      ),
    );
  }
}