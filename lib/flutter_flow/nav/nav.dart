import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? PageEntreeCopyWidget()
          : PageEntreeWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? PageEntreeCopyWidget()
              : PageEntreeWidget(),
        ),
        FFRoute(
          name: ProfileCompletWidget.routeName,
          path: ProfileCompletWidget.routePath,
          builder: (context, params) => ProfileCompletWidget(
            userRef: params.getParam(
              'userRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: ConversationsEmptyWidget.routeName,
          path: ConversationsEmptyWidget.routePath,
          builder: (context, params) => ConversationsEmptyWidget(),
        ),
        FFRoute(
          name: ChatListeAmi2Widget.routeName,
          path: ChatListeAmi2Widget.routePath,
          builder: (context, params) => ChatListeAmi2Widget(),
        ),
        FFRoute(
          name: HomeWidget.routeName,
          path: HomeWidget.routePath,
          builder: (context, params) => HomeWidget(),
        ),
        FFRoute(
          name: AccueilArcaneSec2Widget.routeName,
          path: AccueilArcaneSec2Widget.routePath,
          builder: (context, params) => AccueilArcaneSec2Widget(),
        ),
        FFRoute(
          name: ChatConversationWidget.routeName,
          path: ChatConversationWidget.routePath,
          builder: (context, params) => ChatConversationWidget(
            chatRef: params.getParam(
              'chatRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Chat'],
            ),
          ),
        ),
        FFRoute(
          name: Loading01Widget.routeName,
          path: Loading01Widget.routePath,
          builder: (context, params) => Loading01Widget(),
        ),
        FFRoute(
          name: Loading03Widget.routeName,
          path: Loading03Widget.routePath,
          builder: (context, params) => Loading03Widget(),
        ),
        FFRoute(
          name: Loading02Widget.routeName,
          path: Loading02Widget.routePath,
          builder: (context, params) => Loading02Widget(),
        ),
        FFRoute(
          name: Creervotreprofil01Widget.routeName,
          path: Creervotreprofil01Widget.routePath,
          builder: (context, params) => Creervotreprofil01Widget(),
        ),
        FFRoute(
          name: CreervotreprofilPhotoschoisis02Widget.routeName,
          path: CreervotreprofilPhotoschoisis02Widget.routePath,
          builder: (context, params) => CreervotreprofilPhotoschoisis02Widget(),
        ),
        FFRoute(
          name: PageEntreeWidget.routeName,
          path: PageEntreeWidget.routePath,
          builder: (context, params) => PageEntreeWidget(),
        ),
        FFRoute(
          name: AccueilArcane5Widget.routeName,
          path: AccueilArcane5Widget.routePath,
          requireAuth: true,
          builder: (context, params) => AccueilArcane5Widget(),
        ),
        FFRoute(
          name: AccueilArcane6Widget.routeName,
          path: AccueilArcane6Widget.routePath,
          requireAuth: true,
          builder: (context, params) => AccueilArcane6Widget(),
        ),
        FFRoute(
          name: AccueilArcane4Widget.routeName,
          path: AccueilArcane4Widget.routePath,
          builder: (context, params) => AccueilArcane4Widget(),
        ),
        FFRoute(
          name: Connexion032Widget.routeName,
          path: Connexion032Widget.routePath,
          builder: (context, params) => Connexion032Widget(),
        ),
        FFRoute(
          name: CreervotreprofilPersonnalit03Widget.routeName,
          path: CreervotreprofilPersonnalit03Widget.routePath,
          builder: (context, params) => CreervotreprofilPersonnalit03Widget(),
        ),
        FFRoute(
          name: CreervotreprofilPersonnalit02Widget.routeName,
          path: CreervotreprofilPersonnalit02Widget.routePath,
          builder: (context, params) => CreervotreprofilPersonnalit02Widget(),
        ),
        FFRoute(
          name: AccueilArcane2Widget.routeName,
          path: AccueilArcane2Widget.routePath,
          builder: (context, params) => AccueilArcane2Widget(),
        ),
        FFRoute(
          name: VotreProfil2Widget.routeName,
          path: VotreProfil2Widget.routePath,
          builder: (context, params) => VotreProfil2Widget(),
        ),
        FFRoute(
          name: LimitedematchWidget.routeName,
          path: LimitedematchWidget.routePath,
          builder: (context, params) => LimitedematchWidget(),
        ),
        FFRoute(
          name: Background2Widget.routeName,
          path: Background2Widget.routePath,
          builder: (context, params) => Background2Widget(),
        ),
        FFRoute(
          name: Background1Widget.routeName,
          path: Background1Widget.routePath,
          builder: (context, params) => Background1Widget(),
        ),
        FFRoute(
          name: Background3Widget.routeName,
          path: Background3Widget.routePath,
          builder: (context, params) => Background3Widget(),
        ),
        FFRoute(
          name: Settings2Widget.routeName,
          path: Settings2Widget.routePath,
          builder: (context, params) => Settings2Widget(),
        ),
        FFRoute(
          name: BienvenueWidget.routeName,
          path: BienvenueWidget.routePath,
          builder: (context, params) => BienvenueWidget(),
        ),
        FFRoute(
          name: CreerCompteWidget.routeName,
          path: CreerCompteWidget.routePath,
          builder: (context, params) => CreerCompteWidget(),
        ),
        FFRoute(
          name: SeConnecterWidget.routeName,
          path: SeConnecterWidget.routePath,
          builder: (context, params) => SeConnecterWidget(),
        ),
        FFRoute(
          name: AccueilArcane2CopyWidget.routeName,
          path: AccueilArcane2CopyWidget.routePath,
          builder: (context, params) => AccueilArcane2CopyWidget(),
        ),
        FFRoute(
          name: PageImageWidget.routeName,
          path: PageImageWidget.routePath,
          builder: (context, params) => PageImageWidget(),
        ),
        FFRoute(
          name: Explore02CopyWidget.routeName,
          path: Explore02CopyWidget.routePath,
          builder: (context, params) => Explore02CopyWidget(),
        ),
        FFRoute(
          name: PageEntreeCopyWidget.routeName,
          path: PageEntreeCopyWidget.routePath,
          builder: (context, params) => PageEntreeCopyWidget(),
        ),
        FFRoute(
          name: TutorielWidget.routeName,
          path: TutorielWidget.routePath,
          builder: (context, params) => TutorielWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/pageEntree';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? isWeb
                  ? Container()
                  : Container(
                      color: FlutterFlowTheme.of(context).tertiary,
                      child: Image.asset(
                        'assets/images/Lavender_tarot_card_logo_design-2.png',
                        fit: BoxFit.contain,
                      ),
                    )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(
                  key: state.pageKey, name: state.name, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
