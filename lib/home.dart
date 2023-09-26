import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formkey = GlobalKey<FormState>();
  final controllerAltura = TextEditingController();
  final controllerPeso = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Form(
          key: _formkey,
          child: SizedBox(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Calculadora de IMC',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 100, right: 100, bottom: 10),
                    child: TextFormField(
                      controller: controllerAltura,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Digite sua altura'),
                      validator: (altura) {
                        if (altura!.isEmpty) {
                          return 'Digite sua altura';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 100, right: 100, bottom: 10),
                    child: TextFormField(
                      controller: controllerPeso,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Digite seu peso'),
                      validator: (peso) {
                        if (peso!.isEmpty) {
                          return 'Digite seu peso';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          double peso =
                              double.tryParse(controllerPeso.value.text)!;
                          double altura =
                              double.tryParse(controllerAltura.value.text)!;
                          if (peso / (altura * altura) < 18.5) {
                            await Navigator.pushNamed(context, '/resultado',
                                arguments: {'valor': 'Abaixo do peso'});
                          } else if (peso / (altura * altura) >= 18.5 &&
                              peso / (altura * altura) < 25) {
                            await Navigator.pushNamed(context, '/resultado',
                                arguments: {'valor': 'Peso ideal, Parabéns'});
                          } else if (peso / (altura * altura) >= 25 &&
                              peso / (altura * altura) < 30) {
                            await Navigator.pushNamed(context, '/resultado',
                                arguments: {'valor': 'Sobrepeso'});
                          } else if (peso / (altura * altura) >= 30) {
                            await Navigator.pushNamed(context, '/resultado',
                                arguments: {'valor': 'Obesidade'});
                          }
                        }
                      },
                      child: const Text('Calcular'))
                ],
              ),
            ),
          )),
    );
  }
}
