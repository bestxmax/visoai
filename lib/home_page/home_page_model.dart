import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/components/main_app_bar/main_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MainAppBar component.
  late MainAppBarModel mainAppBarModel;
  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;

  @override
  void initState(BuildContext context) {
    mainAppBarModel = createModel(context, () => MainAppBarModel());
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
  }

  @override
  void dispose() {
    mainAppBarModel.dispose();
    bottomNavBarModel.dispose();
  }
}
