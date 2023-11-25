import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo_test_app/business_logic/task_bloc/task.dart';
import 'package:todo_test_app/data_layer/models/task_model/task_model.dart';
import 'package:todo_test_app/data_layer/models/task_status.dart';

class CreateTask {
  CreateTask._();

  static Future modalBottomSheet(BuildContext context) async {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    await showModalBottomSheet(
      context: context,
      useSafeArea: true,
      useRootNavigator: true,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24.0),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 16.0,
              left: 16.0,
              right: 16.0,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.7,
              ),
              child: Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Новая задача'),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      maxLines: 3,
                      decoration: const InputDecoration(
                        hintText: 'Task\'s name or short description',
                      ),
                      controller: titleController,
                    ),
                    const SizedBox(height: 20.0),
                    TextField(
                      maxLines: 10,
                      decoration: const InputDecoration(
                        hintText: 'Detailed description',
                      ),
                      controller: descriptionController,
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                        onPressed: () {
                          if (titleController.text.isNotEmpty) {
                            context.read<TaskBloc>().add(
                                  TaskCreated(
                                    task: TaskModel(
                                      id: Random().nextInt(100),
                                      shortDescription: titleController.text,
                                      detailedDescription:
                                          descriptionController.text,
                                      status: TaskStatus.fresh,
                                      creationDate: DateTime.now(),
                                    ),
                                  ),
                                );

                            Navigator.of(context).pop();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Enter text')),
                            );
                          }
                        },
                        child: const Text('Создать задачу'),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
