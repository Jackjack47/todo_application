import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'home_controller.dart';
import 'home_todo_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.todo),
            actions: [
              TextButton(onPressed: _.edit, child: Text(AppLocalizations.of(context)!.edit))
            ],
          ),
          body: const HomeTodoList(),
          floatingActionButton: FloatingActionButton(
            onPressed: _.addTodo,
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
