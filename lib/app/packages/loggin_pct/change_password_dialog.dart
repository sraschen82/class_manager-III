import 'package:class_manager/app/data/data_base/abstract_data_base.dart';
import 'package:class_manager/app/interactors/entities/user_entity.dart';
import 'package:class_manager/app/ui/pages/components/message_dialog.dart';
import 'package:class_manager/app/ui/pages/home_page.dart';
import 'package:class_manager/app/ui/pages/initial_page.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> changePasswordDialog({required BuildContext context}) async {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  return showDialog(
      context: context,
      builder: (context) {
        validateForm() async {
          DataBase db = context.read<DataBase>();
          User user = User.empty();
          await db.fetchUser().then(
                (value) => user = value,
              );

          if (newPasswordController.text == confirmPasswordController.text &&
              confirmPasswordController.text.length > 5 &&
              user.credentials != null) {
            user.credentials!.password = newPasswordController.text;
            await db.saveUser(user: user);

            messageDialog(context: context, text: 'Senha alterada com sucesso');
            await Future.delayed(Duration(seconds: 2));
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => InitialPage(
                    pageNumb: 2,
                    title: 'Class Manager',
                  ),
                ));
          } else {
            newPasswordController.clear();
            confirmPasswordController.clear();
            Navigator.pop(context);
            await changePasswordDialog(context: context);
          }
        }

        return AlertDialog(
          backgroundColor: MyColors().dialogWidgetColor,
          shape: OutlineInputBorder(
            borderSide: BorderSide(color: MyColors().titleColor),
            borderRadius: BorderRadius.circular(12),
          ),
          titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
          title: const Center(
              child: Text(
            'MUDAR SENHA',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          )),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  color: MyColors().dialogWidgetColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      maxLength: 20,
                      cursorColor: MyColors().titleColor,
                      cursorRadius: const Radius.circular(15),
                      cursorHeight: 18,
                      showCursor: true,
                      controller: newPasswordController,
                      obscureText: true,
                      style: TextStyle(color: MyColors().titleColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          alignLabelWithHint: true,
                          labelText: 'Nova senha',
                          helper: Text(
                            'Mínimo 6 caracteres',
                            style: TextStyle(fontSize: 10),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: MyColors().titleColor,
                              ),
                              borderRadius: BorderRadius.circular(12)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: MyColors().titleColor,
                              ),
                              borderRadius: BorderRadius.circular(12)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: MyColors().titleColor,
                              ),
                              borderRadius: BorderRadius.circular(12)),
                          fillColor: MyColors().titleColor,
                          floatingLabelStyle: TextStyle(
                            color: MyColors().titleColor,
                          )),
                      autofocus: true,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
                Card(
                  color: MyColors().dialogWidgetColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      maxLength: 20,
                      cursorColor: MyColors().titleColor,
                      cursorRadius: const Radius.circular(15),
                      cursorHeight: 18,
                      showCursor: true,
                      obscureText: true,
                      controller: confirmPasswordController,
                      style: TextStyle(color: MyColors().titleColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          alignLabelWithHint: true,
                          labelText: 'Confirmar senha',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: MyColors().titleColor,
                              ),
                              borderRadius: BorderRadius.circular(12)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: MyColors().titleColor,
                              ),
                              borderRadius: BorderRadius.circular(12)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: MyColors().titleColor,
                              ),
                              borderRadius: BorderRadius.circular(12)),
                          fillColor: MyColors().titleColor,
                          floatingLabelStyle: TextStyle(
                            color: MyColors().titleColor,
                          )),
                      autofocus: false,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar')),
            TextButton(
              onPressed: () => validateForm(),
              child: const Text('Salvar'),
            ),
          ],
        );
      });
}
