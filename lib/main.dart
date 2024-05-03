import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapi/cache/shared_prefrence.dart';
import 'package:testapi/data/repo/remote_repo.dart';
import 'package:testapi/data/service/web_service.dart';
import 'package:testapi/helper/dio_singleton.dart';

import 'package:testapi/observer.dart';
import 'package:testapi/presentation/manager/authcubit_cubit.dart';
import 'package:testapi/presentation/view/screens/login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  Bloc.observer = MyBlocObserver();
  runApp(BlocProvider(
    create: (context) => AuthCubit(repo:RemoteRepo(webService: WebService(DioFactory.getDio())) ),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
