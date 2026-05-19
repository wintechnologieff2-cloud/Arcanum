import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/widgets/nav_bar/nav_bar_widget.dart';
import 'explore02_copy_widget.dart' show Explore02CopyWidget;
import 'package:flutter/material.dart';

class Explore02CopyModel extends FlutterFlowModel<Explore02CopyWidget> {
  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    navBarModel.dispose();
  }
}
