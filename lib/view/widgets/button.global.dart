import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inicio_sesion/utils/global.colors.dart';
import 'package:inicio_sesion/view/createEmployee.view.dart';

class ButtonGlobal extends StatelessWidget {
  const ButtonGlobal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CrearEmpleado()),
        );
      },
      child: Container(
        alignment: Alignment.center,
        height: 55,
        width: 150,
        decoration: BoxDecoration(
            color: GlobalColor.buttonColor,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
              )
            ]),
        child: const Text(
          'Entrar',
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
    );
  }
}
