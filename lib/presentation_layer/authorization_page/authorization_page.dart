import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:todo_test_app/business_logic/authentification_bloc/authentification.dart';
import 'package:todo_test_app/data_layer/models/auth_state_status.dart';
import 'package:todo_test_app/presentation_layer/tasks_page/tasks_page.dart';

class AuthorizationPage extends StatelessWidget {
  AuthorizationPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final locale = AppLocalizations.of(context)!;
    final authBloc = context.read<AuthentificationBloc>();

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<AuthentificationBloc, AuthentificationState>(
          listenWhen: (previous, current) => previous.status != current.status,
          listener: (context, state) {
            if (state.canAuthorize &&
                state.status == AuthStateStatus.authorized) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TasksPage(),
                ),
              );
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: locale.login,
                        hintStyle: textTheme.bodyMedium,
                      ),
                      controller: emailController,
                      onChanged: (value) => authBloc.add(
                        CredentialsChecked(
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      obscureText: state.obscurePassword,
                      decoration: InputDecoration(
                        hintText: locale.password,
                        hintStyle: textTheme.bodyMedium,
                        suffixIcon: InkWell(
                          borderRadius: BorderRadius.circular(40.0),
                          onTap: () => authBloc.add(PasswordShowed()),
                          child: state.obscurePassword
                              ? const Icon(Icons.visibility_off_rounded)
                              : const Icon(Icons.visibility),
                        ),
                      ),
                      controller: passwordController,
                      onChanged: (value) => authBloc.add(
                        CredentialsChecked(
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      ),
                    ),
                    if (state.status == AuthStateStatus.error)
                      const SizedBox(height: 16.0),
                    if (state.status == AuthStateStatus.error)
                      Text(
                        locale.loginError,
                        style: const TextStyle(color: Colors.red),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<AuthentificationBloc, AuthentificationState>(
            buildWhen: (previous, current) =>
                previous.canAuthorize != current.canAuthorize,
            builder: (context, state) {
              return ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: !state.canAuthorize
                      ? MaterialStatePropertyAll<Color>(
                          Colors.grey.withOpacity(0.4),
                        )
                      : null,
                ),
                onPressed: state.canAuthorize
                    ? () => authBloc.add(UserAuthorized(
                          email: emailController.text,
                          password: passwordController.text,
                        ))
                    : null,
                child: Text(locale.goNext),
              );
            },
          ),
        ),
      ),
    );
  }
}
