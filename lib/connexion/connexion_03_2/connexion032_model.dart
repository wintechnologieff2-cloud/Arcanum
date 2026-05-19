import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/nav_bar/nav_bar_widget.dart';
import 'connexion032_widget.dart' show Connexion032Widget;
import 'package:flutter/material.dart';

class Connexion032Model extends FlutterFlowModel<Connexion032Widget> {
  ///  Local state fields for this page.

  int ongletCourant = 0;

  ///  State fields for stateful widgets in this page.

  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    navBarModel.dispose();
  }
}
