// import 'package:flutter/material.dart';

// import '../widgets/menu_appbar.dart';
// import '../widgets/menu_drawer.dart';

// class SecondPage extends StatelessWidget {
//   const SecondPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, dynamic>> vacantes = [
//       {'nombre':'Desarrollador FullStarck','cantidadVacantes':'5','estado':'Disponible'},
//       {'nombre':'Ingeniero de Software','cantidadVacantes':'3','estado':'Disponible'},
//       {'nombre':'Diseñador informatico','cantidadVacantes':'2','estado':'Terminado'},
//       {'nombre':'Programador de Java','cantidadVacantes':'3','estado':'Disponible'},
//       {'nombre':'Programador de Java','cantidadVacantes':'3','estado':'Disponible'},
//       {'nombre':'Programador de Java','cantidadVacantes':'3','estado':'Disponible'},
//       {'nombre':'Programador de Java','cantidadVacantes':'3','estado':'Disponible'},
//     ];


//     return Scaffold(
//       appBar: MenuAppBar(),
//       drawer: MenuDrawer(),
//       body:
//        SingleChildScrollView(
//         child:Column(
//           children: [
//             SizedBox(height: 20),
//             Container(              
//               child: Text('Ofertas de empleo',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
//           ),
//           SizedBox(height: 20),
//           Container(
            
//           child: DataTable(columnSpacing: 16.0,columns: const <DataColumn> [            
//           DataColumn(label: Flexible(child: Text('Nombre',style: TextStyle(fontWeight: FontWeight.bold)))),
//           DataColumn(label: Flexible(child: Text('N° vacantes',style: TextStyle(fontWeight: FontWeight.bold)))),
//           DataColumn(label: Flexible(child: Text('Estado',style: TextStyle(fontWeight: FontWeight.bold)))),
//           ],
//            rows: vacantes.map<DataRow>((vacante){
//             return DataRow(cells: <DataCell>[
//               DataCell(Flexible(child: Text(vacante['nombre']!))),
//               DataCell(Row(
//                 children: [
//                   Text(vacante['cantidadVacantes']!),
//                    Icon(Icons.people_outline),
//                 ],
//               )
//             ),
//               DataCell(Text(vacante['estado']!)),
//             ]);
//            }).toList() 
//            ),
//           ),          
//           ],
//         ) 
//       ),
//     );


//       return Scaffold(
//   appBar: MenuAppBar(),
//   drawer: MenuDrawer(),
//   body: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       const Padding(
//         padding:  EdgeInsets.all(16.0),
//         child: Text('Ofertas de empleo',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//       ),
//       Expanded(
//         child: ListView.builder(
//           itemCount: vacantes.length,
//           itemBuilder: (BuildContext context, int index) {
//             Map<String, dynamic> vacante = vacantes[index];
//             return Card(
//               elevation: 4,
//               margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               child: ListTile(
//                 title: Text('${vacante['nombre']}',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                 ),
//                 subtitle: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Text('N° Vacantes: ${vacante['cantidadVacantes']}',style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold)), 
//                             Icon(Icons.people_outline),
//                           ],
//                         ),                                                 
//                         Text('Estado: ${vacante['estado']}',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
//                       ],
//                     ),                   // Icono de dos personas
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     ],
//   ),
// );

//   }    
// } 

import 'package:flutter/material.dart';
import 'package:portal_de_empleo/presentation/widgets/menu_appbar.dart';
import 'package:portal_de_empleo/presentation/widgets/menu_drawer.dart';

class secondPage extends StatefulWidget {
  const secondPage({super.key});

  @override
  State<secondPage> createState() => _secondPageState();
}

class _secondPageState extends State<secondPage> {
  int paginaActual = 1;
  int elementosPorPagina = 6;

  List<Map<String, dynamic>> vacantes = [
    {'nombre': 'Desarrollador FullStack', 'cantidadVacantes': '5', 'estado': 'Disponible'},
    {'nombre': 'Ingeniero de Software', 'cantidadVacantes': '3', 'estado': 'Disponible'},
    {'nombre': 'Diseñador informático', 'cantidadVacantes': '2', 'estado': 'Terminado'},
    {'nombre': 'Programador de Java', 'cantidadVacantes': '3', 'estado': 'Disponible'},
    {'nombre': 'Desarrollador Junior', 'cantidadVacantes': '5', 'estado': 'Disponible'},
    {'nombre': 'Analista Desarrollador', 'cantidadVacantes': '3', 'estado': 'Disponible'},
    {'nombre': 'Programador COBOL', 'cantidadVacantes': '3', 'estado': 'Disponible'},
    {'nombre': 'Diseñador informático', 'cantidadVacantes': '2', 'estado': 'Terminado'},
    {'nombre': 'Programador de Java', 'cantidadVacantes': '3', 'estado': 'Disponible'},
    {'nombre': 'Desarrollador Junior', 'cantidadVacantes': '5', 'estado': 'Disponible'},
    {'nombre': 'Analista Desarrollador', 'cantidadVacantes': '3', 'estado': 'Disponible'},
    {'nombre': 'Programador COBOL', 'cantidadVacantes': '3', 'estado': 'Disponible'},
    {'nombre': 'Diseñador informático', 'cantidadVacantes': '2', 'estado': 'Terminado'},
    {'nombre': 'Programador de Java', 'cantidadVacantes': '3', 'estado': 'Disponible'},
    {'nombre': 'Desarrollador Junior', 'cantidadVacantes': '5', 'estado': 'Disponible'},
    {'nombre': 'Analista Desarrollador', 'cantidadVacantes': '3', 'estado': 'Disponible'},
    {'nombre': 'Programador COBOL', 'cantidadVacantes': '3', 'estado': 'Disponible'},
  ];


  List<Map<String, dynamic>> obtenerElementosPaginaActual(){
    int indiceInicio = (paginaActual - 1) * elementosPorPagina;
    int indiceFin = indiceInicio + elementosPorPagina;

    if(indiceInicio >= vacantes.length){
      return[];
    }

    return vacantes.sublist(indiceInicio,indiceFin < vacantes.length ? indiceFin:vacantes.length);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MenuAppBar(),
      drawer: MenuDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: const EdgeInsets.all(16.0),
            child: Text(
              '${vacantes.length} ofertas de empleo',
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            ) 
          ),
          Expanded(
            child:ListView.builder(
              itemCount: obtenerElementosPaginaActual().length,
              itemBuilder: (BuildContext context, int indice) {
                Map<String, dynamic> vacante = obtenerElementosPaginaActual()[indice];
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  child: ListTile(
                    title: Text('${vacante['nombre']}',
                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
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
                                'N° Vacantes: ${vacante['cantidadVacante']}',
                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),                                
                              ),
                              Icon(Icons.people_outline)
                            ],
                          ),
                          Text(
                            'Estado: ${vacante['estado']}',
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
          
                          )
                        ],
                      )
                    ],
                  ),)
                );
              },
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: paginaActual > 1 ?() {
                setState(() {
                  paginaActual--;
                });
              }:null ,
               icon: Icon(Icons.arrow_back)),

               Text('Pagina $paginaActual'),

               IconButton(onPressed: (paginaActual * elementosPorPagina) < vacantes.length ? (){
                setState(() {
                  paginaActual++;
                });
               }:null,
                icon:Icon(Icons.arrow_forward),)
            ],
          )

        ],
      ),
    );
  }
}