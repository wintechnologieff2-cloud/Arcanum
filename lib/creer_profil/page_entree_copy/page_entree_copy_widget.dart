import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'page_entree_copy_model.dart';
export 'page_entree_copy_model.dart';

class PageEntreeCopyWidget extends StatefulWidget {
  const PageEntreeCopyWidget({super.key});

  static String routeName = 'PageEntreeCopy';
  static String routePath = '/pageEntreeCopy';

  @override
  State<PageEntreeCopyWidget> createState() => _PageEntreeCopyWidgetState();
}

class _PageEntreeCopyWidgetState extends State<PageEntreeCopyWidget> {
  late PageEntreeCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageEntreeCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(
        Duration(
          milliseconds: 3000,
        ),
      );
      if (valueOrDefault(currentUserDocument?.profilStage, 0) == 1) {
        context.goNamed(Creervotreprofil01Widget.routeName);
      } else if (valueOrDefault(currentUserDocument?.profilStage, 0) == 2) {
        context.goNamed(CreervotreprofilPersonnalit02Widget.routeName);
      } else if (valueOrDefault(currentUserDocument?.profilStage, 0) == 3) {
        context.goNamed(
          CreervotreprofilPersonnalit03Widget.routeName,
          extra: <String, dynamic>{
            '__transition_info__': TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
      } else if (valueOrDefault(currentUserDocument?.profilStage, 0) == 4) {
        context.goNamed(CreervotreprofilPhotoschoisis02Widget.routeName);
      } else if (valueOrDefault(currentUserDocument?.profilStage, 0) == 5) {
        context.goNamed(AccueilArcane2CopyWidget.routeName);
      } else {
        context.goNamed(HomeWidget.routeName);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/arcanum-7wx74m/assets/1a99yswb8t7u/Lavender_tarot_card_logo_design-2.png',
                    width: 210.0,
                    height: 150.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    'l0jcbpja' /* Propulsé par  */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.spectral(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
                FlutterFlowVideoPlayer(
                  path: 'assets/videos/logo.webm',
                  videoType: VideoType.asset,
                  width: 100.0,
                  height: 50.0,
                  autoPlay: true,
                  looping: true,
                  showControls: false,
                  allowFullScreen: false,
                  allowPlaybackSpeedMenu: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
