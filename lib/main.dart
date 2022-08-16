import 'package:bloc_access/logic/cubit/counter_cubit.dart';
import 'package:bloc_access/logic/cubit/internet_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'package:bloc_access/presentation/pages/pages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.connectivity,
  }) : super(key: key);

  final Connectivity connectivity;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternetCubit(
            connectivity: connectivity,
          ),
        ),
        BlocProvider(
          create: (context) => CounterCubit(
            internetCubit: context.read<InternetCubit>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
