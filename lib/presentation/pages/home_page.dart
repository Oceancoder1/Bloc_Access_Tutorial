import 'package:bloc_access/constant/enums.dart';
import 'package:bloc_access/logic/cubit/counter_cubit.dart';
import 'package:bloc_access/logic/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.wifi) {
                  return const Text('Wifi');
                }
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.mobile) {
                  return const Text('Mobile');
                }
                if (state is InternetDisconnected) {
                  return const Text('Disconnected');
                }
                return const CircularProgressIndicator();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const CounterWidget(),
          ],
        ),
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        return Center(
          child: Text('${state.counterValue}'),
        );
      },
    );
  }
}
