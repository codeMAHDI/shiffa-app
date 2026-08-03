import 'package:get/get.dart';
import '../../features/splash/bindings/splash_binding.dart';
import '../../features/splash/views/splash_screen.dart';
import '../../features/onboarding/bindings/onboarding_binding.dart';
import '../../features/onboarding/views/language_selection_screen.dart';
import '../../features/onboarding/views/intro_screen.dart';
import '../../features/onboarding/views/role_selection_screen.dart';
import '../../features/auth/bindings/auth_binding.dart';
import '../../features/auth/views/auth_screen.dart';
import '../../features/auth/views/forgot_password_screen.dart';
import '../../features/auth/views/verify_otp_screen.dart';
import '../../features/auth/views/set_new_password_screen.dart';
import '../../features/auth/views/account_ready_screen.dart';
import '../../features/client_dashboard/bindings/client_dashboard_binding.dart';
import '../../features/client_dashboard/views/client_dashboard_screen.dart';
import '../../features/chat/bindings/chat_binding.dart';
import '../../features/chat/views/chat_detail_screen.dart';
import '../../features/search/views/search_screen.dart';
import '../../features/search/views/advanced_filters_screen.dart';
import '../../features/booking/views/select_appointment_screen.dart';
import '../../features/booking/views/booking_summary_screen.dart';
import '../../features/booking/views/secure_payment_screen.dart';
import '../../features/booking/views/booking_confirmed_screen.dart';
import '../../features/booking/views/booking_details_screen.dart';
import '../../features/quran_hadith/views/quran_hadith_screen.dart';
import '../../features/quran_hadith/views/surah_detail_screen.dart';
import '../../features/profile/views/edit_profile_screen.dart';
import '../../features/profile/views/account_settings_screen.dart';
import '../../features/profile/views/change_password_screen.dart';
import '../../features/practitioner_flow/views/practitioner_profile_setup_screen.dart';
import '../../features/practitioner_flow/views/practitioner_dashboard_screen.dart';
import '../../features/practitioner_flow/views/todays_schedule_screen.dart';
import '../../features/practitioner_flow/views/pending_requests_screen.dart';
import '../../features/profile/views/terms_conditions_screen.dart';
import '../../features/profile/views/privacy_policy_screen.dart';
import '../../features/profile/views/about_us_screen.dart';

class AppRoutes {
  /// ==================== INITIAL & AUTH ROUTES ====================
  static const String splashScreen = "/splash_screen";
  static const String languageSelectionScreen = "/language_selection_screen";
  static const String introScreen = "/intro_screen";
  static const String roleSelectionScreen = "/role_selection_screen";
  static const String authScreen = "/auth_screen";
  static const String forgotPasswordScreen = "/forgot_password_screen";
  static const String verifyOtpScreen = "/verify_otp_screen";
  static const String setNewPasswordScreen = "/set_new_password_screen";
  static const String accountReadyScreen = "/account_ready_screen";

  /// ==================== DASHBOARD ROUTES ====================
  static const String clientDashboard = "/client_dashboard";

  /// ==================== SHARED ROUTES (Profile & Chat) ====================
  static const String chatDetail = "/chat_detail";
  static const String searchPractitioners = "/search_practitioners";
  static const String advancedFilters = "/advanced_filters";
  static const String selectAppointment = "/select_appointment";
  static const String bookingSummary = "/booking_summary";
  static const String securePayment = "/secure_payment";
  static const String bookingConfirmed = "/booking_confirmed";
  static const String bookingDetails = "/booking_details";
  static const String quranHadith = "/quran_hadith";
  static const String surahDetail = "/surah_detail";
  
  static const String editProfile = "/edit_profile";
  static const String accountSettings = "/account_settings";
  static const String changePassword = "/change_password";

  static const String practitionerSetup = "/practitioner_setup";
  static const String practitionerDashboard = "/practitioner_dashboard";
  static const String todaysSchedule = "/todays_schedule";
  static const String pendingRequests = "/pending_requests";
  static const String termsAndConditions = "/terms_and_conditions";
  static const String privacyPolicy = "/privacy_policy";
  static const String aboutUs = "/about_us";

  static List<GetPage> routes = [
    /// ==================== INITIAL & AUTH PAGES ====================
    GetPage(name: splashScreen, page: () => const SplashScreen(), binding: SplashBinding()),
    GetPage(name: languageSelectionScreen, page: () => const LanguageSelectionScreen(), binding: OnboardingBinding()),
    GetPage(name: introScreen, page: () => const IntroScreen(), binding: OnboardingBinding()),
    GetPage(name: roleSelectionScreen, page: () => const RoleSelectionScreen(), binding: OnboardingBinding()),
    GetPage(name: authScreen, page: () => const AuthScreen(), binding: AuthBinding()),
    GetPage(name: forgotPasswordScreen, page: () => const ForgotPasswordScreen(), binding: AuthBinding()),
    GetPage(name: verifyOtpScreen, page: () => const VerifyOtpScreen(), binding: AuthBinding()),
    GetPage(name: setNewPasswordScreen, page: () => const SetNewPasswordScreen(), binding: AuthBinding()),
    GetPage(name: accountReadyScreen, page: () => const AccountReadyScreen()),

    /// ==================== DASHBOARD PAGES ====================
    GetPage(name: clientDashboard, page: () => const ClientDashboardScreen(), binding: ClientDashboardBinding()),

    /// ==================== SHARED PAGES (Profile & Chat) ====================
    GetPage(name: chatDetail, page: () => const ChatDetailScreen(), binding: ChatBinding()),
    GetPage(name: searchPractitioners, page: () => const SearchScreen()),
    GetPage(name: advancedFilters, page: () => const AdvancedFiltersScreen()),
    GetPage(name: selectAppointment, page: () => const SelectAppointmentScreen()),
    GetPage(name: bookingSummary, page: () => const BookingSummaryScreen()),
    GetPage(name: securePayment, page: () => const SecurePaymentScreen()),
    GetPage(name: bookingConfirmed, page: () => const BookingConfirmedScreen()),
    GetPage(name: bookingDetails, page: () => const BookingDetailsScreen()),
    GetPage(name: quranHadith, page: () => const QuranHadithScreen()),
    GetPage(name: surahDetail, page: () => const SurahDetailScreen()),
    GetPage(name: editProfile, page: () => const EditProfileScreen()),
    GetPage(name: accountSettings, page: () => const AccountSettingsScreen()),
    GetPage(name: changePassword, page: () => const ChangePasswordScreen()),
    GetPage(name: practitionerSetup, page: () => const PractitionerProfileSetupScreen()),
    GetPage(name: practitionerDashboard, page: () => const PractitionerDashboardScreen()),
    GetPage(name: todaysSchedule, page: () => const TodaysScheduleScreen()),
    GetPage(name: pendingRequests, page: () => const PendingRequestsScreen()),
    GetPage(name: privacyPolicy, page: () => const PrivacyPolicyScreen()),
    GetPage(name: aboutUs, page: () => const AboutUsScreen()),
  ];
}
