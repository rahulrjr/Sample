import 'package:animoto/bloc/authBloc/auth_bloc.dart';
import 'package:animoto/bloc/templateBloc/template_bloc.dart';
import 'package:animoto/bloc/userBloc/user_bloc.dart';
import 'package:animoto/screens/homePage.dart';
import 'package:animoto/screens/loginPage.dart';
import 'package:animoto/screens/splashScreen.dart';
import 'package:animoto/widgets/curvePainter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Animoto());
}

class Animoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TemplateBloc>(
          create: (context) => TemplateBloc(),
        ),
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        )
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          'homePage':(context) => HomePage(),
          'login':(context) => LoginPage()
        },
        debugShowCheckedModeBanner: false,
        home:
            AppSplashScreen(),
            // Container(
            //   child: CustomPaint(
            //     painter: CurvePainter(),
            //   ),
            // )
      ),
    );

  }
}
