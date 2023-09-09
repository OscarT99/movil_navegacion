import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:portal_de_empleo/datas/employment/employment_list.dart';
import 'package:portal_de_empleo/domain/models/employment/employment.dart';
import 'package:portal_de_empleo/presentation/screens/login/login.dart';
import 'package:portal_de_empleo/presentation/screens/ofertas_empleo/second_page.dart';

class RegisterEmployment extends StatefulWidget {
  const RegisterEmployment({super.key});

  @override
  State<RegisterEmployment> createState() => _RegisterEmploymentState();
}

class _RegisterEmploymentState extends State<RegisterEmployment> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _numberOfVacanciesController = TextEditingController();
  final TextEditingController _publicationDateController = TextEditingController();
  String image = '';
  bool _selectedState = true; // true representa "Activo"

  Future<void> _pickImage() async {
    final pickImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickImage != null) {
      setState(() {
        image = pickImage.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(height: 20),
              const Text('Registro de oferta de empleo',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),
              const Text('Nombre', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ingrese el nombre del empleo',
                ),
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el nombre del empleo';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              const Text('Descripción', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ingrese la descripción del empleo',
                ),
                controller: _descriptionController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa una descripción del empleo';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              const Text('Cantidad Vacantes', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ingrese la cantidad de vacantes',
                ),
                controller: _numberOfVacanciesController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa una cantidad';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              const Text('Fecha de Publicación', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              TextFormField(
                controller: _publicationDateController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Seleccione la fecha de publicación',
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    _publicationDateController.text =
                        pickedDate.toLocal().toString().split(' ')[0];
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor selecciona una fecha de publicación';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              const Text('Estado', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              DropdownButtonFormField<bool>(
                value: _selectedState,
                onChanged: (newValue) {
                  setState(() {
                    _selectedState = newValue!;
                  });
                },
                items: <bool>[true, false]
                    .map<DropdownMenuItem<bool>>(
                      (bool value) {
                        return DropdownMenuItem<bool>(
                          value: value,
                          child: Text(value ? 'Activo' : 'Inactivo'),
                        );
                      },
                    )
                    .toList(),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Por favor selecciona el estado';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Selecciona foto'),
              ),
              if (image.isNotEmpty) Image.network(image),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      var newJobOffers = Employment(
                        name: _nameController.text,
                        description: _descriptionController.text,
                        numberOfVacancies: int.parse(_numberOfVacanciesController.text),
                        image: image,
                        state: _selectedState,
                        publicationDate: DateTime.parse(_publicationDateController.text),
                      );

                      jobOffers.add(newJobOffers);

                      Navigator.push(context, MaterialPageRoute(builder: (context) => secondPage()));

                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Registro exitoso')),
                          );
                    }                  
                  },
                  child: Text('Registrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
