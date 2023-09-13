import 'package:bloc_counter/common/values/colors.dart';
import 'package:bloc_counter/counterdir/counter_cubit.dart';
import 'package:bloc_counter/pages/signIn/bloc/sign_in_bloc.dart';
import 'package:bloc_counter/pages/signIn/sign_in.dart';
import 'package:bloc_counter/pages/welcome/bloc/welcome_blocs.dart';
import 'package:bloc_counter/pages/welcome/welcome.dart';
import 'package:bloc_counter/productsdir/ApiReqeust/ProdutServiceRepo.dart';
import 'package:bloc_counter/productsdir/bloc_pattern/product_bloc.dart';
import 'package:bloc_counter/productsdir/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';

import 'counterdir/counter_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ProductServiceRepo productServiceRepo = ProductServiceRepo();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: AppColors.primarySecondaryBackground,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark));
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
            create: (context) =>
                ProductBloc(productServiceRepo: productServiceRepo)),
        BlocProvider(
          create: (context) => SignInBloc(),
        )
      ],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const WelcomeScreen(),
          routes: {
            "HomeScreen": (context) => const HomeScreen(),
            "signIn": (context) => const SignIn()
          },
        ),
      ),
    );
  }
}
