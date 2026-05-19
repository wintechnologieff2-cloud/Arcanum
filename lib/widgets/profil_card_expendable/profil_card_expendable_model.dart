import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/arcaniste_widget_grand/arcaniste_widget_grand_widget.dart';
import '/widgets/small_profil_card/small_profil_card_widget.dart';
import 'profil_card_expendable_widget.dart' show ProfilCardExpendableWidget;
import 'package:flutter/material.dart';

class ProfilCardExpendableModel
    extends FlutterFlowModel<ProfilCardExpendableWidget> {
  ///  Local state fields for this component.

  bool isWidgetExpanded = false;

  ///  State fields for stateful widgets in this component.

  // Model for arcanisteWidgetGrand component.
  late ArcanisteWidgetGrandModel arcanisteWidgetGrandModel;
  // Model for smallProfilCard component.
  late SmallProfilCardModel smallProfilCardModel;

  @override
  void initState(BuildContext context) {
    arcanisteWidgetGrandModel =
        createModel(context, () => ArcanisteWidgetGrandModel());
    smallProfilCardModel = createModel(context, () => SmallProfilCardModel());
  }

  @override
  void dispose() {
    arcanisteWidgetGrandModel.dispose();
    smallProfilCardModel.dispose();
  }
}
