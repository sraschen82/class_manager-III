import 'package:class_manager/app/data/data_base/abstract_data_base.dart';
import 'package:class_manager/app/packages/loggin_pct/components/email_tff.dart';
import 'package:class_manager/app/packages/loggin_pct/components/name_tff.dart';
import 'package:class_manager/app/packages/loggin_pct/credentials_entity.dart';
import 'package:class_manager/app/packages/loggin_pct/login_states.dart';
import 'package:class_manager/app/packages/loggin_pct/login_store.dart';
import 'package:class_manager/app/packages/loggin_pct/validate.dart';
import 'package:class_manager/app/ui/pages/initial_page.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final bool isRegisterPage;
  const LoginPage({required this.isRegisterPage, super.key});

  @override
  State<LoginPage> createState() => _LogginPageState();
}

class _LogginPageState extends State<LoginPage> {
  late final LoginStore _store;

  late bool isRegister;
  String userName = '';
  String userPassword = '';

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isRegister = widget.isRegisterPage;

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        _store = context.read<LoginStore>();
        await context.read<DataBase>().fetchUser().then((value) {
          userName = value.credentials!.name!;
          userPassword = value.credentials!.password!;
        });

        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _store.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    clearControllers() {
      nameController.clear();
      emailController.clear();
      passwordController.clear();
      confirmpasswordController.clear();
    }

    validatorForm() async {
      if (isRegister) {
        if (Validate.register(
            name: nameController.text,
            email: emailController.text,
            password: passwordController.text,
            confirmPassword: confirmpasswordController.text)) {
          final Credentials credentials = Credentials()
            ..name = nameController.text
            ..email = emailController.text
            ..password = passwordController.text;

          _store.registerEvent(credentials: credentials).listen(
            (event) {
              if (event is Logged) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const InitialPage(
                          pageNumb: 2,
                          title: 'Class Manager',
                        )));
              }
            },
          );
          clearControllers();
        }
      } else {
        _store
            .logginEvent(
                email: emailController.text, password: passwordController.text)
            .listen(
          (event) {
            if (event is Logged) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const InitialPage(
                        pageNumb: 2,
                        title: 'Class Manager',
                      )));
            }
          },
        );
        clearControllers();
      }
    }

    return Card(
      child: DecoratedBox(
        decoration: BoxDecoration(gradient: MyColors().gradientHomePage()),
        child: SizedBox(
          height: height * .9,
          width: width * .98,
          child: Center(
            child: Column(
              children: [
                Flexible(
                    fit: FlexFit.tight,
                    flex: 4,
                    child: Image.asset(
                      'assets/image/logoMaua1.gif',
                    )
                        .animate()
                        .align()
                        .slideX()
                        .scaleXY(
                            begin: 0.5,
                            end: 1,
                            duration: const Duration(seconds: 3))
                        .shakeX(
                            delay: const Duration(seconds: 5),
                            duration: const Duration(milliseconds: 300))
                        .shimmer(
                            delay: const Duration(seconds: 3),
                            color: Colors.white)
                        .then()
                        .animate(onPlay: (c) => c.repeat())
                        .shimmer(
                            delay: const Duration(seconds: 8),
                            color: Colors.white)),
                Flexible(
                  flex: 10,
                  child: SingleChildScrollView(
                    child: Card(
                      elevation: 0,
                      margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      borderOnForeground: true,
                      color: Colors.black.withOpacity(0.2),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Center(
                              child: isRegister
                                  ? Text(
                                      'REGISTER',
                                      style: TextStyle(
                                          color: MyColors().titleColor,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      'LOGIN',
                                      style: TextStyle(
                                          color: MyColors().titleColor,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                            ),
                            if (isRegister)
                              NameTextFormField(nameController: nameController),
                            if (isRegister)
                              Divider(color: Colors.white.withOpacity(0)),
                            if (isRegister || userName == '')
                              EmailTextFormField(
                                  emailController: emailController),
                            if (!isRegister && userName == '')
                              Divider(color: Colors.white.withOpacity(0)),
                            if (!isRegister && userName.length > 1)
                              Column(
                                children: [
                                  const Text('Wellcome'),
                                  Text(
                                    userName,
                                    style: const TextStyle(
                                      fontSize: 30,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Divider(
                                    color: Colors.white.withOpacity(0),
                                    height: 50,
                                  ),
                                ],
                              ),
                            if (isRegister)
                              Divider(color: Colors.white.withOpacity(0)),
                            TextFormField(
                              autovalidateMode: AutovalidateMode.always,
                              controller: passwordController,
                              autofocus: !isRegister ? true : false,
                              obscureText: true,
                              textInputAction: !isRegister
                                  ? TextInputAction.done
                                  : TextInputAction.next,
                              cursorColor: Colors.white,
                              onFieldSubmitted: (value) =>
                                  !isRegister ? validatorForm() : {},
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                hoverColor: Colors.white,
                                prefixIcon: const Icon(Icons.password,
                                    color: Colors.white),
                                errorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red)),
                                contentPadding: const EdgeInsets.all(30),
                                hintText: '  Your Password',
                                hintStyle: const TextStyle(color: Colors.white),
                                label: const Text('  Password',
                                    style: TextStyle(color: Colors.white)),
                                border: const OutlineInputBorder(
                                  gapPadding: 5,
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              enableSuggestions: true,
                              onChanged: (value) {
                                if (!isRegister &&
                                    value.isNotEmpty &&
                                    value == userPassword) {
                                  validatorForm();
                                }
                              },
                              validator: (value) =>
                                  Validate.password(password: value),
                            ),
                            Divider(color: Colors.white.withOpacity(0)),
                            if (isRegister)
                              TextFormField(
                                autovalidateMode: AutovalidateMode.always,
                                controller: confirmpasswordController,
                                obscureText: true,
                                textInputAction: TextInputAction.done,
                                cursorColor: Colors.white,
                                onFieldSubmitted: (value) => validatorForm(),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  hoverColor: Colors.white,
                                  prefixIcon: const Icon(Icons.password,
                                      color: Colors.white),
                                  errorBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  contentPadding: const EdgeInsets.all(30),
                                  hintText: '  Your Password',
                                  hintStyle:
                                      const TextStyle(color: Colors.white),
                                  label: const Text('  Confirm Password',
                                      style: TextStyle(color: Colors.white)),
                                  border: const OutlineInputBorder(
                                    gapPadding: 5,
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                                keyboardType: TextInputType.visiblePassword,
                                enableSuggestions: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return null;
                                  } else if (value.length > 5 &&
                                      value != passwordController.text) {
                                    return 'Senha incorreta.';
                                  }

                                  return null;
                                },
                              ),
                            Divider(color: Colors.white.withOpacity(0)),
                            TextButton(
                                style: ButtonStyle(
                                    backgroundColor: isRegister &&
                                            Validate.register(
                                                name: nameController.text,
                                                email: emailController.text,
                                                password:
                                                    passwordController.text,
                                                confirmPassword: confirmpasswordController
                                                    .text)
                                        ? const WidgetStatePropertyAll(
                                            Colors.blueAccent)
                                        : const WidgetStatePropertyAll(
                                            Color.fromARGB(255, 143, 140, 140)),
                                    elevation: const WidgetStatePropertyAll(30),
                                    minimumSize: const WidgetStatePropertyAll(
                                      Size(300, 60),
                                    ),
                                    maximumSize: const WidgetStatePropertyAll(
                                        Size(400, 80)),
                                    shape: const WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))))),
                                onPressed: () {
                                  validatorForm();
                                },
                                child: isRegister
                                    ? const Text('Send')
                                    : const Text('Enter')),
                            Divider(color: Colors.white.withOpacity(0)),
                            if (!isRegister)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: width * .4,
                                      child: const Text(
                                        'Don´t hava a accont?',
                                        style: TextStyle(fontSize: 15),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          clearControllers();
                                          isRegister = !isRegister;
                                        });
                                      },
                                      child: const Text(
                                        'SING UP',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              ),
                            if (isRegister)
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginPage(
                                                  isRegisterPage: false,
                                                )));
                                  },
                                  child: const Text(
                                    'Back to LOGIN.',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  )),
                            if (!isRegister && userName.length > 1)
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      clearControllers();
                                      userName = '';
                                    });
                                  },
                                  child: Text(
                                    'Sign in with another account.',
                                    style: TextStyle(
                                        color: MyColors().paletteColor2,
                                        fontWeight: FontWeight.bold),
                                  )),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
