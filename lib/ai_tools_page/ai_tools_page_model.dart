import '/components/ai_tool_card/ai_tool_card_widget.dart';
import '/components/ai_tool_card2/ai_tool_card2_widget.dart';
import '/components/ai_tool_card3/ai_tool_card3_widget.dart';
import '/components/ai_tool_card4/ai_tool_card4_widget.dart';
import '/components/ai_tool_card5/ai_tool_card5_widget.dart';
import '/components/bottom_nav_bar/bottom_nav_bar_widget.dart';
import '/components/main_app_bar/main_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ai_tools_page_widget.dart' show AiToolsPageWidget;
import 'package:flutter/material.dart';

class AiToolsPageModel extends FlutterFlowModel<AiToolsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MainAppBar component.
  late MainAppBarModel mainAppBarModel;
  // Model for AiToolCard component.
  late AiToolCardModel aiToolCardModel;
  // Model for AiToolCard2 component.
  late AiToolCard2Model aiToolCard2Model;
  // Model for AiToolCard3 component.
  late AiToolCard3Model aiToolCard3Model;
  // Model for AiToolCard4 component.
  late AiToolCard4Model aiToolCard4Model;
  // Model for AiToolCard5 component.
  late AiToolCard5Model aiToolCard5Model;
  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;

  @override
  void initState(BuildContext context) {
    mainAppBarModel = createModel(context, () => MainAppBarModel());
    aiToolCardModel = createModel(context, () => AiToolCardModel());
    aiToolCard2Model = createModel(context, () => AiToolCard2Model());
    aiToolCard3Model = createModel(context, () => AiToolCard3Model());
    aiToolCard4Model = createModel(context, () => AiToolCard4Model());
    aiToolCard5Model = createModel(context, () => AiToolCard5Model());
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
  }

  @override
  void dispose() {
    mainAppBarModel.dispose();
    aiToolCardModel.dispose();
    aiToolCard2Model.dispose();
    aiToolCard3Model.dispose();
    aiToolCard4Model.dispose();
    aiToolCard5Model.dispose();
    bottomNavBarModel.dispose();
  }
}
