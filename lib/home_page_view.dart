// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:wtc_notes/add_notes.dart';
import 'package:wtc_notes/page_gabut.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("WTC Note"),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "With SQFLite",
              ),
              Tab(
                text: "With Local Variable",
              ),
            ],
          ),
        ),
        body: TabBarView(children: [AddNotesPage(), TestLogic()]),
      ),
    );
  }
}
