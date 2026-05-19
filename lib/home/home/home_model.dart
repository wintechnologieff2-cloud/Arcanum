import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/arcane_du_jour/arcane_du_jour_widget.dart';
import '/widgets/arcane_signification/arcane_signification_widget.dart';
import '/widgets/nav_bar/nav_bar_widget.dart';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for arcaneDuJour component.
  late ArcaneDuJourModel arcaneDuJourModel;
  // Model for arcaneSignification component.
  late ArcaneSignificationModel arcaneSignificationModel;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    arcaneDuJourModel = createModel(context, () => ArcaneDuJourModel());
    arcaneSignificationModel =
        createModel(context, () => ArcaneSignificationModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    arcaneDuJourModel.dispose();
    arcaneSignificationModel.dispose();
    navBarModel.dispose();
  }
}
