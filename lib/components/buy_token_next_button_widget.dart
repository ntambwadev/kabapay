import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'buy_token_next_button_model.dart';
export 'buy_token_next_button_model.dart';

class BuyTokenNextButtonWidget extends StatefulWidget {
  const BuyTokenNextButtonWidget({Key? key}) : super(key: key);

  @override
  _BuyTokenNextButtonWidgetState createState() =>
      _BuyTokenNextButtonWidgetState();
}

class _BuyTokenNextButtonWidgetState extends State<BuyTokenNextButtonWidget> {
  late BuyTokenNextButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuyTokenNextButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () async {
        logFirebaseEvent('BUY_TOKEN_NEXT_BUTTON_NEXT_BTN_ON_TAP');
        logFirebaseEvent('Button_navigate_to');

        context.pushNamed(
          'payment_methods_page',
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.rightToLeft,
            ),
          },
        );
      },
      text: FFLocalizations.of(context).getText(
        '8ze2o2h0' /* Next */,
      ),
      options: FFButtonOptions(
        width: double.infinity,
        height: 50,
        color: FlutterFlowTheme.of(context).primaryColor,
        textStyle: FlutterFlowTheme.of(context).subtitle2.override(
              fontFamily: 'Poppins',
              color: Colors.white,
            ),
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
