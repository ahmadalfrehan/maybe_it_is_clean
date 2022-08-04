import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lujain/data/datasources/Bloc/Bloc.dart';
import 'package:lujain/presentation/Home/CustomListView.dart';
import 'package:lujain/presentation/Home/appBar.dart';
import '../../data/datasources/Bloc/States.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBarForMyApp.appBarForMyApp(context, textAppBar: 'شؤون الموظفين'),
      body: BlocProvider(
        create: (BuildContext context) => UsersCubit()..getAllUsers(),
        child: BlocConsumer<UsersCubit, States>(
          listener: (context, state) {
            if (state is UsersGetErrorStates) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text('An error occurred try again'),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is UsersGetSuccessfullyStates ||
                state is UsersGetLoadingStates) {
              return Container(
                color: const Color(0xFFf8f8f6),
                child: state is UsersGetLoadingStates
                    ? const LinearProgressIndicator()
                    : CustomListView(UsersCubit.get(context).userModel),
              );
            } else {
              return Directionality(
                textDirection: TextDirection.ltr,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('An error occurred try again?'),
                      MaterialButton(
                        onPressed: () {
                          UsersCubit.get(context).getAllUsers();
                        },
                        child: const Text('try again'),
                      )
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
