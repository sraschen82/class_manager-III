import 'package:class_manager/app/packages/loggin_pct/login_states.dart';
import 'package:class_manager/app/packages/loggin_pct/login_store.dart';
import 'package:class_manager/app/packages/loggin_pct/pages/login_page.dart';
import 'package:class_manager/app/ui/pages/initial_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginSwitchPage extends StatefulWidget {
  const LoginSwitchPage({super.key});

  @override
  State<LoginSwitchPage> createState() => _LoginSwitchPageState();
}

class _LoginSwitchPageState extends State<LoginSwitchPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      context.read<LoginStore>().checkFastLogin().listen(
            (event) {},
          );
      context.read<LoginStore>().stateStream.listen(
            (event) {},
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    LoginStore store = context.watch<LoginStore>();
    return SizedBox(
      height: 50,
      child: StreamBuilder(
        stream: store.stateStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: SizedBox(child: CircularProgressIndicator()));
          }
          if (snapshot.hasData) {
            switch (snapshot.data) {
              case null:
                return const LoginPage(isRegisterPage: true);

              case UnLogged():
                return const LoginPage(isRegisterPage: true);

              case FastLogin():
                return const LoginPage(isRegisterPage: false);

              case Logged():
                return const InitialPage(
                  pageNumb: 2,
                  title: 'Class Manager',
                );
            }
          } else {
            return const LoginPage(isRegisterPage: true);
          }
        },
      ),
    );
  }
}
