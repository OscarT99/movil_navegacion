import 'package:flutter/material.dart';
import 'package:portal_de_empleo/datas/users/User_List.dart';
import 'package:portal_de_empleo/domain/models/user/use.dart';
import 'package:portal_de_empleo/presentation/screens/login/login.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();   
}

class _RegisterUserState extends State<RegisterUser> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmedPasswordController = TextEditingController();

  bool _obscureText = true;
  bool _obscureTextConfirmed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black ,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:Form(
        key: _formKey,       
        child: ListView(          
          children: [
            const SizedBox(height: 20),
            
            const Text('Registro',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
            
            const SizedBox(height: 20),
            
            const Text('Nombre',style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),

            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ingrese su nombre',
              ),
              controller: _nameController,
              validator: (value){
                if(value == null || value.isEmpty){
                    return 'Por favor ingresa un nombre';
                  }
                
                final nameRegex = RegExp(r'^[a-zA-Z ]+$');

                if (!nameRegex.hasMatch(value)) {
                  return 'Por favor, ingresa solo letras';
                }
                  return null;
              },
            ),
            
            const SizedBox(height: 15),
            
            const Text('Correo Electrónico',style: TextStyle(fontSize: 16)),
            
            const SizedBox(height: 8),
            
            TextFormField(              
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ingrese su correo electrónico',
              ),
              controller: _emailController,
              validator: (value){
                if(value == null || value.isEmpty){
                    return 'Por favor un correo electrónico';
                  }
                
                final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

                if (!emailRegex.hasMatch(value)) {
                  return 'Por favor, ingrese un correo electrónico válido';
                }

                  return null;
              },
            ),
            
            const SizedBox(height: 15),
            
            const Text('Contraseña',style: TextStyle(fontSize: 16)),
            
            SizedBox(height: 8),
            
            TextFormField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Ingrese su contraseña',
                suffixIcon: Builder(
                  builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    );
                  }
                ),
              ),
              controller: _passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese una contraseña';
                }
                
                if (value.length < 6) {
                  return 'La contraseña debe contener al menos 6 caracteres';
                }
              
                final hasLetter = RegExp(r'[a-zA-Z]').hasMatch(value);
                final hasNumber = RegExp(r'[0-9]').hasMatch(value);
                final hasSymbol = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value);

                if (!hasLetter || !hasNumber || !hasSymbol) {
                  return 'La contraseña debe contener al menos una letra, un número y un símbolo';
                }

                return null;
              },
            ),



            const SizedBox(height: 15),
            
            const Text('Confirmar Contraseña',style: TextStyle(fontSize: 16,),),
            
            const SizedBox(height: 8),
            
            TextFormField(
              obscureText: _obscureTextConfirmed,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Confirme su contraseña',
                suffixIcon: Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureTextConfirmed = !_obscureTextConfirmed;
                        });
                      },
                      child: Icon(
                        _obscureTextConfirmed ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
              controller: _confirmedPasswordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, confirme la contraseña';
                }
                if (value != _passwordController.text) {
                  return 'Las contraseñas no coinciden';
                }
                return null;
              },
            ),


            
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    if(_passwordController.text == _confirmedPasswordController.text){
                      var newUser = User(
                      name:_nameController.text,
                      email:_emailController.text,
                      password: _passwordController.text,
                      confirmedPassword:_confirmedPasswordController.text);
                      users.add(newUser);
                      Navigator.push(context,
                       MaterialPageRoute(builder: (context) => Login())
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Registro exitoso'))
                      );
                    }                 
                  }                  
                },
                child: const Text('Crear Usuario'),
              ),
            ),
          ],
        ),
      ),
    )
    );
  }
}
