import 'package:class_manager/app/data/data_base/abstract_data_base.dart';
import 'package:class_manager/app/interactors/entities/user_entity.dart';
import 'package:class_manager/app/packages/loggin_pct/change_password_dialog.dart';

import 'package:class_manager/app/ui/pages/components/generic_confirm_dialog.dart';
import 'package:class_manager/app/ui/pages/components/home_page/school_years/add_school_year_dialog.dart';
import 'package:class_manager/app/ui/pages/components/home_page/school_years/remove_school_year_dialog.dart';
import 'package:class_manager/app/ui/pages/components/home_page/school_years/select_school_year_dialog.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:class_manager/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  late DataBase db;
  late User user;
  @override
  void initState() {
    super.initState();
    context.read<DataBase>().fetchUser().then(
          (value) => user = value,
        );
  }

  @override
  Widget build(BuildContext context) {
    db = context.watch<DataBase>();
    return Drawer(
      child: Column(
        children: [
          SizedBox(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
                child: Column(
                  children: [
                    Text(
                      'Configurações do usuário',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    ListTile(
                      title: Text('Alterar senha'),
                      onTap: () async {
                        await changePasswordDialog(context: context);
                      },
                    ),
                    ListTile(
                      title: Text('Excluir usuário'),
                      onTap: () async {
                        await confirmDialog(
                            context: context,
                            title: 'ALERTA!',
                            text:
                                'Você deseja, realmente, excluir o usuário?\n\nTodas as informações salvas serão apagadas.',
                            action: () async {
                              await db.deleteUser(user: user);

                              Navigator.pop(context);
                            });
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ClassManager(),
                            ));
                      },
                    ),
                    ListTile(
                      title: Text('Sair'),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ClassManager(),
                            ));
                      },
                    ),
                  ],
                ),
              )),
          Divider(),
          ListTile(
            title: Text('Selecionar ano letivo'),
            onTap: () async {
              await selectSchoolYearDialog(context: context);
            },
          ),
          ListTile(
            title: Text('Adicionar ano letivo'),
            onTap: () async {
              await addSchoolYearDialog(context: context);
            },
          ),
          ListTile(
            title: Text('Remover ano letivo'),
            onTap: () async {
              await removeSchoolYearDialog(context: context);
            },
          ),
        ],
      ),
      elevation: 20,
      backgroundColor: MyColors().paletteColor1.withOpacity(.7),
    );
  }
}
