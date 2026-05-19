import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/demande_connexion_widget/demande_connexion_widget_widget.dart';
import '/widgets/nav_bar/nav_bar_widget.dart';
import '/widgets/no_connexion_widget/no_connexion_widget_widget.dart';
import '/widgets/small_profil_card/small_profil_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'connexion032_model.dart';
export 'connexion032_model.dart';

class Connexion032Widget extends StatefulWidget {
  const Connexion032Widget({super.key});

  static String routeName = 'connexion_03_2';
  static String routePath = '/connexion032';

  @override
  State<Connexion032Widget> createState() => _Connexion032WidgetState();
}

class _Connexion032WidgetState extends State<Connexion032Widget> {
  late Connexion032Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Connexion032Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/ba733781644e66f8143994ae70c17c1218098ed6.png',
              ).image,
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/arcanum-7wx74m/assets/1a99yswb8t7u/Lavender_tarot_card_logo_design-2.png',
                            width: 210.0,
                            height: 120.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        '1tb3q99f' /* Mes connexions */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.spectral(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: Color(0xFF676C78),
                            fontSize: 30.0,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: Container(
                        width: 335.0,
                        height: 33.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF7E8491), Color(0x187E8491)],
                            stops: [0.0, 0.4],
                            begin: AlignmentDirectional(0.0, -1.0),
                            end: AlignmentDirectional(0, 1.0),
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.5),
                            topRight: Radius.circular(16.5),
                            bottomLeft: Radius.circular(16.5),
                            bottomRight: Radius.circular(16.5),
                          ),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            width: 0.5,
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.ongletCourant = 0;
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 167.5,
                                  height: 33.0,
                                  decoration: BoxDecoration(
                                    color: _model.ongletCourant == 0
                                        ? Color(0xFFE4BAFF)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(16.5),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        'Connexions (${valueOrDefault<String>(
                                          (currentUserDocument?.connexionList
                                                      .toList() ??
                                                  [])
                                              .length
                                              .toString(),
                                          '0',
                                        )})',
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
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
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.ongletCourant = 1;
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 167.5,
                                  height: 33.0,
                                  decoration: BoxDecoration(
                                    color: _model.ongletCourant == 1
                                        ? FlutterFlowTheme.of(context).accent1
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(16.5),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        'Demandes (${valueOrDefault<String>(
                                          (currentUserDocument?.demandeUserList
                                                      .toList() ??
                                                  [])
                                              .length
                                              .toString(),
                                          '0',
                                        )})',
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
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
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (_model.ongletCourant == 1)
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 15.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 510.0,
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
                            child: AuthUserStreamWidget(
                              builder: (context) => Builder(
                                builder: (context) {
                                  final demandeList = (currentUserDocument
                                              ?.demandeUserList
                                              .toList() ??
                                          [])
                                      .toList();
                                  if (demandeList.isEmpty) {
                                    return NoConnexionWidgetWidget();
                                  }

                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children:
                                          List.generate(demandeList.length,
                                              (demandeListIndex) {
                                        final demandeListItem =
                                            demandeList[demandeListIndex];
                                        return Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: DemandeConnexionWidgetWidget(
                                            key: Key(
                                                'Key8m9_${demandeListIndex}_of_${demandeList.length}'),
                                            userRef: demandeListItem,
                                          ),
                                        );
                                      }).addToStart(SizedBox(height: 8.0)),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (_model.ongletCourant == 0)
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 15.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 510.0,
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
                            child: AuthUserStreamWidget(
                              builder: (context) => Builder(
                                builder: (context) {
                                  final connecionList = (currentUserDocument
                                              ?.connexionList
                                              .toList() ??
                                          [])
                                      .toList();
                                  if (connecionList.isEmpty) {
                                    return NoConnexionWidgetWidget();
                                  }

                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                              connecionList.length,
                                              (connecionListIndex) {
                                        final connecionListItem =
                                            connecionList[connecionListIndex];
                                        return SmallProfilCardWidget(
                                          key: Key(
                                              'Keygc3_${connecionListIndex}_of_${connecionList.length}'),
                                          userRef: connecionListItem,
                                        );
                                      })
                                          .divide(SizedBox(height: 5.0))
                                          .addToStart(SizedBox(height: 8.0)),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      0.0,
                      0.0,
                      valueOrDefault<double>(
                        isAndroid ? 50.0 : 20.0,
                        0.0,
                      )),
                  child: wrapWithModel(
                    model: _model.navBarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: NavBarWidget(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
