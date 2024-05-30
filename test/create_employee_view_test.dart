import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inicio_sesion/view/createEmployee.view.dart';

void main() {
  testWidgets('TEST: Titulo, campos y boton crear',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: CrearEmpleado()));

    // Verificar que el título esté presente
    expect(find.text('Formulario creación de empleado'), findsOneWidget);

    // Verificar los campos de texto utilizando las keys únicas
    expect(find.byKey(const Key('nombreField')), findsOneWidget);
    expect(find.byKey(const Key('cedulaField')), findsOneWidget);
    expect(find.byKey(const Key('usuarioField')), findsOneWidget);
    expect(find.byKey(const Key('emailField')), findsOneWidget);
    expect(find.byKey(const Key('celularField')), findsOneWidget);
    expect(find.byKey(const Key('passwordField')), findsOneWidget);

    print('---PASS: Campos del formulario correctos---');

    // Verificar el botón utilizando la key única
    expect(find.widgetWithText(ElevatedButton, 'Crear'), findsOneWidget);
    print('---PASS: Boton "crear" correcto---');

  });


  testWidgets('TEST: Comprobación de validaciones de datos', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: CrearEmpleado()));

    // Ingresar datos válidos en todos los campos para pasar las validaciones

    await tester.enterText(find.byKey(const Key('nombreField')), 'David Lopez');
    print('---PASS: Ingreso de nombre---');
    await tester.enterText(find.byKey(const Key('cedulaField')), '1000765415');
    print('---PASS: Ingreso de cedula---');
    await tester.enterText(find.byKey(const Key('usuarioField')), 'dalocu');
    print('---PASS: Ingreso de usuario---');
    await tester.enterText(
        find.byKey(const Key('emailField')), 'dalocu@example.com');
    print('---PASS: Ingreso de email---');
    await tester.enterText(find.byKey(const Key('celularField')), '3122654356');
    print('---PASS: Ingreso de celular---');
    await tester.enterText(
        find.byKey(const Key('passwordField')), 'Password@123');
        print('---PASS: Ingreso de contraseña---');

    // Intentar enviar el formulario con datos válidos
    await tester.tap(find.byKey(const Key('crearEmpleadoButton')),warnIfMissed: false);
    await tester.pump();

    // Verificar que no haya errores de validación
    expect(find.text('Nombre requerido'), findsNothing);
    expect(find.text('Cedula requerida'), findsNothing);
    expect(find.text('Usuario requerido'), findsNothing);
    expect(find.text('Email requerido'), findsNothing);
    expect(find.text('Telefono requerido'), findsNothing);
    expect(find.text('Contraseña requerida'), findsNothing);

    print('---PASS: Empleado Creado No hay errores de validación---');
  });
}
