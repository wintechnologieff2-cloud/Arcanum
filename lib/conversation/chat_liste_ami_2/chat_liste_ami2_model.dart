import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/mes_messages_widget/mes_messages_widget_widget.dart';
import '/widgets/nav_bar/nav_bar_widget.dart';
import 'chat_liste_ami2_widget.dart' show ChatListeAmi2Widget;
import 'package:flutter/material.dart';

class ChatListeAmi2Model extends FlutterFlowModel<ChatListeAmi2Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for mesMessagesWidget component.
  late MesMessagesWidgetModel mesMessagesWidgetModel;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    mesMessagesWidgetModel =
        createModel(context, () => MesMessagesWidgetModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    mesMessagesWidgetModel.dispose();
    navBarModel.dispose();
  }
}
