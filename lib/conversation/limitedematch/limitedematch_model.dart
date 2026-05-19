import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/freemium/freemium_widget.dart';
import 'limitedematch_widget.dart' show LimitedematchWidget;
import 'package:flutter/material.dart';

class LimitedematchModel extends FlutterFlowModel<LimitedematchWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for freemium component.
  late FreemiumModel freemiumModel;

  @override
  void initState(BuildContext context) {
    freemiumModel = createModel(context, () => FreemiumModel());
  }

  @override
  void dispose() {
    freemiumModel.dispose();
  }
}
