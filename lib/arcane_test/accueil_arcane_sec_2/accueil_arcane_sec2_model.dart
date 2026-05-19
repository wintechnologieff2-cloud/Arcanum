import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/carte_temperance_secondaire/carte_temperance_secondaire_widget.dart';
import '/index.dart';
import 'accueil_arcane_sec2_widget.dart' show AccueilArcaneSec2Widget;
import 'package:flutter/material.dart';

class AccueilArcaneSec2Model extends FlutterFlowModel<AccueilArcaneSec2Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for carteTemperanceSecondaire component.
  late CarteTemperanceSecondaireModel carteTemperanceSecondaireModel1;
  // Model for carteTemperanceSecondaire component.
  late CarteTemperanceSecondaireModel carteTemperanceSecondaireModel2;
  // Model for carteTemperanceSecondaire component.
  late CarteTemperanceSecondaireModel carteTemperanceSecondaireModel3;

  @override
  void initState(BuildContext context) {
    carteTemperanceSecondaireModel1 =
        createModel(context, () => CarteTemperanceSecondaireModel());
    carteTemperanceSecondaireModel2 =
        createModel(context, () => CarteTemperanceSecondaireModel());
    carteTemperanceSecondaireModel3 =
        createModel(context, () => CarteTemperanceSecondaireModel());
  }

  @override
  void dispose() {
    carteTemperanceSecondaireModel1.dispose();
    carteTemperanceSecondaireModel2.dispose();
    carteTemperanceSecondaireModel3.dispose();
  }
}
