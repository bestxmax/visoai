import '/components/subscription_plan_card/subscription_plan_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'pro_page_widget.dart' show ProPageWidget;
import 'package:flutter/material.dart';

class ProPageModel extends FlutterFlowModel<ProPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SubscriptionPlanCard component.
  late SubscriptionPlanCardModel subscriptionPlanCardModel;

  @override
  void initState(BuildContext context) {
    subscriptionPlanCardModel =
        createModel(context, () => SubscriptionPlanCardModel());
  }

  @override
  void dispose() {
    subscriptionPlanCardModel.dispose();
  }
}
