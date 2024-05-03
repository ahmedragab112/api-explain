import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapi/presentation/manager/authcubit_cubit.dart';
import 'package:testapi/presentation/view/widget/custom_button.dart';
import 'package:testapi/presentation/view/widget/input_filed.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: () async {
              await cubit.picKFromGallery();
            },
            child: cubit.profilePic == null
                ? const Icon(
                    Icons.person,
                    size: 100,
                  )
                : BlocBuilder<AuthCubit, AuthcubitState>(
                    builder: (context, state) {
                      return CircleAvatar(
                        radius: 100,
                        backgroundImage: FileImage(cubit.profilePic!),
                      );
                    },
                  ),
          ),
          InputFiled(
            controller: cubit.changeNameController,
            hintText: 'enter Name',
          ),
          InputFiled(
            controller: cubit.changePhoneController,
            hintText: 'enter phone',
          ),
          CustomButton(
            text: 'update',
            onTap: () async {
              await cubit.updateUser();
            },
          ),
        ],
      ),
    );
  }
}
