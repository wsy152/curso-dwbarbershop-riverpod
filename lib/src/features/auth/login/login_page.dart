
import 'package:curso_dw_barbershop/src/core/ui/constants.dart';
import 'package:curso_dw_barbershop/src/core/ui/helpers/form_helper.dart';
import 'package:curso_dw_barbershop/src/features/auth/login/login_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final LoginVm(:login) = ref.watch(loginVmProvider.notifier);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: formKey,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background_image_chair.jpg'),
                opacity: 0.2,
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(ImagemConstants.imageLogo),
                          const SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            onTapOutside: (_) => context.unfocus(),
                            validator: Validatorless.multiple([
                              Validatorless.required('E-mail obrigatório'),
                              Validatorless.email('E-mail inválido'),
                            ]),
                            controller: emailEC,
                            decoration: const InputDecoration(
                                label: Text('Email'),
                                hintText: 'E-mail',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                hintStyle: TextStyle(color: Colors.black),
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            onTapOutside: (_) => context.unfocus(),
                            validator: Validatorless.multiple([
                              Validatorless.required('Password obrigatório'),
                              Validatorless.min(
                                  6, 'Senha deve conter no minimo 6 caracters'),
                            ]),
                            controller: passwordEC,
                            decoration: const InputDecoration(
                                label: Text('Senha'),
                                hintText: 'Senha',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                hintStyle: TextStyle(color: Colors.black),
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Esqueceu a senha',
                                style: TextStyle(
                                    color: ColorsConstants.brow, fontSize: 12),
                              )),
                          const SizedBox(
                            height: 24,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size.fromHeight(56)),
                              onPressed: () {
                                switch (formKey.currentState?.validate()) {
                                  case (false || null):
                                  case true:
                                    login(emailEC.text, passwordEC.text);
                                }
                              },
                              child: const Text('data')),
                        ],
                      ),
                      const Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Criar conta',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
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
