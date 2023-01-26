import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/cubit/login_cubit/status.dart';
import 'package:task1/screens/scans_screen.dart';
import '../components/end_point.dart';
import '../components/login_text_form_component.dart';
import '../cubit/login_cubit/cubit.dart';

import '../shared/network/cachHelper/cache_helper.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel.status) {
              CacheHelper.saveData(
                key: 'token',
                value: state.loginModel.data.token,
              ).then((value) {
                token = state.loginModel.data.token;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ScansScreen(),
                  ),
                );
              });
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: SizedBox(
                height: 400,
                width: 380,
                child: Card(
                  elevation: 6.0,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: const EdgeInsets.all(10.0),
                  color: Colors.grey[300],
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.account_circle_outlined,
                              size: 75,
                              color: Colors.grey[600],
                            ),
                            const Text('LOGIN',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w400)),
                            const SizedBox(
                              height: 30.0,
                            ),
                            defaultFormField(
                              label: 'Email',
                              controller: emailController,
                              prefix: Icons.email_outlined,
                              type: TextInputType.emailAddress,
                              onValidate: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Your Email Address';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            defaultFormField(
                                label: 'Password',
                                controller: passwordController,
                                prefix: Icons.lock_outline,
                                type: TextInputType.visiblePassword,
                                suffix: LoginCubit.get(context).suffix,
                                onSubmit: (value) {
                                  if (formKey.currentState!.validate()) {
                                    LoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                                suffixPressed: () {
                                  LoginCubit.get(context)
                                      .changePasswordVisibility();
                                },
                                onValidate: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password can\'t be empty';
                                  } else if (value.length < 6) {
                                    return 'Password should at lest 6 character';
                                  }
                                  return null;
                                }),
                            const SizedBox(
                              height: 30.0,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              width: 150,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black45,
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    LoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) => ScansScreen(),
                                        ),
                                      );

                                  }
                                },
                                child: const Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
