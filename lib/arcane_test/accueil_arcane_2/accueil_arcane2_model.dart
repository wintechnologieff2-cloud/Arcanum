import '/components/questions_board_widget_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'accueil_arcane2_widget.dart' show AccueilArcane2Widget;
import 'package:flutter/material.dart';

class AccueilArcane2Model extends FlutterFlowModel<AccueilArcane2Widget> {
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

  ///  State fields for stateful widgets in this page.

  // Model for questionsBoardWidget component.
  late QuestionsBoardWidgetModel questionsBoardWidgetModel;

  @override
  void initState(BuildContext context) {
    questionsBoardWidgetModel =
        createModel(context, () => QuestionsBoardWidgetModel());
  }

  @override
  void dispose() {
    questionsBoardWidgetModel.dispose();
  }
}
