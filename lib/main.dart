import 'package:class_manager/app/data/data_base/abstract_data_base.dart';
import 'package:class_manager/app/data/data_base/abstract_db_repository.dart';
import 'package:class_manager/app/data/data_base/data_base_impl.dart';
import 'package:class_manager/app/data/data_base/isar_repository.dart';
import 'package:class_manager/app/interactors/initial_config/register_instances.dart';
import 'package:class_manager/app/interactors/stores/discipline_store.dart';
import 'package:class_manager/app/interactors/stores/schedulles_store.dart';
import 'package:class_manager/app/interactors/stores/school_class_store.dart';
import 'package:class_manager/app/interactors/stores/school_year_store.dart';
import 'package:class_manager/app/packages/loggin_pct/login_store.dart';
import 'package:class_manager/app/packages/loggin_pct/pages/switch_page.dart';
import 'package:class_manager/app/packages/notes_pct/interactors/note_store.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  await registerInstances();
  runApp(
    const ClassManager(),
  );
}

class ClassManager extends StatefulWidget {
  const ClassManager({super.key});

  @override
  State<ClassManager> createState() => _MyAppState();
}

class _MyAppState extends State<ClassManager> {
  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => IsarRepository() as DbRepository,
        ),
        Provider(
          create: (context) =>
              DataBaseImpl(repository: context.read<DbRepository>())
                  as DataBase,
        ),
        Provider(
          create: (context) => LoginStore(db: context.read<DataBase>()),
        ),
        Provider(
          create: (context) => NotesStore(db: context.read<DataBase>()),
        ),
        Provider(
          create: (context) => SchoolYearStore(db: context.read<DataBase>()),
        ),
        Provider(
          create: (context) => DisciplineStore(db: context.read<DataBase>()),
        ),
        Provider(
          create: (context) => SchoolClassStore(db: context.read<DataBase>()),
        ),
        Provider(
          create: (context) => SchedullesStore(db: context.read<DataBase>()),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Class Manager',
          theme: ThemeData(
            primaryTextTheme:
                Typography(platform: TargetPlatform.android).white,
            textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                    foregroundColor:
                        WidgetStatePropertyAll(MyColors().titleColor))),
            iconTheme: const IconThemeData(color: Colors.white),
            primaryIconTheme: const IconThemeData(color: Colors.white),
            textTheme: Typography(platform: TargetPlatform.android).white,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              elevation: 80,
              backgroundColor: Color.fromARGB(255, 1, 4, 34),
            ),
            cardColor: MyColors().paletteColor1,
            cardTheme: const CardTheme(
              elevation: 15,
            ),
            focusColor: Colors.black.withOpacity(.3),
            brightness: Brightness.dark,
            visualDensity: VisualDensity.comfortable,
            colorScheme: ColorScheme.dark(surface: MyColors().paletteColor1),
            useMaterial3: true,
          ),
          home: const LoginSwitchPage()),
    );
  }
}
