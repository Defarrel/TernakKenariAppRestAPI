import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restapi/data/repository/auth_repository.dart';
import 'package:restapi/data/repository/get_all_burung_tersedia_repository.dart';
import 'package:restapi/data/repository/profile_buyer_repository.dart';
import 'package:restapi/presentation/auth/bloc/login/login_bloc.dart';
import 'package:restapi/presentation/auth/bloc/register/register_bloc.dart';
import 'package:restapi/presentation/auth/login_screen.dart';
import 'package:restapi/presentation/bloc/get_burung_tersedia_bloc.dart';
import 'package:restapi/presentation/buyer/profile/bloc/profile_buyer_bloc.dart';
import 'package:restapi/service/service_http_client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override

  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              LoginBloc(authRepository: AuthRepository(ServiceHttpClient())),
        ),
        BlocProvider(
          create: (context) =>
              RegisterBloc(authRepository: AuthRepository(ServiceHttpClient())),
        ),
        BlocProvider(
          create: (context) => ProfileBuyerBloc(
            profileBuyerRepository: ProfileBuyerRepository(ServiceHttpClient()),
          ),
        ),
        BlocProvider(
          create: (context) => GetBurungTersediaBloc(
            GetAllBurungTersediaRepository(ServiceHttpClient()),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const LoginScreen(),
      ),
    );
  }
}

