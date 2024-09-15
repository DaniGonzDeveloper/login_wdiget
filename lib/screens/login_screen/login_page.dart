import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Utils/get_it_utility.dart';
import '../../cubits/login/login_screen_cubit.dart';
import '../../cubits/login/login_screen_state.dart';
import '../../styles/colors.dart';
import '../../widgets/default_loading_indicator.dart';
import '../../widgets/default_material_button.dart';
import '../../widgets/default_text.dart';
import '../../widgets/default_text_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late LoginCubit authCubit;
  bool _passwordInvisible = true;

  @override
  void initState() {
    authCubit = getIt<LoginCubit>();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => authCubit,
        child: Builder(builder: (context) {
          return Scaffold(
            backgroundColor: Colors.white,
              body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          const Align(
                            alignment: Alignment.center,
                            child: DefaultText(
                              text: "Login",
                              color: defaultAppColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: _email(),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: _password(),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: DefaultTextButton(
                              onPressed: () {},
                              child: const DefaultText(
                                text: '¿Olvidó su contraseña?',
                                color: Colors.grey,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                          BlocConsumer<LoginCubit, LoginState>(
                            listener: (context, state) {
                              if (state is LoginSuccessState) {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, "/home", (route) => false);
                                ScaffoldMessenger.of(context).removeCurrentSnackBar();
                                var snackBar = const SnackBar(content: Text('logged in!!'));
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              } else if (state is LoginFailureState) {
                                ScaffoldMessenger.of(context).removeCurrentSnackBar();
                                var snackBar = SnackBar(content: Text(state.errorMessage));
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              }
                            },
                            builder: (context, state) {
                              if (state is LoginLoadingState) {
                                return const DefaultLoadingIndicator();
                              } else {
                                return Align(
                                  alignment: Alignment.center,
                                  child: DefaultMaterialButton(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 1),
                                    radius: 10,
                                    height: 50,
                                    splashColor: defaultGray,
                                    background: defaultAppColor,
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        authCubit.login(
                                            email: emailController.text,
                                            password: passwordController.text);
                                      }
                                    },
                                    child: const DefaultText(
                                      fontWeight: FontWeight.bold,
                                      text: "Login",
                                      color: defaultAppWhiteColor,
                                      fontSize: 15,
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const DefaultText(
                                text: "¿Aún no tiene cuenta? ",
                                color: defaultGray,
                                fontSize: 12,
                              ),
                              DefaultTextButton(
                                  onPressed: () {
                                    // Navigator.pushReplacementNamed(
                                    //     context, signupRoute);
                                  },
                                  child: const DefaultText(
                                      text: 'Registrate',
                                      color: defaultAppColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15))
                            ],
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: DefaultTextButton(
                                  onPressed: () { 

                                   },
                                  child: const DefaultText(
                                      text: '¿Tiene código de activación?',
                                      color: defaultGray,
                                      fontSize: 12)),
                                )
                        ],
                      ),
                    ),
                  ),
            ),
          ));
        }));
  }

  Widget _email() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: "Email",
        labelText: "Email",
        suffixIcon: const Icon(Icons.alternate_email),
        icon: const Icon(Icons.email),
      ),
      validator: (value) {
        if (value == null ||
            !(RegExp(r"^[\w\.-]+@([\w-]+\.)+[\w-]{2,4}$")).hasMatch(value)) {
          return "Introduzca un email válido";
        } else if (emailController.text.isEmpty) {
          return "El email no debe estar vacío";
        }
        return null;
      },
    );
  }

  Widget _password() {
    return TextFormField(
      controller: passwordController,
      obscureText: _passwordInvisible,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: "Password",
        labelText: "Password",
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _passwordInvisible = !_passwordInvisible;
            });
          },
          icon: _passwordInvisible
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
        ),
        icon: const Icon(Icons.lock),
      ),
      validator: (value) {
        if (passwordController.text.isEmpty) {
          return "La contraseña no debe estar vacía";
        }

        return null;
      },
    );
  }
}
