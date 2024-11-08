import 'package:class_manager/app/packages/notes_pct/ui/notes_page.dart';
import 'package:class_manager/app/ui/pages/home_page.dart';
import 'package:class_manager/app/ui/pages/my_classes_page.dart';
import 'package:class_manager/app/ui/pages/revaluations_page.dart';
import 'package:class_manager/app/ui/pages/stats_page.dart';
import 'package:class_manager/app/ui/ui_elements/app_colors.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  final String title;
  final int pageNumb;

  const InitialPage({super.key, required this.title, required this.pageNumb});

  @override
  State<InitialPage> createState() => _HomePageState();
}

class _HomePageState extends State<InitialPage> {
  late int currentPageIndex;

  @override
  void initState() {
    super.initState();
    currentPageIndex = widget.pageNumb;
  }

  @override
  Widget build(BuildContext context) {
    navBarItem(
        {required String label,
        required Icon icon,
        required IconData icondata}) {
      return NavigationDestination(
        selectedIcon: Card(
          color: MyColors().paletteColor3,
          elevation: 30,
          child: SizedBox(
            child: Icon(
              icondata,
              color: MyColors().paletteColor2,
              size: 50,
            ),
          ),
        ),
        icon: icon,
        label: label,
      );
    }

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: switch (currentPageIndex) {
        0 => const MyClasses(),
        1 => const RevaluationsPage(),
        2 => const HomePage(),
        3 => const StatsPage(),
        4 => const NotesPage(),
        _ => const HomePage(),
      },
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        backgroundColor: MyColors().paletteColor1,
        overlayColor: WidgetStatePropertyAll(MyColors().paletteColor4),
        indicatorColor: MyColors().paletteColor1,
        animationDuration: const Duration(seconds: 1),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          navBarItem(
              label: 'Turmas',
              icon: const Icon(Icons.school),
              icondata: Icons.school_outlined),
          navBarItem(
              label: 'Reavaliações',
              icon: const Icon(Icons.list_alt),
              icondata: Icons.list_alt_outlined),
          navBarItem(
              label: 'Home',
              icon: Icon(
                Icons.home_outlined,
                size: 50,
                color: MyColors().paletteColor4,
              ),
              icondata: Icons.home_outlined),
          navBarItem(
              label: 'Estatísticas',
              icon: const Icon(Icons.bar_chart),
              icondata: Icons.bar_chart_rounded),
          navBarItem(
              label: 'Anotações',
              icon: const Icon(Icons.note_alt),
              icondata: Icons.note_alt_outlined),
        ],
      ),
    ));
  }
}
