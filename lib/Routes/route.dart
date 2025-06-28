import 'package:get/get.dart';
import 'package:ggram_online/Routes/route_name.dart';
import 'package:ggram_online/Screen/Auth/auth_binding/introduction_binding.dart';
import 'package:ggram_online/Screen/Auth/auth_binding/otp_binding.dart';
import 'package:ggram_online/Screen/Auth/auth_binding/survey_binding.dart';
import 'package:ggram_online/Screen/BottomNavBar/bottom_nav_bar_binding.dart';
import 'package:ggram_online/Screen/home/home_binding/home_binding.dart';
import 'package:ggram_online/Screen/home/home_binding/report_road_binding.dart';
import 'package:ggram_online/Screen/info/info_binding/info_page_binding.dart';
import 'package:ggram_online/Screen/info/info_binding/official_detail_binding.dart';
import '../Screen/Auth/auth_binding/login_binding.dart';
import '../Screen/Auth/auth_binding/support_binding.dart';
import '../Screen/Auth/auth_screen/Introduction_screen.dart';
import '../Screen/Auth/auth_screen/login_screen.dart';
import '../Screen/Auth/auth_screen/otp_screen.dart';
import '../Screen/Auth/auth_screen/support_screen.dart';
import '../Screen/Auth/auth_screen/survey_screen.dart';
import '../Screen/BottomNavBar/bottom_nav_bar.dart';
import '../Screen/Splesh/splash_binding.dart';
import '../Screen/Splesh/splesh_screen.dart';
import '../Screen/home/home_binding/upload_image_binding.dart';
import '../Screen/home/home_module/home_screen.dart';
import '../Screen/home/home_module/report_road_screen.dart';
import '../Screen/home/home_module/upload_image_screen.dart';
import '../Screen/info/info_page_screen.dart';
import '../Screen/info/official_detail_screen.dart';

class AppRoute {
  static routes() => [
        GetPage(
            name: RouteName.splashScreen,
            page: () => const SplashScreen(),
            transition: Transition.rightToLeft,
            binding: SplashBinding()
        ),
        GetPage(
            name: RouteName.loginScreen,
            page: () => const LoginScreen(),
            binding: LoginBinding()
        ),
        GetPage(
            name: RouteName.otpScreen,
            page: () => const OtpScreen(),
            binding: OtpBinding()
        ),
        GetPage(
            name: RouteName.introductionScreen,
            page: () => const IntroductionScreen(),
            binding: IntroductionBinding()
        ),
        GetPage(
            name: RouteName.surveyScreen,
            page: () => const SurveyScreen(),
            binding: SurveyBinding()
        ),
        GetPage(
            name: RouteName.supportScreen,
            page: () => const SupportScreen(),
            binding: SupportBinding()
        ),
        GetPage(
            name: RouteName.bottomNavBar,
            page: () => const BottomNavBar(),
            binding: BottomNavBarBinding()
        ),
        GetPage(
            name: RouteName.homeScreen,
            page: () => const HomeScreen(),
            binding: HomeBinding()
        ),
        GetPage(
            name: RouteName.reportRoadScreen,
            page: () => ReportRoadScreen(),
            binding: ReportRoadBinding()
        ),
        GetPage(
            name: RouteName.uploadImageScreen,
            page: () => const UploadImageScreen(),
            binding: UploadImageBinding()
        ),
        GetPage(
            name: RouteName.infoPageScreen,
            page: () => InfoPageScreen(),
            binding: InfoPageBinding()
        ),
        GetPage(
            name: RouteName.officialDetailScreen,
            page: () => const OfficialDetailScreen(),
            binding: OfficialDetailBining()
        ),
      ];
}
