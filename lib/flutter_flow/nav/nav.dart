import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

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
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : CreateAccountWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : CreateAccountWidget(),
        ),
        FFRoute(
          name: 'CreateAccount',
          path: '/createAccount',
          builder: (context, params) => CreateAccountWidget(),
        ),
        FFRoute(
          name: 'ProfilePage',
          path: '/profilePage',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'ProfilePage')
              : ProfilePageWidget(),
        ),
        FFRoute(
          name: 'SignIn',
          path: '/signIn',
          builder: (context, params) => SignInWidget(),
        ),
        FFRoute(
          name: 'ChooseLang',
          path: '/chooseLang',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'ChooseLang')
              : ChooseLangWidget(),
        ),
        FFRoute(
          name: 'AssameseLevels',
          path: '/assameseLevels',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: AssameseLevelsWidget(),
          ),
        ),
        FFRoute(
          name: 'AssameseLevel1',
          path: '/assameseLevel1',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: AssameseLevel1Widget(),
          ),
        ),
        FFRoute(
          name: 'AssameseLevel2',
          path: '/assameseLevel2',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: AssameseLevel2Widget(),
          ),
        ),
        FFRoute(
          name: 'AssameseLevel3',
          path: '/assameseLevel3',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: AssameseLevel3Widget(),
          ),
        ),
        FFRoute(
          name: 'AssameseLevel4',
          path: '/assameseLevel4',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: AssameseLevel4Widget(),
          ),
        ),
        FFRoute(
          name: 'AssameseLevel5',
          path: '/assameseLevel5',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: AssameseLevel5Widget(),
          ),
        ),
        FFRoute(
          name: 'AssameseLetter2',
          path: '/assameseLetter2',
          builder: (context, params) => AssameseLetter2Widget(),
        ),
        FFRoute(
          name: 'AssameseLetter3',
          path: '/assameseLetter3',
          builder: (context, params) => AssameseLetter3Widget(),
        ),
        FFRoute(
          name: 'AssameseLetter1',
          path: '/assameseLetter1',
          builder: (context, params) => AssameseLetter1Widget(),
        ),
        FFRoute(
          name: 'Vowels',
          path: '/vowels',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: VowelsWidget(),
          ),
        ),
        FFRoute(
          name: 'AConsonant1',
          path: '/aConsonant1',
          builder: (context, params) => AConsonant1Widget(),
        ),
        FFRoute(
          name: 'Consonants',
          path: '/consonants',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: ConsonantsWidget(),
          ),
        ),
        FFRoute(
          name: 'AConsonant2',
          path: '/aConsonant2',
          builder: (context, params) => AConsonant2Widget(),
        ),
        FFRoute(
          name: 'AL2Q1',
          path: '/al2q1',
          builder: (context, params) => Al2q1Widget(),
        ),
        FFRoute(
          name: 'AL2Q2',
          path: '/al2q2',
          builder: (context, params) => Al2q2Widget(),
        ),
        FFRoute(
          name: 'AL2Q3',
          path: '/al2q3',
          builder: (context, params) => Al2q3Widget(),
        ),
        FFRoute(
          name: 'AL3Q1',
          path: '/al3q1',
          builder: (context, params) => Al3q1Widget(),
        ),
        FFRoute(
          name: 'AL3Q2',
          path: '/al3q2',
          builder: (context, params) => Al3q2Widget(),
        ),
        FFRoute(
          name: 'AL3Q3',
          path: '/al3q3',
          builder: (context, params) => Al3q3Widget(),
        ),
        FFRoute(
          name: 'AL4Q1',
          path: '/al4q1',
          builder: (context, params) => Al4q1Widget(),
        ),
        FFRoute(
          name: 'AL4Q2',
          path: '/al4q2',
          builder: (context, params) => Al4q2Widget(),
        ),
        FFRoute(
          name: 'AL4Q3',
          path: '/al4q3',
          builder: (context, params) => Al4q3Widget(),
        ),
        FFRoute(
          name: 'AL5Q1',
          path: '/al5q1',
          builder: (context, params) => Al5q1Widget(),
        ),
        FFRoute(
          name: 'AL5Q2',
          path: '/al5q2',
          builder: (context, params) => Al5q2Widget(),
        ),
        FFRoute(
          name: 'BLevels',
          path: '/bLevels',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: BLevelsWidget(),
          ),
        ),
        FFRoute(
          name: 'BLevel1',
          path: '/bLevel1',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: BLevel1Widget(),
          ),
        ),
        FFRoute(
          name: 'BLevel2',
          path: '/bLevel2',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: BLevel2Widget(),
          ),
        ),
        FFRoute(
          name: 'BLevel3',
          path: '/bLevel3',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: BLevel3Widget(),
          ),
        ),
        FFRoute(
          name: 'ALevel1Rules',
          path: '/aLevel1Rules',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: ALevel1RulesWidget(),
          ),
        ),
        FFRoute(
          name: 'AL2Rules',
          path: '/aL2Rules',
          builder: (context, params) => AL2RulesWidget(),
        ),
        FFRoute(
          name: 'AL3Rules',
          path: '/aL3Rules',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: AL3RulesWidget(),
          ),
        ),
        FFRoute(
          name: 'AL4Rules',
          path: '/aL4Rules',
          builder: (context, params) => AL4RulesWidget(),
        ),
        FFRoute(
          name: 'BL1Q1',
          path: '/bl1q1',
          builder: (context, params) => Bl1q1Widget(),
        ),
        FFRoute(
          name: 'BL2Q2',
          path: '/bl2q2',
          builder: (context, params) => Bl2q2Widget(),
        ),
        FFRoute(
          name: 'BL2Q1',
          path: '/bl2q1',
          builder: (context, params) => Bl2q1Widget(),
        ),
        FFRoute(
          name: 'BL1Q2',
          path: '/bl1q2',
          builder: (context, params) => Bl1q2Widget(),
        ),
        FFRoute(
          name: 'BL3Q1',
          path: '/bl3q1',
          builder: (context, params) => Bl3q1Widget(),
        ),
        FFRoute(
          name: 'BL3Q2',
          path: '/bl3q2',
          builder: (context, params) => Bl3q2Widget(),
        ),
        FFRoute(
          name: 'BGLevels',
          path: '/bGLevels',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: BGLevelsWidget(),
          ),
        ),
        FFRoute(
          name: 'BL1Rules',
          path: '/bL1Rules',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: BL1RulesWidget(),
          ),
        ),
        FFRoute(
          name: 'BGL1Q1',
          path: '/bgl1q1',
          builder: (context, params) => Bgl1q1Widget(),
        ),
        FFRoute(
          name: 'BGL1Q2',
          path: '/bgl1q2',
          builder: (context, params) => Bgl1q2Widget(),
        ),
        FFRoute(
          name: 'BGL2Q1',
          path: '/bgl2q1',
          builder: (context, params) => Bgl2q1Widget(),
        ),
        FFRoute(
          name: 'BGL2Q2',
          path: '/bgl2q2',
          builder: (context, params) => Bgl2q2Widget(),
        ),
        FFRoute(
          name: 'BGL3Q1',
          path: '/bgl3q1',
          builder: (context, params) => Bgl3q1Widget(),
        ),
        FFRoute(
          name: 'BGL3Q2',
          path: '/bgl3q2',
          builder: (context, params) => Bgl3q2Widget(),
        ),
        FFRoute(
          name: 'BL2Rules',
          path: '/bL2Rules',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: BL2RulesWidget(),
          ),
        ),
        FFRoute(
          name: 'BL3Rules',
          path: '/bL3Rules',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: BL3RulesWidget(),
          ),
        ),
        FFRoute(
          name: 'BGL1Rules',
          path: '/bGL1Rules',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: BGL1RulesWidget(),
          ),
        ),
        FFRoute(
          name: 'BGL1',
          path: '/bgl1',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: Bgl1Widget(),
          ),
        ),
        FFRoute(
          name: 'BGL2',
          path: '/bgl2',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: Bgl2Widget(),
          ),
        ),
        FFRoute(
          name: 'BGL2Rules',
          path: '/bGL2Rules',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: BGL2RulesWidget(),
          ),
        ),
        FFRoute(
          name: 'BGL3',
          path: '/bgl3',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: Bgl3Widget(),
          ),
        ),
        FFRoute(
          name: 'BGL3Rules',
          path: '/bGL3Rules',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: BGL3RulesWidget(),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
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
    ..addAll(queryParameters)
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
      (state.extraMap.length == 1 &&
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
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
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
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
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
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/createAccount';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
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
              : MaterialPage(key: state.pageKey, child: child);
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
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
