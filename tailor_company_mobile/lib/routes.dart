import 'package:tailor_company_mobile/constants/route_constants.dart';
import 'package:tailor_company_mobile/screens/dashboard_screen.dart';
import 'package:tailor_company_mobile/screens/orders_summary_screen.dart';
import 'package:tailor_company_mobile/screens/otp_screen.dart';
import 'package:tailor_company_mobile/screens/otp_verified_screen.dart';
import 'package:tailor_company_mobile/screens/register_screen.dart';
import 'package:tailor_company_mobile/screens/splash_screen.dart';
import 'package:tailor_company_mobile/screens/sign_in_screen.dart';
import 'package:tailor_company_mobile/screens/welcome_screen.dart';

Map routes = {
  RouteConstants.splashScreen: (context) => const SplashScreen(),
  RouteConstants.signInScreen: (context) => const SignInScreen(),
  RouteConstants.welcomeScreen: (context) => const WelcomeScreen(),
  RouteConstants.registerScreen: (context) => const RegisterScreen(),
  RouteConstants.otpScreen: (context) => const OTPScreen(),
  RouteConstants.otpVerfiedScreen: (context) => const OTPVerifiedScreen(),
  RouteConstants.dashboardScreen: (context) => const DashboardScreen(),
  RouteConstants.ordersSummary: (context) => const OredrsSummaryScreen(),
};
