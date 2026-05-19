import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/nav_bar/nav_bar_widget.dart';
import '/index.dart';
import 'settings2_widget.dart' show Settings2Widget;
import 'package:flutter/material.dart';

class Settings2Model extends FlutterFlowModel<Settings2Widget> {
  ///  Local state fields for this page.

  bool? isFrancais;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Switch widget.
  bool? switchValue;
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
