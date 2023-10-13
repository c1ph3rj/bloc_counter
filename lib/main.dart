import 'package:bloc_counter/common/values/colors.dart';
import 'package:bloc_counter/counterdir/counter_cubit.dart';
import 'package:bloc_counter/pages/register/bloc/sign_up_bloc.dart';
import 'package:bloc_counter/pages/register/register.dart';
import 'package:bloc_counter/pages/signIn/bloc/sign_in_bloc.dart';
import 'package:bloc_counter/pages/signIn/sign_in.dart';
import 'package:bloc_counter/pages/welcome/bloc/welcome_blocs.dart';
import 'package:bloc_counter/pages/welcome/welcome.dart';
import 'package:bloc_counter/productsdir/ApiReqeust/ProdutServiceRepo.dart';
import 'package:bloc_counter/productsdir/bloc_pattern/product_bloc.dart';
import 'package:bloc_counter/productsdir/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logger/logger.dart';

import 'counterdir/counter_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

var logger = Logger();

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
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
        ),
        BlocProvider(create: (context) => SignUpBloc()),
      ],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: AppColors.primaryText))),
          home: (FirebaseAuth.instance.currentUser == null || !FirebaseAuth.instance.currentUser!.emailVerified)
              ? const WelcomeScreen()
              : const HomeScreen(),
          routes: {
            "homeScreen": (context) => const HomeScreen(),
            "signIn": (context) => const SignIn(),
            "register": (context) => const Register()
          },
        ),
      ),
    );
  }
}
