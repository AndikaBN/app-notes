import 'package:flutter/material.dart';
import 'package:wtc_notes/core.dart';
import '../view/home_page_view.dart';

class HomePageController extends State<HomePageView> {
  static late HomePageController instance;
  late HomePageView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  int selectedIndex = 0;
  updateIndex(int newIndex) {
    selectedIndex = newIndex;
    setState(() {});
  }
}
