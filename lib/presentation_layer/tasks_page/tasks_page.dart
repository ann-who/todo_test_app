import 'package:flutter/material.dart';
import 'package:todo_test_app/presentation_layer/settings_page/settings_page.dart';

import 'package:todo_test_app/presentation_layer/tasks_page/widgets/create_task_widget.dart';
import 'package:todo_test_app/presentation_layer/tasks_page/widgets/tasks_list_widget.dart';
import 'package:todo_test_app/presentation_layer/tasks_page/widgets/wide_app_bar_widget.dart';
import 'package:todo_test_app/resources/app_colors.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: WillPopScope(
        onWillPop: () async => false,
        child: const CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            WideAppBarWidget(),
            TasksListWidget(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.person_outlined,
                color: AppColors.mainOrange,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.settings_outlined,
                color: AppColors.mainOrange,
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => CreateTask.modalBottomSheet(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
