import '/components/style_card/style_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'trending_page_widget.dart' show TrendingPageWidget;
import 'package:flutter/material.dart';

class TrendingPageModel extends FlutterFlowModel<TrendingPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for StyleCard component.
  late StyleCardModel styleCardModel;

  @override
  void initState(BuildContext context) {
    styleCardModel = createModel(context, () => StyleCardModel());
  }

  @override
  void dispose() {
    styleCardModel.dispose();
  }
}
