import 'dart:async';

import 'package:devstravel/src/models/appdata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPage createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TextStyle styles = TextStyle(
      fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue');

  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();

  String email = '';
  String password = '';
  bool loading = false;
  bool canSubmit = false;

  final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  void onPressedLogin(pageContext) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        loading = true;
      });
      Timer(const Duration(seconds: 1), () {
        Navigator.pushNamed(
          pageContext,
          '/preload',
        );

        setState(() {
          loading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(builder: (ctx, appdata, child) {
      return Scaffold(
          key: _scaffoldKey,
          body: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/assets/devstravel_logo.png',
                      width: 125,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Text('Bem vindo ao', style: styles),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Text('seu guia de viagem perfeito', style: styles),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          width: 250,
                          child: Form(
                            key: _formKey,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.only(
                                      bottom: 20,
                                    ),
                                    child: TextFormField(
                                      onSaved: (value) {
                                        setState(() {
                                          email = value ?? '';
                                        });
                                      },
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.person,
                                          color: Colors.teal,
                                        ),
                                        hintText: 'E-mail',
                                      ),
                                      validator: (value) {
                                        if (!emailRegex.hasMatch(value ?? '')) {
                                          return 'E-mail inválido';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                      bottom: 20,
                                    ),
                                    child: TextFormField(
                                      onSaved: (value) {
                                        setState(() {
                                          password = value ?? '';
                                        });
                                      },
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.lock_open,
                                          color: Colors.teal,
                                        ),
                                        hintText: 'Senha',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Campo obrigátorio';
                                        } else if (value.length < 4) {
                                          return 'Campo senha deve ter no minimo 4 caracteres';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 1,
                                        primary: Colors.teal,
                                        fixedSize: const Size.fromWidth(250)),
                                    onPressed: () {
                                      onPressedLogin(context);
                                    },
                                    child: loading
                                        ? const SizedBox(
                                            height: 30.0,
                                            width: 30.0,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              valueColor:
                                                  AlwaysStoppedAnimation(
                                                      Colors.white),
                                            ),
                                          )
                                        : const Text('Entrar'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ));
    });
  }
}
