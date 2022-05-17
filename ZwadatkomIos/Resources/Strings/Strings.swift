// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// الحساب
  internal static let account = L10n.tr("Localizable", "account")
  /// person
  internal static let accountTab = L10n.tr("Localizable", "accountTab")
  /// إضافه الي السلة
  internal static let addToCart = L10n.tr("Localizable", "addToCart")
  /// سلة المشتريات
  internal static let cartControlerTitle = L10n.tr("Localizable", "cartControlerTitle")
  /// envelope
  internal static let emailIconName = L10n.tr("Localizable", "emailIconName")
  /// الرئيسية
  internal static let home = L10n.tr("Localizable", "home")
  /// house
  internal static let homeTab = L10n.tr("Localizable", "homeTab")
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
  /// lock
  internal static let passwordIconName = L10n.tr("Localizable", "passwordIconName")
  /// تسجيل مستخدم جديد
  internal static let register = L10n.tr("Localizable", "register")
  /// الخدمات
  internal static let servicesCategories = L10n.tr("Localizable", "servicesCategories")
  /// gear
  internal static let servicesTab = L10n.tr("Localizable", "servicesTab")
  /// إجمالى سعر طلبك
  internal static let totalPrice = L10n.tr("Localizable", "totalPrice")
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
