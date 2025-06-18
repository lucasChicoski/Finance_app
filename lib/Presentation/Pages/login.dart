import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scaffold_project/Presentation/Components/text_input/text_input_custom.dart';
import 'package:scaffold_project/Presentation/Pages/sign_in.dart';

import 'package:scaffold_project/Presentation/store/auth_store.dart';
import 'package:scaffold_project/Utils/navigation_class.dart';
import 'package:scaffold_project/Utils/size_config.dart';

/// Dica de como criar uma coluna sem que quando o teclado levante o app se comprima
/// 1 Element - Align - topCenter
/// 2 SingleChildScrillView
/// 3 Column

AuthStore _authStore = GetIt.I<AuthStore>();

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                const SizedBox(
                  width: 228,
                  child: Text(
                    'Faça seu login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue, // Escolha a cor desejada
                      fontWeight:
                          FontWeight.bold, // Se quiser deixar em negrito
                      fontSize:
                          30.0, // Ajuste o tamanho da fonte conforme necessário
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  width: 228,
                  child: Text(
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    'Bem vindo de volta! Você fez muita falta.',
                    style: TextStyle(
                      height: 1,
                      color: Colors.black, // Escolha a cor desejada
                      fontWeight:
                          FontWeight.bold, // Se quiser deixar em negrito
                      fontSize:
                          20.0, // Ajuste o tamanho da fonte conforme necessário
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                SizedBox(
                  width: MQueryCustom(context, type: 'w', porcent: 0.8),
                  child: Column(
                    children: [
                      TextInputCustom(
                        backGroundColor: const Color(0xfff1f4ff),
                        onChange: _authStore.setCpf,
                        label: const Text('Cpf'),
                        mask: '###.###.###-##',
                      ),
                      const SizedBox(height: 20),
                      TextInputCustom(
                        backGroundColor: const Color(0xfff1f4ff),
                        onChange: _authStore.setPasswd,
                        label: const Text('Senha'),
                      ),
                      const SizedBox(height: 20),
                      const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Esqueceu sua senha?',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Color(0xff1F41BB)),
                          )),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: MQueryCustom(context, type: 'w', porcent: 1),
                        child: ElevatedButton(
                          onPressed: () {
                            _authStore.submit(context);
                            // NavigationPages.navigationToPageMaterial(
                            //     context, const MainPage());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff1f41bb),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 16), // Tamanho do botão
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // Borda arredondada
                            ),
                          ),
                          child: const Text(
                            'Entrar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                          alignment: Alignment.center,
                          child: TextButton(
                              onPressed: () {
                                NavigationPages.navigationToPageMaterial(
                                    context, const SignIn());
                              },
                              child: const Text(
                                'Criar uma conta',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Color(0xff494949)),
                              ))),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/**
 * 
 * 
 */