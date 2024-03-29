import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_balance_model.dart';
export 'home_page_balance_model.dart';

class HomePageBalanceWidget extends StatefulWidget {
  const HomePageBalanceWidget({Key? key}) : super(key: key);

  @override
  _HomePageBalanceWidgetState createState() => _HomePageBalanceWidgetState();
}

class _HomePageBalanceWidgetState extends State<HomePageBalanceWidget> {
  late HomePageBalanceModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageBalanceModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double total = Provider.of<double?>(context) ?? 0.0;
    return Container(
      width: double.infinity,
      height: 100.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            FFLocalizations.of(context).getText(
              'nvsz7pmg' /* Balance */,
            ),
            style: FlutterFlowTheme.of(context).subtitle2.override(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                ),
          ),
          Text(
            '\$${total.toStringAsFixed(2)}',
            maxLines: 1,
            style: FlutterFlowTheme.of(context).title1.override(
                  fontFamily: 'Poppins',
                  fontSize: 48.0,
                  fontWeight: FontWeight.normal,
                ),
          ),
        ],
      ),
    );
  }
}
