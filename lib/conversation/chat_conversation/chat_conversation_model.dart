import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'chat_conversation_widget.dart' show ChatConversationWidget;
import 'package:flutter/material.dart';

class ChatConversationModel extends FlutterFlowModel<ChatConversationWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  int? chatCount;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
