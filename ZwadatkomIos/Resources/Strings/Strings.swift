// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// التصنيفات
  internal static let categorySectionTitle = L10n.tr("Localizable", "categorySectionTitle")
  /// envelope
  internal static let emailIconName = L10n.tr("Localizable", "emailIconName")
  /// البريد
  internal static let emailTextFieldHead = L10n.tr("Localizable", "emailTextFieldHead")
  /// نسيت كلمة المرور
  internal static let forgetPasswordButtonTitle = L10n.tr("Localizable", "forgetPasswordButtonTitle")
  /// الاسم
  internal static let fullNameHeadText = L10n.tr("Localizable", "fullNameHeadText")
  /// الإسم
  internal static let fullNameTextFieldHead = L10n.tr("Localizable", "fullNameTextFieldHead")
  /// دخول
  internal static let loginButtonTitle = L10n.tr("Localizable", "loginButtonTitle")
  /// تسجيل خروج
  internal static let logout = L10n.tr("Localizable", "logout")
  /// ناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى  لصفحة ما سيلهي القارئ عن التركيز على الشكل 
  internal static let onboarding1stContent = L10n.tr("Localizable", "onboarding1stContent")
  /// تسوق اونلاين
  internal static let onboarding1stTitle = L10n.tr("Localizable", "onboarding1stTitle")
  /// ناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى  لصفحة ما سيلهي القارئ عن التركيز على الشكل 
  internal static let onboarding2ndContent = L10n.tr("Localizable", "onboarding2ndContent")
  /// افضل المتاجر
  internal static let onboarding2ndTitle = L10n.tr("Localizable", "onboarding2ndTitle")
  /// ناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى  لصفحة ما سيلهي القارئ عن التركيز على الشكل 
  internal static let onboarding3rdContent = L10n.tr("Localizable", "onboarding3rdContent")
  /// خدمة التوصيل
  internal static let onboarding3rdTitle = L10n.tr("Localizable", "onboarding3rdTitle")
  /// طلباتي
  internal static let orders = L10n.tr("Localizable", "orders")
  /// من فضلك ادخل كود التفعيل
  internal static let otpHeadTitle = L10n.tr("Localizable", "otpHeadTitle")
  /// إعادة إرسال
  internal static let otpResendButton = L10n.tr("Localizable", "otpResendButton")
  /// إرسال
  internal static let otpSendButton = L10n.tr("Localizable", "otpSendButton")
  /// كلمة المرور
  internal static let passwordHeadText = L10n.tr("Localizable", "passwordHeadText")
  /// lock
  internal static let passwordIconName = L10n.tr("Localizable", "passwordIconName")
  /// بيانتي الشخصية
  internal static let personalInformation = L10n.tr("Localizable", "personalInformation")
  /// انشأ حساب
  internal static let registerButton = L10n.tr("Localizable", "registerButton")
  /// أهلا بك
  internal static let registerHeadText = L10n.tr("Localizable", "registerHeadText")
  /// مستخدم جديد 
  internal static let registerLabel = L10n.tr("Localizable", "registerLabel")
  /// حفظ
  internal static let saveButton = L10n.tr("Localizable", "saveButton")
  /// الاعدادات
  internal static let settings = L10n.tr("Localizable", "settings")
  /// عرض الكل
  internal static let showAllCategoriesButton = L10n.tr("Localizable", "showAllCategoriesButton")
  /// لتطبيق زودتاكم
  internal static let signInAppName = L10n.tr("Localizable", "signInAppName")
  /// مرحبا بعودتك
  internal static let signInHeadText = L10n.tr("Localizable", "signInHeadText")
  /// تخطي
  internal static let skipAuthButtonTitle = L10n.tr("Localizable", "skipAuthButtonTitle")
  /// او دخول عبر
  internal static let socialHeadTitle = L10n.tr("Localizable", "socialHeadTitle")
  /// البريد او الهاتف
  internal static let usernameHeadText = L10n.tr("Localizable", "usernameHeadText")
  /// person
  internal static let usernameIconName = L10n.tr("Localizable", "usernameIconName")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
