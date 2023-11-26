import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_test_app/presentation_layer/tasks_page/tasks_page.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({super.key});

  @override
  State<AuthorizationPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final locale = AppLocalizations.of(context)!;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
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
                  controller: loginController,
                  onChanged: (value) => _canAuthorize(),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    hintText: locale.password,
                    hintStyle: textTheme.bodyMedium,
                    suffixIcon: InkWell(
                      borderRadius: BorderRadius.circular(40.0),
                      onTap: () => setState(() {
                        _isObscure = !_isObscure;
                      }),
                      child: _isObscure
                          ? const Icon(Icons.visibility_off_rounded)
                          : const Icon(Icons.visibility),
                    ),
                  ),
                  controller: passwordController,
                  onChanged: (value) => _canAuthorize(),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: !_canAuthorize()
                  ? MaterialStatePropertyAll<Color>(
                      Colors.grey.withOpacity(0.4),
                    )
                  : null,
            ),
            onPressed: _canAuthorize()
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TasksPage(),
                      ),
                    );
                  }
                : null,
            child: Text(locale.goNext),
          ),
        ),
      ),
    );
  }

  bool _canAuthorize() {
    return loginController.text.isNotEmpty &&
        loginController.text.length >= 2 &&
        passwordController.text.isNotEmpty &&
        passwordController.text.length >= 4;
  }
}
