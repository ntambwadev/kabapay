import '/components/recipients/recipient_item/recipient_item_widget.dart';
import '/components/tokens/tokens_list_placeholder/tokens_list_placeholder_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'recipient_list_model.dart';
export 'recipient_list_model.dart';

class RecipientListWidget extends StatefulWidget {
  const RecipientListWidget({Key? key}) : super(key: key);

  @override
  _RecipientListWidgetState createState() => _RecipientListWidgetState();
}

class _RecipientListWidgetState extends State<RecipientListWidget> {
  late RecipientListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecipientListModel());
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
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).lineColor,
      ),
      child: Builder(
        builder: (context) {
          final items = List.generate(random_data.randomInteger(5, 5),
                  (index) => random_data.randomName(true, false))
              .toList()
              .take(5)
              .toList();
          if (items.isEmpty) {
            return Center(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: TokensListPlaceholderWidget(),
              ),
            );
          }
          return ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemCount: items.length,
            itemBuilder: (context, itemsIndex) {
              final itemsItem = items[itemsIndex];
              return RecipientItemWidget(
                key: Key('Keyd9r_${itemsIndex}_of_${items.length}'),
              );
            },
          );
        },
      ),
    );
  }
}
