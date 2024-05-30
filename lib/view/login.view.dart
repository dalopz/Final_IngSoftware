import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:inicio_sesion/utils/global.colors.dart";
import "package:inicio_sesion/view/widgets/button.global.dart";
import "package:inicio_sesion/view/widgets/text.form.global.dart";

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: GlobalColor.mainColor,
          width: double.infinity,
          height: double.infinity,
          //padding: const EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, //
            children: [
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
                child: const Image(
                  image: AssetImage('images/logoProinsa-removebg.png'),
                  height: 360,
                  width: 480,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Ingresa las credenciales de usuario y contraseña',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 15),

              /// Usuario input
              TextFormGlobal(
                controller: emailController,
                text: 'Usuario',
                obscure: false,
                textInputType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 20),

              /// Password input,
              TextFormGlobal(
                controller: passwordController,
                text: 'Contraseña',
                textInputType: TextInputType.text,
                obscure: true,
              ),
              const SizedBox(height: 20),
              const ButtonGlobal(),
            ],
          ),
        ),
      ),
    );
  }
}
