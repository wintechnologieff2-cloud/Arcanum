import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/nav_bar/nav_bar_widget.dart';
import '/widgets/no_conversation_widget/no_conversation_widget_widget.dart';
import 'conversations_empty_widget.dart' show ConversationsEmptyWidget;
import 'package:flutter/material.dart';

class ConversationsEmptyModel
    extends FlutterFlowModel<ConversationsEmptyWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NoConversationWidget component.
  late NoConversationWidgetModel noConversationWidgetModel;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    noConversationWidgetModel =
        createModel(context, () => NoConversationWidgetModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    noConversationWidgetModel.dispose();
    navBarModel.dispose();
  }
}
