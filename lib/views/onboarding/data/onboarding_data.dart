import '../../../core/constants/app_images.dart';
import 'onboarding_model.dart';

class OnboardingData {
  static List<OnboardingModel> items = [
    OnboardingModel(
      imageUrl: AppImages.onboarding1,
      headline: '🛒 Fresh Groceries, Anytime',
      description:
          'Semua kebutuhan harian bisa kamu pesan dengan cepat, langsung dari rumah tanpa ribet.',
    ),
    OnboardingModel(
      imageUrl: AppImages.onboarding2,
      headline: '⚡ Fast, Easy, Delivered',
      description:
          'Tinggal order, dan belanjaan kamu langsung diproses dan diantar ke depan pintu.',
    ),
    OnboardingModel(
      imageUrl: AppImages.onboarding3,
      headline: '💸 Save More Every Day',
      description:
          'Nikmati berbagai promo dan harga terbaik biar belanja tetap nyaman di kantong.',
    ),
  ];
}
