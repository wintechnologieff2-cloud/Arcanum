import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/nav_bar/nav_bar_widget.dart';
import 'profile_complet_widget.dart' show ProfileCompletWidget;
import 'package:flutter/material.dart';

class ProfileCompletModel extends FlutterFlowModel<ProfileCompletWidget> {
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
