import 'package:flutter/material.dart';

class MenuAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MenuAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(      
      title: Text('MyEmpleo'),
      backgroundColor: Colors.black,
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