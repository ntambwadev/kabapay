import '/components/home_page_components/home_button/home_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_buttons_model.dart';
export 'home_page_buttons_model.dart';

class HomePageButtonsWidget extends StatefulWidget {
  const HomePageButtonsWidget({Key? key}) : super(key: key);

  @override
  _HomePageButtonsWidgetState createState() => _HomePageButtonsWidgetState();
}

class _HomePageButtonsWidgetState extends State<HomePageButtonsWidget> {
  late HomePageButtonsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageButtonsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).backgroundcolor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () async {
              logFirebaseEvent('HOME_BUTTONS_Container_g4p1ceub_ON_TAP');
              logFirebaseEvent('home_button_navigate_to');

              context.pushNamed(
                'tokens_page',
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.rightToLeft,
                  ),
                },
              );
            },
            child: wrapWithModel(
              model: _model.homeButtonModel1,
              updateCallback: () => setState(() {}),
              child: HomeButtonWidget(),
            ),
          ),
          wrapWithModel(
            model: _model.homeButtonModel2,
            updateCallback: () => setState(() {}),
            child: HomeButtonWidget(),
          ),
          wrapWithModel(
            model: _model.homeButtonModel3,
            updateCallback: () => setState(() {}),
            child: HomeButtonWidget(),
          ),
        ],
      ),
    );
  }
}
