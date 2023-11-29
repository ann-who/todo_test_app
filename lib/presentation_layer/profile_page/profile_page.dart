import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:todo_test_app/business_logic/authentification_bloc/authentification.dart';
import 'package:todo_test_app/business_logic/task_bloc/task.dart' as task;
import 'package:todo_test_app/presentation_layer/authorization_page/authorization_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    var email = FirebaseAuth.instance.currentUser!.email!;

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.yourProfile),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              size: MediaQuery.of(context).size.width / 2,
            ),
            Text(locale.hello(email)),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.maxFinite,
          child: BlocListener<AuthentificationBloc, AuthentificationState>(
            listener: (context, state) {
              if (!state.isAuthorized) {
                context.read<task.TaskBloc>().add(task.UserSignedOut());
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => AuthorizationPage(),
                ));
              }
            },
            child: ElevatedButton(
              onPressed: () {
                context.read<AuthentificationBloc>().add(UserSignedOut());
              },
              child: Text(locale.logOut),
            ),
          ),
        ),
      ),
    );
  }
}
