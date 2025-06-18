import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scaffold_project/Presentation/Components/text_input/text_input_custom.dart';
import 'package:scaffold_project/Presentation/store/sigin_store.dart';
import 'package:scaffold_project/Utils/navigation_class.dart';
import 'package:scaffold_project/Utils/size_config.dart';

SiginStore _siginStore = GetIt.I<SiginStore>();

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool hidePassword = true;
  Icon get iconVisibility => hidePassword
      ? const Icon(Icons.visibility)
      : const Icon(Icons.visibility_off);

  _setVisiblity() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  @override
  void initState() {
    _siginStore.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _siginStore.disposeVariables();
    super.dispose();
  }

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
                    'Crie sua conta',
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
                    'Crie uma conta e tenha controle financeiro',
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
                        label: const Text('Nome'),
                        onChange: _siginStore.setName,
                      ),
                      const SizedBox(height: 20),
                      TextInputCustom(
                        backGroundColor: const Color(0xfff1f4ff),
                        label: const Text('Sobrenome'),
                        onChange: _siginStore.setSobrenome,
                        errorText: _siginStore.validSobrenome,
                      ),
                      const SizedBox(height: 20),
                      TextInputCustom(
                        backGroundColor: const Color(0xfff1f4ff),
                        label: const Text('CPF'),
                        mask: "###.###.###-##",
                        onChange: _siginStore.setCpf,
                        errorText: _siginStore.validCPF,
                      ),
                      const SizedBox(height: 20),
                      TextInputCustom(
                        backGroundColor: const Color(0xfff1f4ff),
                        label: const Text('email'),
                        onChange: _siginStore.setEmail,
                        errorText: _siginStore.validEmail,
                      ),
                      const SizedBox(height: 20),
                      TextInputCustom(
                        suffixIcon: IconButton(
                          onPressed: _setVisiblity,
                          icon: iconVisibility,
                        ),
                        onChange: _siginStore.setPassword,
                        backGroundColor: const Color(0xfff1f4ff),
                        label: const Text('Senha'),
                        obscureText: hidePassword,
                      ),
                      const SizedBox(height: 20),
                      TextInputCustom(
                        backGroundColor: const Color(0xfff1f4ff),
                        label: const Text('Confirme a senha'),
                        errorText: _siginStore.validPasswd,
                        obscureText: hidePassword,
                        onChange: _siginStore.setRepeatPassword,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: MQueryCustom(context, type: 'w', porcent: 1),
                        child: ElevatedButton(
                          onPressed: _siginStore.handleSubmit,
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
                          child: const Text('Cadastrar',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                          alignment: Alignment.center,
                          child: TextButton(
                              onPressed: () {
                                NavigationPages.pop(context);
                              },
                              child: const Text(
                                'Ja tenho uma conta',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Color(0xff1F41BB)),
                              ))),
                      const SizedBox(height: 20),
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
