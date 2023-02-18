import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'top_separator_model.dart';
export 'top_separator_model.dart';

class TopSeparatorWidget extends StatefulWidget {
  const TopSeparatorWidget({Key? key}) : super(key: key);

  @override
  _TopSeparatorWidgetState createState() => _TopSeparatorWidgetState();
}

class _TopSeparatorWidgetState extends State<TopSeparatorWidget> {
  late TopSeparatorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopSeparatorModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
      child: Container(
        width: 50,
        height: 4,
        decoration: BoxDecoration(
          color: Color(0xFFB8B8B8),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
