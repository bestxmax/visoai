import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'simple_app_bar_model.dart';
export 'simple_app_bar_model.dart';

/// An AppBar with elevation 0 and a white background.
///
/// It has a leading back arrow Icon button. The title is a Text widget
/// displaying the page name. It may optionally contain an action button on
/// the right.
class SimpleAppBarWidget extends StatefulWidget {
  const SimpleAppBarWidget({super.key});

  @override
  State<SimpleAppBarWidget> createState() => _SimpleAppBarWidgetState();
}

class _SimpleAppBarWidgetState extends State<SimpleAppBarWidget> {
  late SimpleAppBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SimpleAppBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      automaticallyImplyLeading: false,
      leading: FlutterFlowIconButton(
        borderColor: Colors.transparent,
        borderRadius: 8.0,
        buttonSize: 40.0,
        icon: Icon(
          Icons.arrow_back_rounded,
          color: FlutterFlowTheme.of(context).primaryText,
          size: 24.0,
        ),
        onPressed: () async {
          context.pushNamed(HomePageWidget.routeName);
        },
      ),
      title: Text(
        FFLocalizations.of(context).getText(
          'ayliupf2' /* Page Title */,
        ),
        style: FlutterFlowTheme.of(context).headlineMedium.override(
              font: GoogleFonts.interTight(
                fontWeight:
                    FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                fontStyle:
                    FlutterFlowTheme.of(context).headlineMedium.fontStyle,
              ),
              letterSpacing: 0.0,
              fontWeight:
                  FlutterFlowTheme.of(context).headlineMedium.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
            ),
      ),
      actions: [
        FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 8.0,
          buttonSize: 40.0,
          icon: Icon(
            Icons.more_vert,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24.0,
          ),
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
      ],
      centerTitle: false,
      elevation: 0.0,
    );
  }
}
