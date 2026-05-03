import 'package:flutter/cupertino.dart';

import '../../views/auth/forget_password_page.dart';
import '../../views/auth/intro_login_page.dart';
import '../../views/auth/login_or_signup_page.dart';
import '../../views/auth/password_reset_page.dart';
import '../../views/cart/cart_page.dart';
import '../../views/cart/checkout_page.dart';
import '../../views/drawer/about_us_page.dart';
import '../../views/drawer/contact_us_page.dart';
import '../../views/drawer/drawer_page.dart';
import '../../views/drawer/faq_page.dart';
import '../../views/drawer/help_page.dart';
import '../../views/drawer/terms_and_conditions_page.dart';
import '../../views/entrypoint/entrypoint_ui.dart';
import '../../views/home/bundle_create_page.dart';
import '../../views/home/bundle_details_page.dart';
import '../../views/home/bundle_product_details_page.dart';
import '../../views/home/order_failed_page.dart';
import '../../views/home/order_successfull_page.dart';
import '../../views/home/product_details_page.dart';
import '../../views/home/search_page.dart';
import '../../views/home/search_result_page.dart';
import '../../views/menu/category_page.dart';
import '../../views/onboarding/onboarding_page.dart';
import '../../views/profile/address/address_page.dart';
import '../../views/profile/address/new_address_page.dart';
import '../../views/profile/coupon/coupon_details_page.dart';
import '../../views/profile/coupon/coupon_page.dart';
import '../../views/profile/notification_page.dart';
import '../../views/profile/order/my_order_page.dart';
import '../../views/profile/order/order_details.dart';
import '../../views/profile/payment_method/add_new_card_page.dart';
import '../../views/profile/payment_method/payment_method_page.dart';
import '../../views/profile/profile_edit_page.dart';
import '../../views/profile/settings/change_password_page.dart';
import '../../views/profile/settings/change_phone_number_page.dart';
import '../../views/profile/settings/language_settings_page.dart';
import '../../views/profile/settings/notifications_settings_page.dart';
import '../../views/profile/settings/settings_page.dart';
import '../../views/review/review_page.dart';
import '../../views/review/submit_review_page.dart';
import '../../views/save/save_page.dart';

import '../../core/models/dummy_product_model.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route? onGenerate(RouteSettings settings) {
    final route = settings.name;

    switch (route) {

      /// 🔐 AUTH
      case AppRoutes.onboarding:
        return CupertinoPageRoute(builder: (_) => const OnboardingPage());

      case AppRoutes.introLogin:
        return CupertinoPageRoute(builder: (_) => const IntroLoginPage());

      case AppRoutes.loginOrSignup:
        return CupertinoPageRoute(builder: (_) => const LoginOrSignUpPage());

      case AppRoutes.forgotPassword:
        return CupertinoPageRoute(builder: (_) => const ForgetPasswordPage());

      case AppRoutes.passwordReset:
        return CupertinoPageRoute(builder: (_) => const PasswordResetPage());

      /// 🏠 MAIN (FIX UTAMA HALAMAN DEPAN)
      case AppRoutes.entryPoint:
      case AppRoutes.home:
        return CupertinoPageRoute(builder: (_) => const EntryPointUI());

      /// 🔍 SEARCH
      case AppRoutes.search:
        return CupertinoPageRoute(builder: (_) => const SearchPage());

      case AppRoutes.searchResult:
        return CupertinoPageRoute(builder: (_) => const SearchResultPage());

      /// 🛒 CART
      case AppRoutes.cartPage:
        return CupertinoPageRoute(builder: (_) => const CartPage());

      case AppRoutes.checkoutPage:
        return CupertinoPageRoute(builder: (_) => const CheckoutPage());

      /// 💾 SAVE
      case AppRoutes.savePage:
        return CupertinoPageRoute(builder: (_) => const SavePage());

      /// 📦 CATEGORY (FIX FINAL)
      case AppRoutes.categoryDetails:
        final category = settings.arguments as String? ?? "Others";

        return CupertinoPageRoute(
          builder: (_) => CategoryProductPage(category: category),
        );

      /// 🛍️ PRODUCT DETAIL (SAFE)
      case AppRoutes.productDetails:
        final product = settings.arguments as ProductModel?;

        return CupertinoPageRoute(
          builder: (_) => ProductDetailsPage(
            product: product ??
                ProductModel(
                  name: "Unknown",
                  weight: "-",
                  cover: "",
                  images: [],
                  price: 0,
                  mainPrice: 0,
                  category: "Others",
                ),
          ),
        );

      /// 📦 BUNDLE
      case AppRoutes.bundleProduct:
        final args = settings.arguments as Map<String, dynamic>? ?? {};

        return CupertinoPageRoute(
          builder: (_) => BundleProductDetailsPage(
            name: args['name'] ?? "Bundle",
            price: args['price'] ?? 0,
            images: List<String>.from(args['images'] ?? []),
          ),
        );

      case AppRoutes.bundleDetailsPage:
        return CupertinoPageRoute(builder: (_) => const BundleDetailsPage());

      case AppRoutes.createMyPack:
        return CupertinoPageRoute(builder: (_) => const BundleCreatePage());

      /// 🛍️ ORDER
      case AppRoutes.orderSuccessfull:
        return CupertinoPageRoute(builder: (_) => const OrderSuccessfullPage());

      case AppRoutes.orderFailed:
        return CupertinoPageRoute(builder: (_) => const OrderFailedPage());

      case AppRoutes.myOrder:
        return CupertinoPageRoute(builder: (_) => const AllOrderPage());

      case AppRoutes.orderDetails:
        return CupertinoPageRoute(builder: (_) => const OrderDetailsPage());

      /// 👤 PROFILE
      case AppRoutes.profileEdit:
        return CupertinoPageRoute(builder: (_) => const ProfileEditPage());

      case AppRoutes.deliveryAddress:
        return CupertinoPageRoute(builder: (_) => const AddressPage());

      case AppRoutes.newAddress:
        return CupertinoPageRoute(builder: (_) => const NewAddressPage());

      case AppRoutes.notifications:
        return CupertinoPageRoute(builder: (_) => const NotificationPage());

      /// ⚙️ SETTINGS
      case AppRoutes.settings:
        return CupertinoPageRoute(builder: (_) => const SettingsPage());

      case AppRoutes.settingsNotifications:
        return CupertinoPageRoute(builder: (_) => const NotificationSettingsPage());

      case AppRoutes.settingsLanguage:
        return CupertinoPageRoute(builder: (_) => const LanguageSettingsPage());

      case AppRoutes.changePassword:
        return CupertinoPageRoute(builder: (_) => const ChangePasswordPage());

      case AppRoutes.changePhoneNumber:
        return CupertinoPageRoute(builder: (_) => const ChangePhoneNumberPage());

      /// 🎟️ COUPON
      case AppRoutes.coupon:
        return CupertinoPageRoute(builder: (_) => const CouponAndOffersPage());

      case AppRoutes.couponDetails:
        return CupertinoPageRoute(builder: (_) => const CouponDetailsPage());

      /// ⭐ REVIEW
      case AppRoutes.review:
        return CupertinoPageRoute(builder: (_) => const ReviewPage());

      case AppRoutes.submitReview:
        return CupertinoPageRoute(builder: (_) => const SubmitReviewPage());

      /// 📚 DRAWER
      case AppRoutes.drawerPage:
        return CupertinoPageRoute(builder: (_) => const DrawerPage());

      case AppRoutes.aboutUs:
        return CupertinoPageRoute(builder: (_) => const AboutUsPage());

      case AppRoutes.termsAndConditions:
        return CupertinoPageRoute(builder: (_) => const TermsAndConditionsPage());

      case AppRoutes.faq:
        return CupertinoPageRoute(builder: (_) => const FAQPage());

      case AppRoutes.help:
        return CupertinoPageRoute(builder: (_) => const HelpPage());

      case AppRoutes.contactUs:
        return CupertinoPageRoute(builder: (_) => const ContactUsPage());

      /// 💳 PAYMENT
      case AppRoutes.paymentMethod:
        return CupertinoPageRoute(builder: (_) => const PaymentMethodPage());

      case AppRoutes.paymentCardAdd:
        return CupertinoPageRoute(builder: (_) => const AddNewCardPage());

      /// ❌ DEFAULT (ANTI BLANK SCREEN FIX)
      default:
        return CupertinoPageRoute(builder: (_) => const EntryPointUI());
    }
  }
}