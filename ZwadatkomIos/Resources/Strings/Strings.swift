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
  /// البريد الإلكتروني
  internal static let emailAddressPlaceHolder = L10n.tr("Localizable", "emailAddressPlaceHolder")
  /// envelope
  internal static let emailIconName = L10n.tr("Localizable", "emailIconName")
  /// الأسم بالكامل
  internal static let fullNamePlaceHolder = L10n.tr("Localizable", "fullNamePlaceHolder")
  /// الرئيسية
  internal static let home = L10n.tr("Localizable", "home")
  /// house
  internal static let homeTab = L10n.tr("Localizable", "homeTab")
  /// تسجيل الدخول
  internal static let loginButtonTitle = L10n.tr("Localizable", "loginButtonTitle")
  /// مرحباً بك في متجر المملكة
  internal static let loginWelcomeTitle = L10n.tr("Localizable", "loginWelcomeTitle")
  /// lock
  internal static let passwordIconName = L10n.tr("Localizable", "passwordIconName")
  /// كلمة المرور
  internal static let passwordPlaceHolder = L10n.tr("Localizable", "passwordPlaceHolder")
  /// تسجيل مستخدم جديد
  internal static let register = L10n.tr("Localizable", "register")
  /// تسجيل جديد
  internal static let registerButtonTitle = L10n.tr("Localizable", "registerButtonTitle")
  /// الخدمات
  internal static let servicesCategories = L10n.tr("Localizable", "servicesCategories")
  /// gear
  internal static let servicesTab = L10n.tr("Localizable", "servicesTab")
  /// تخطي
  internal static let skipButtonTitle = L10n.tr("Localizable", "skipButtonTitle")
  /// إجمالى سعر طلبك
  internal static let totalPrice = L10n.tr("Localizable", "totalPrice")
  /// person
  internal static let usernameIconName = L10n.tr("Localizable", "usernameIconName")
  /// اسم المستخدم
  internal static let usernamePlaceHolder = L10n.tr("Localizable", "usernamePlaceHolder")
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
