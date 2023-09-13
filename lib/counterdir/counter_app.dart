import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: BlocListener<CounterCubit, CounterState>(
            listener: (context, state) {
              if (state.wasIncremented != null) {
                Text textMessage;
                if (state.wasIncremented!) {
                  textMessage = const Text("Incremented!");
                } else {
                  textMessage = const Text("Decremented!");
                }
                ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                  content: textMessage,
                  duration: const Duration(microseconds: 600),
                ));
              }
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Simple Counter",
                    style: TextStyle(
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          if (BlocProvider.of<CounterCubit>(context)
                              .state
                              .counterValue <=
                              0) {
                            return;
                          }
                          BlocProvider.of<CounterCubit>(context).decrement();
                        },
                        child: const Icon(Icons.remove),
                      ),
                      SizedBox(
                        width: 60,
                        child: BlocBuilder<CounterCubit, CounterState>(
                            builder: (context, state) {
                              return Text(
                                state.counterValue.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 20),
                              );
                            }),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).increment();
                        },
                        child: const Icon(Icons.add),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
