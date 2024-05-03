import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapi/presentation/manager/authcubit_cubit.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onTap});
  final String text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.blue),
        child: BlocBuilder<AuthCubit, AuthcubitState>(
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.white,
              ));
            } else if (state is AuthFail) {
              return Text(
                state.error,
                style: const TextStyle(color: Colors.white),
              );
            }
            return Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            );
          },
        ),
      ),
    );
  }
}
