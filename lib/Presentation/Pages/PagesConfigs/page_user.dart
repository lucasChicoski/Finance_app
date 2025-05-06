import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scaffold_project/Presentation/Components/Cards/card_inputs.dart';
import 'package:scaffold_project/Presentation/Components/buttons/elevated_button_custom.dart';
import 'package:scaffold_project/Presentation/store/config_user_store.dart';
import 'package:scaffold_project/Utils/navigation_class.dart';
import 'package:scaffold_project/Utils/size_config.dart';
import 'package:scaffold_project/Utils/theme_colors.dart';

ConfigUserViewModel _configUserViewModel = GetIt.I<ConfigUserViewModel>();

class PageUser extends StatelessWidget {
  const PageUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: MQueryCustom(context, type: "w", porcent: 0.9),
            child: Column(
              children: [
                Expanded(
                    flex: 10,
                    child: ListView(
                      children: [
                        Text(
                          "Configurações",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: quartaryColro, fontSize: 23),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CardInput(
                          label: "Nome",
                          hint: "Digite seu nome",
                          onChange: _configUserViewModel.setName,
                          textInputType: TextInputType.text,
                          conttroller: TextEditingController(
                              text: _configUserViewModel.name),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CardInput(
                          label: "Sobrenome",
                          hint: "Digite seu sobrenome",
                          onChange: _configUserViewModel.setLastName,
                          textInputType: TextInputType.text,
                          conttroller: TextEditingController(
                              text: _configUserViewModel.lastName),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CardInput(
                          label: "Data de nascimento",
                          hint: "Digite sua data de nascimento",
                          textInputType: TextInputType.text,
                          onChange: _configUserViewModel.setBirthDate,
                          conttroller: TextEditingController(
                              text: _configUserViewModel.birthDate),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CardInput(
                          label: "Email",
                          hint: "Digite seu email",
                          onChange: _configUserViewModel.setEmail,
                          textInputType: TextInputType.emailAddress,
                          conttroller: TextEditingController(
                              text: _configUserViewModel.email),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CardInput(
                          label: "Telefone",
                          hint: "Digite seu telefone",
                          textInputType: TextInputType.number,
                          onChange: _configUserViewModel.setPhoneNumber,
                          conttroller: TextEditingController(
                              text: _configUserViewModel.phoneNumber),
                        ),
                      ],
                    )),
                ElevatedButtonCustom(
                  label: "Salvar",
                  onPressed: () {
                    _configUserViewModel.submmit(
                        _configUserViewModel.getJsonUserConfig());

                    NavigationPages.pop(context);
                  },
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
