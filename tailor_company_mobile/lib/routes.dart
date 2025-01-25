import 'package:flutter/material.dart';
import 'package:tailor_company_mobile/constants/route_constants.dart';
import 'package:tailor_company_mobile/screens/dashboard_screen.dart';
import 'package:tailor_company_mobile/screens/order_request_screen.dart';
import 'package:tailor_company_mobile/screens/order_status_screen.dart';
import 'package:tailor_company_mobile/screens/order_track_screen.dart';
import 'package:tailor_company_mobile/screens/orders_summary_screen.dart';
import 'package:tailor_company_mobile/screens/otp_screen.dart';
import 'package:tailor_company_mobile/screens/otp_verified_screen.dart';
import 'package:tailor_company_mobile/screens/post_order_request_screen.dart';
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
  RouteConstants.ordersSummaryScreen: (context) => const OredrsSummaryScreen(),
  RouteConstants.orderRequestScreen: (context) => const OrderRequestScreen(),
  RouteConstants.orderStatusScreen: (context) => OrderStatusScreen(
        orderStatus:
            (ModalRoute.of(context)?.settings.arguments as OrderStatus),
      ),
  RouteConstants.postOrderRequestScreen: (context) => PostOrderRequestScreen(
      orderStatus:
          (ModalRoute.of(context)?.settings.arguments as OrderStatus?)),
  RouteConstants.orderTrackScreen: (context) => const OrderTrackScreen(),
};
