import 'package:go_router/go_router.dart';
import 'package:pill_box/views/auth/forgot_password_screen.dart';
import 'package:pill_box/views/auth/otp_screen.dart';
import 'package:pill_box/views/auth/select_login_screen.dart';
import 'package:pill_box/views/auth/signup_screen.dart';
import 'package:pill_box/views/dashboard/dashboard_screen.dart';
import 'package:pill_box/views/dashboard/health/pregnancay/pregnancy_screen.dart';
import 'package:pill_box/views/dashboard/health/period/period_screen.dart';

import '../helper/route_constant.dart';
import '../views/auth/login_screen.dart';
import '../views/dashboard/health/heart/beat_measure_screen.dart';
import '../views/dashboard/health/heart/heart_graph_screen.dart';
import '../views/dashboard/health/heart/heart_rate_screen.dart';
import '../views/splash_screen.dart';

class AppRouter {
  static GoRouter router = GoRouter(routes: [
    GoRoute(
        path: "/",
        name: RouteConstant.splashScreen,
        builder: (context, state) {
          return SplashScreen();
        }),
    GoRoute(
        path: "/selectLogin",
        name: RouteConstant.selectLoginScreen,
        builder: (context, state) {
          return SelectLoginScreen();
        }),
    GoRoute(
        path: "/login",
        name: RouteConstant.loginScreen,
        builder: (context, state) {
          return LoginScreen();
        }),
    GoRoute(
        path: "/forgot",
        name: RouteConstant.forgotPasswordScreen,
        builder: (context, state) {
          return ForgotPasswordScreen();
        }),
    GoRoute(
        path: "/signup",
        name: RouteConstant.signUpScreen,
        builder: (context, state) {
          return SignUpScreen();
        }),
    GoRoute(
        path: "/otp",
        name: RouteConstant.otpScreen,
        builder: (context, state) {
          return OtpScreen(email: state.extra as String);
        }),
    GoRoute(
        path: "/dashboard",
        name: RouteConstant.dashBoardScreen,
        builder: (context, state) {
          return DashboardScreen();
        }),
    GoRoute(
        path: "/heartRate",
        name: RouteConstant.heartRateScreen,
        builder: (context, state) {
          return HeartRateScreen();
        }),
    GoRoute(
        path: "/heartGraph",
        name: RouteConstant.heartGraphScreen,
        builder: (context, state) {
          return HeartGraphScreen();
        }),
    GoRoute(
        path: "/beatMeasure",
        name: RouteConstant.beatMeasureScreen,
        builder: (context, state) {
          return BeatMeasureScreen();
        }),
    GoRoute(
        path: "/period",
        name: RouteConstant.periodScreen,
        builder: (context, state) {
          return PeriodScreen();
        }),
    GoRoute(
        path: "/pregnancy",
        name: RouteConstant.pregnancyScreen,
        builder: (context, state) {
          return PregnancyScreen();
        }),
  ]);
}
