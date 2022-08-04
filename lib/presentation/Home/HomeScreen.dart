import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lujain/data/datasources/Bloc/Bloc.dart';
import 'package:lujain/presentation/Home/appBar.dart';

import '../../data/Models/userModel.dart';
import '../../data/datasources/Bloc/States.dart';
import '../details/Details.dart';

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
            return Container(
              color: const Color(0xFFf8f8f6),
              child: state is UsersGetLoadingStates
                  ? const LinearProgressIndicator()
                  : _listview(context, UsersCubit.get(context).userModel),
            );
          },
        ),
      ),
    );
  }

  Widget _listview(BuildContext context, List<UserModel> users) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: 10,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Details(
                  users: users[index],
                ),
              ),
            );
          },
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: 8, top: 8, left: 13, right: 13),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              height: 110,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=2000',
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        users[index].name.toString().length < 10
                            ? users[index].name.toString()
                            : users[index].name.toString().replaceRange(
                                10, users[index].name.toString().length, ''),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Expanded(
                        child: Text(' - ${users[index].username}',
                            style: Theme.of(context).textTheme.headline5),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.info,
                          color: Colors.black54,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 0),
                      _button('منح اجازة', context),
                      _button('خصم', context),
                      _button('انهاء خدمة', context),
                      const SizedBox(width: 0),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _button(String text, BuildContext context) {
    return MaterialButton(
      color: const Color(0xFFe8e8e8),
      elevation: 1,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      onPressed: () {},
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
