import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'style_card_model.dart';
export 'style_card_model.dart';

/// A Column with CrossAxisAlignment.start.
///
/// Contains:
/// 1. A ClipRRect with 12px border radius, containing an Image widget with a
/// 1:1.2 aspect ratio and network source.
/// 2. A 4px SizedBox.
/// 3. A Text widget with an example title like 'Cartoonify Yourself'.
/// The component takes an image URL and a title as parameters.
class StyleCardWidget extends StatefulWidget {
  const StyleCardWidget({super.key});

  @override
  State<StyleCardWidget> createState() => _StyleCardWidgetState();
}

class _StyleCardWidgetState extends State<StyleCardWidget> {
  late StyleCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StyleCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 200.0,
              height: 240.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  '',
                  width: 200.0,
                  height: 240.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              'Cartoonify Yourself',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
          ].divide(SizedBox(height: 4.0)),
        ),
      ),
    );
  }
}
