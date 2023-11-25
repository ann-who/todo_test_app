import 'package:flutter/material.dart';
import 'package:todo_test_app/resources/app_colors.dart';

class CreateTask {
  CreateTask._();

  static Future modalBottomSheet(BuildContext context) async {
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Новая задача'),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Task\'s name or short description',
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    maxLines: 10,
                    decoration: InputDecoration(
                      hintText: 'Detailed description',
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: AppColors.blue,
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      alignment: Alignment.center,
                      child: Text('Создать задачу'),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
