import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'se_connecter_widget.dart' show SeConnecterWidget;
import 'package:flutter/material.dart';

class SeConnecterModel extends FlutterFlowModel<SeConnecterWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for adresseCourriel widget.
  FocusNode? adresseCourrielFocusNode;
  TextEditingController? adresseCourrielTextController;
  String? Function(BuildContext, String?)?
      adresseCourrielTextControllerValidator;
  // State field(s) for MotDePasse widget.
  FocusNode? motDePasseFocusNode;
  TextEditingController? motDePasseTextController;
  late bool motDePasseVisibility;
  String? Function(BuildContext, String?)? motDePasseTextControllerValidator;

  @override
  void initState(BuildContext context) {
    motDePasseVisibility = false;
  }

  @override
  void dispose() {
    adresseCourrielFocusNode?.dispose();
    adresseCourrielTextController?.dispose();

    motDePasseFocusNode?.dispose();
    motDePasseTextController?.dispose();
  }
}
