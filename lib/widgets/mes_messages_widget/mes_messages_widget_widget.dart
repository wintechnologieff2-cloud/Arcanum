import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/message_connexion_widget/message_connexion_widget_widget.dart';
import '/widgets/no_conversation_widget/no_conversation_widget_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'mes_messages_widget_model.dart';
export 'mes_messages_widget_model.dart';

class MesMessagesWidgetWidget extends StatefulWidget {
  const MesMessagesWidgetWidget({super.key});

  @override
  State<MesMessagesWidgetWidget> createState() =>
      _MesMessagesWidgetWidgetState();
}

class _MesMessagesWidgetWidgetState extends State<MesMessagesWidgetWidget> {
  late MesMessagesWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MesMessagesWidgetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFAF2E9),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
          bottomLeft: Radius.circular(16.0),
          bottomRight: Radius.circular(16.0),
        ),
        border: Border.all(
          color: Color(0xFFCCCCCC),
          width: 1.5,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: Container(
                decoration: BoxDecoration(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 20.0, 0.0, 0.0),
            child: StreamBuilder<List<ChatRecord>>(
              stream: queryChatRecord(
                queryBuilder: (chatRecord) => chatRecord.where(
                  'userIDs',
                  arrayContains: currentUserReference,
                ),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                List<ChatRecord> rowChatRecordList = snapshot.data!;

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:
                        List.generate(rowChatRecordList.length, (rowIndex) {
                      final rowChatRecord = rowChatRecordList[rowIndex];
                      return Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Container(
                          width: 74.0,
                          height: 91.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFFAF2E9),
                          ),
                          child: StreamBuilder<UsersRecord>(
                            stream: UsersRecord.getDocument(
                                functions.getOtherUserRef(
                                    rowChatRecord.userIDs.toList(),
                                    currentUserReference!)),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }

                              final columnUsersRecord = snapshot.data!;

                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    ChatConversationWidget.routeName,
                                    queryParameters: {
                                      'chatRef': serializeParam(
                                        rowChatRecord.reference,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: 74.0,
                                          height: 74.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFAF2E9),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(37.0),
                                              topRight: Radius.circular(37.0),
                                              bottomLeft: Radius.circular(37.0),
                                              bottomRight:
                                                  Radius.circular(37.0),
                                            ),
                                            child: Image.network(
                                              columnUsersRecord.photoUrl,
                                              width: 74.0,
                                              height: 74.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        if (columnUsersRecord.isOnline)
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      55.0, 4.0, 0.0, 0.0),
                                              child: Container(
                                                width: 15.0,
                                                height: 15.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF2DDF00),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(7.5),
                                                    topRight:
                                                        Radius.circular(7.5),
                                                    bottomLeft:
                                                        Radius.circular(7.5),
                                                    bottomRight:
                                                        Radius.circular(7.5),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Text(
                                        columnUsersRecord.displayName,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.spectral(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF7E8491),
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-1.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.5, 15.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'sznwzrlo' /* Messages */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.spectral(
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: Color(0xFF7E8491),
                      fontSize: 15.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<List<ChatRecord>>(
              stream: queryChatRecord(
                queryBuilder: (chatRecord) => chatRecord
                    .where(
                      'userIDs',
                      arrayContains: currentUserReference,
                    )
                    .orderBy('timeStamp', descending: true),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                List<ChatRecord> listViewChatRecordList = snapshot.data!;
                if (listViewChatRecordList.isEmpty) {
                  return NoConversationWidgetWidget();
                }

                return ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewChatRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewChatRecord =
                        listViewChatRecordList[listViewIndex];
                    return Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 10.0, 12.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              ChatConversationWidget.routeName,
                              queryParameters: {
                                'chatRef': serializeParam(
                                  listViewChatRecord.reference,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: MessageConnexionWidgetWidget(
                            key: Key(
                                'Keyjmp_${listViewIndex}_of_${listViewChatRecordList.length}'),
                            chatRef: listViewChatRecord.reference,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
