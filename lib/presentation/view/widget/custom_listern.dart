import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapi/presentation/manager/authcubit_cubit.dart';
import 'package:testapi/presentation/view/screens/profile.dart';

class CustomLisiner extends StatelessWidget {
  const CustomLisiner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthcubitState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
