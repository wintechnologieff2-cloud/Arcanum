import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'tutoriel_widget.dart' show TutorielWidget;
import 'package:flutter/material.dart';

class TutorielModel extends FlutterFlowModel<TutorielWidget> {
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

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
