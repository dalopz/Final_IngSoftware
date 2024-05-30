import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:inicio_sesion/utils/global.colors.dart';
import 'package:inicio_sesion/view/login.view.dart';

class CrearEmpleado extends StatelessWidget {
  const CrearEmpleado({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: GlobalColor.mainColor,
        shadowColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginView()),
              );
            },
            icon: const Icon(Icons.arrow_back), // Cambiar el icono aquí
          ),
        ],
        title: const Text(
          'Formulario creación de empleado',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: const MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController cedulaController = TextEditingController();
  TextEditingController usuarioController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController celularController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                key: const Key('nombreField'),
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Escribir tu nombre',
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
                validator: MultiValidator([
                  RequiredValidator(errorText: "Nombre requerido"),
                  MinLengthValidator(3, errorText: "Debe tener al menos 3 caracteres"),
                ]),
              ),
              const SizedBox(height: 20),
              TextFormField(
                key: const Key('cedulaField'),
                controller: cedulaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'C.C.',
                  labelText: 'Cedula',
                  border: OutlineInputBorder(),
                ),
                validator: MultiValidator([
                  RequiredValidator(errorText: "Cedula requerida"),
                  PatternValidator(r'^[0-9]{10,12}$', errorText: "Cédula inválida"),
                ]),
              ),
              const SizedBox(height: 20),
              TextFormField(
                key: const Key('usuarioField'),
                controller: usuarioController,
                decoration: const InputDecoration(
                  hintText: 'Crea el usuario de ingreso',
                  labelText: 'Usuario',
                  border: OutlineInputBorder(),
                ),
                validator: RequiredValidator(errorText: "Usuario requerido"),
              ),
              const SizedBox(height: 20),
              TextFormField(
                key: const Key('emailField'),
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Ingresar Email',
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: MultiValidator([
                  RequiredValidator(errorText: "Email requerido"),
                  EmailValidator(errorText: "Ingrese email válido"),
                ]),
              ),
              const SizedBox(height: 20),
              TextFormField(
                key: const Key('celularField'),
                controller: celularController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Celular',
                  labelText: 'Celular',
                  border: OutlineInputBorder(),
                ),
                validator: MultiValidator([
                  RequiredValidator(errorText: "Telefono requerido"),
                  PatternValidator(r'^[0-9]{10,12}$', errorText: "Teléfono inválido"),
                ]),
              ),
              const SizedBox(height: 20),
              TextFormField(
                key: const Key('passwordField'),
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Ingrese Contraseña de inicio de sesión',
                  labelText: 'Contraseña del usuario',
                  border: OutlineInputBorder(),
                ),
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Contraseña requerida'),
                  MinLengthValidator(8, errorText: 'Debe tener mínimo 8 caracteres'),
                  PatternValidator(r'(?=.*[!@#\$&*~-])', errorText: 'Debe tener al menos un carácter especial'),
                ]),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  key: const Key('crearEmpleadoButton'),
                  child: const Text("Crear"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Creación exitosa')),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
