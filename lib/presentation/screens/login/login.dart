import 'package:flutter/material.dart';
import 'package:portal_de_empleo/presentation/screens/home_page.dart';
import 'package:portal_de_empleo/presentation/screens/login/register_user.dart';

import '../../../datas/users/User_List.dart';
import '../../../domain/models/user/use.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

   void _login() {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Por favor, complete todos los campos'),
      ));
      return;
    }
    
    final user = users.firstWhere(
      (user) => user.email == email && user.password == password,
      orElse: () => User(name: '', email: '', password: '', confirmedPassword: ''),
    );

    if (user.name.isNotEmpty) {      
      Navigator.push(context, MaterialPageRoute(builder: (context) => primeraPagina()));
    } else {      
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Correo electrónico o contraseña incorrectos'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Image.asset(
                '../../assets/images/portalEmpleo.jpeg',
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 20),
            const Text('Inicio de Sesión', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Correo Electrónico', style: TextStyle(fontSize: 16),),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    controller: _emailController,
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return 'Por favor, ingrese un correo electrónico';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  const Text('Contraseña', style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese una contraseña';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _login,
                child: const Text('Iniciar Sesión'),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text('¿No tienes cuenta?', style: TextStyle(fontSize: 16,))
            ),
            const SizedBox(height: 10),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterUser()));
                },
                child: const Text('Regístrate',style: TextStyle(fontSize: 16,color: Colors.blue,),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
