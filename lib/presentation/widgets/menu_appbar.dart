import 'package:flutter/material.dart';

class MenuAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MenuAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(      
      title: Text('PORTAL DE EMPLEO',),
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      actions: [
        IconButton(
          onPressed: (){},
           icon: const Icon(
            Icons.assignment_ind, 
            color: Colors.white),
            ),
      ],
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(0, kToolbarHeight);
}