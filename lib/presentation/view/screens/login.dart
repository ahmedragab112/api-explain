import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapi/presentation/manager/authcubit_cubit.dart';
import 'package:testapi/presentation/view/screens/sign_up.dart';
import 'package:testapi/presentation/view/widget/custom_button.dart';
import 'package:testapi/presentation/view/widget/custom_listern.dart';
import 'package:testapi/presentation/view/widget/forgot_password.dart';
import 'package:testapi/presentation/view/widget/input_filed.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/friendship.png',
              width: double.infinity,
              height: 300,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Login',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Email',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  InputFiled(
                    hintText: 'enter email',
                    controller: cubit.loginEmail,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Password',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  InputFiled(
                    hintText: 'enter password',
                    controller: cubit.loginPassword,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Forgot password', textAlign: TextAlign.end),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    text: 'Login',
                    onTap: () {
                      cubit.login();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Text('don\'t have and account ?'),
                      SizedBox(
                        width: 10,
                      ),
                      MoveToOtherPage(
                        widget: SignUpScreen(),
                        text: 'SingUp',
                      ),
                      CustomLisiner()
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
