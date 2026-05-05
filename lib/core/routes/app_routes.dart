class AppRoutes {
  /// Initial
  static const String introLogin = '/intro_login';
  static const String onboarding = '/onboarding';

  /// Auth
  static const String login = '/login';
  static const String signup = '/signup';
  static const String loginOrSignup = '/loginOrSignup';
  static const String numberVerification = '/numberVerification';
  static const String forgotPassword = '/forgotPassword';
  static const String passwordReset = '/passwordReset';

  /// Entrypoint (Main Wrapper)
  static const String entryPoint = '/entryPoint';

  /// Home & Products
  static const String home = '/home';
  static const String newItems = '/newItems';
  static const String popularItems = '/popularItems';
  static const String bundleProduct = '/bundleProduct';
  static const String bundleDetailsPage = '/bundleDetailsPage';
  static const String createMyPack = '/createMyPack';
  static const String productDetails = '/productDetails';

  /// Cart & Checkout
  static const String cartPage = '/cartPage';
  static const String savePage = '/favouriteList'; // BIAR GAK ERROR
  static const String checkoutPage = '/checkoutPage';

  /// Order
  static const String orderSuccessfull = '/orderSuccessfull';
  static const String orderFailed = '/orderFailed';
  static const String noOrderYet = '/noOrderYet';

  /// Category
  static const String category = '/category';
  static const String categoryDetails = '/categoryDetails';

  /// Search
  static const String search = '/search';
  static const String searchResult = '/searchResult';

  /// Profile
  static const String profile = '/profile';
  static const String myOrder = '/myOrder';
  static const String orderDetails = '/orderDetails';
  static const String coupon = '/coupon';
  static const String couponDetails = '/couponDetails';
  static const String deliveryAddress = '/deliveryAddress';
  static const String newAddress = '/newAddress';
  static const String orderTracking = '/orderTracking';
  static const String profileEdit = '/profileEdit';

  /// Settings
  static const String notifications = '/notifications';
  static const String settings = '/settings';
  static const String settingsLanguage = '/settingsLanguage';
  static const String settingsNotifications = '/settingsNotifications';
  static const String changePassword = '/changePassword';
  static const String changePhoneNumber = '/changePhoneNumber';

  /// Review
  static const String review = '/review';
  static const String submitReview = '/submitReview';

  /// Drawer / Info
  static const String drawerPage = '/drawerPage';
  static const String aboutUs = '/aboutUs';
  static const String faq = '/faq';
  static const String termsAndConditions = '/termsAndConditions';
  static const String help = '/help';
  static const String contactUs = '/contactUs';

  /// ✅ PAYMENT (INI YANG PENTING)
  static const String paymentMethod = '/paymentMethod';
  static const String addNewCard = '/addNewCard'; // TAMBAHAN
}
