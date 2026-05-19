import '/flutter_flow/flutter_flow_util.dart';
import 'accueil_arcane2_copy_widget.dart' show AccueilArcane2CopyWidget;
import 'package:flutter/material.dart';

class AccueilArcane2CopyModel
    extends FlutterFlowModel<AccueilArcane2CopyWidget> {
  ///  Local state fields for this page.

  bool isQuestionSelected = false;

  int questionSelected = 0;

  List<String> selectedAnswers = [];
  void addToSelectedAnswers(String item) => selectedAnswers.add(item);
  void removeFromSelectedAnswers(String item) => selectedAnswers.remove(item);
  void removeAtIndexFromSelectedAnswers(int index) =>
      selectedAnswers.removeAt(index);
  void insertAtIndexInSelectedAnswers(int index, String item) =>
      selectedAnswers.insert(index, item);
  void updateSelectedAnswersAtIndex(int index, Function(String) updateFn) =>
      selectedAnswers[index] = updateFn(selectedAnswers[index]);

  int currentQuestion = 0;

  String currentAnswer = '\"\"';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
