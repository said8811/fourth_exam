import 'package:fifth_exam/data/repository/users_repo.dart';
import 'package:fifth_exam/data/services/api_service/users_api.dart';
import 'package:fifth_exam/view_models/usersViewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Users")),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ChangeNotifierProvider(
          create: (_) => UserViewModel(
              uSerRepository: USerRepository(usersApi: UsersApi())),
          builder: (context, child) {
            var users = context.watch<UserViewModel>();
            if (users.error.isNotEmpty) {
              return Container(
                child: Text(users.error),
              );
            }

            return users.users != null
                ? ListView.separated(
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          users.users![index].avatarUrl),
                                      fit: BoxFit.cover))),
                          const SizedBox(width: 8),
                          Column(
                            children: [
                              Text(
                                users.users![index].name,
                                style: const TextStyle(fontSize: 18),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                users.users![index].username,
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 15);
                    },
                    itemCount: users.users!.length)
                : Container(
                    child: const Center(child: CircularProgressIndicator()),
                  );
          },
        ),
      ),
    );
  }
}
