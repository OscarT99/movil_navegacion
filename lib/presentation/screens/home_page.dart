import 'package:flutter/material.dart';
import 'package:portal_de_empleo/presentation/screens/ofertas_empleo/second_page.dart';
import 'package:portal_de_empleo/presentation/widgets/menu_appbar.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../widgets/menu_drawer.dart';

class PrimeraPagina extends StatelessWidget {
  const PrimeraPagina({super.key});
   Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: MenuDrawer(),
        appBar: MenuAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 25.0),
              Text(
                'DESARROLLADORES S.A.S',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Colors.black,
                ),
              ),
              Icon(Icons.person, size: 40.0),
              
              SizedBox(height: 35.0),
              ImageCarousel(),
              SizedBox(height: 35.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    SizedBox(height: 60.0),
                    ElevatedButton(
                      onPressed: () {
                        // Acción del botón 1
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: EdgeInsets.all(16.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_circle, size: 24.0),
                          SizedBox(width: 10.0),
                          Text(
                            'Registrar Oferta de Empleo',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.0),
                    ElevatedButton(
                      onPressed: () {
                        // Acción del botón 2
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        padding: EdgeInsets.all(16.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.visibility, size: 24.0),
                          SizedBox(width: 10.0),
                          Text(
                            'Ver Ofertas Disponibles',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageCarousel extends StatelessWidget {
  final List<String> imageList = [
    'assets/images/foto.jpeg',
    'assets/images/logoo.jpg',
    // Agrega la ruta de tus dos imágenes aquí
  ]; 

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
      ),
      items: imageList.map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}


  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
