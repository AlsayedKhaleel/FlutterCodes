import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_counter/cubit/cubit/counter_cubit.dart';

void main() {
  runApp(BlocProvider(create: (context) => CounterCubit(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CounterCubit>();

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Counter App",
            style: TextStyle(fontWeight: .bold, fontSize: 20),
          ),
          backgroundColor: Colors.white,
        ),

        body: Center(
          child: BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              return Text(
                cubit.count.toString(),
                style: TextStyle(
                  fontWeight: .bold,
                  fontSize: 40,
                  color: Colors.black,
                ),
              );
            },
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: cubit.addOne,
          child: Icon(Icons.add, color: Colors.black),
        ),
      ),
    );
  }
}
