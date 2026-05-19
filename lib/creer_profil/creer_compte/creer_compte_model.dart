import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'creer_compte_widget.dart' show CreerCompteWidget;
import 'package:flutter/material.dart';

class CreerCompteModel extends FlutterFlowModel<CreerCompteWidget> {
  ///  Local state fields for this page.

  String? adresse;

  ///  State fields for stateful widgets in this page.

  // State field(s) for adresseCourriel widget.
  FocusNode? adresseCourrielFocusNode;
  TextEditingController? adresseCourrielTextController;
  String? Function(BuildContext, String?)?
      adresseCourrielTextControllerValidator;
  // State field(s) for motDePasse widget.
  FocusNode? motDePasseFocusNode;
  TextEditingController? motDePasseTextController;
  late bool motDePasseVisibility;
  String? Function(BuildContext, String?)? motDePasseTextControllerValidator;
  // State field(s) for ConfmotDePasse widget.
  FocusNode? confmotDePasseFocusNode;
  TextEditingController? confmotDePasseTextController;
  late bool confmotDePasseVisibility;
  String? Function(BuildContext, String?)?
      confmotDePasseTextControllerValidator;

  @override
  void initState(BuildContext context) {
    motDePasseVisibility = false;
    confmotDePasseVisibility = false;
  }

  @override
  void dispose() {
    adresseCourrielFocusNode?.dispose();
    adresseCourrielTextController?.dispose();

    motDePasseFocusNode?.dispose();
    motDePasseTextController?.dispose();

    confmotDePasseFocusNode?.dispose();
    confmotDePasseTextController?.dispose();
  }
}
