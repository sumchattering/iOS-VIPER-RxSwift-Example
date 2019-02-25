// swiftlint:disable all
// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {
  /// Age %1$@
  internal static func ageLabelText(_ p1: String) -> String {
    return L10n.tr("Localizable", "AgeLabelText", p1)
  }
  /// Number of Issues %1$@
  internal static func numberIssuesLabelText(_ p1: String) -> String {
    return L10n.tr("Localizable", "NumberIssuesLabelText", p1)
  }
  /// Ok
  internal static let ok = L10n.tr("Localizable", "Ok")
  /// People
  internal static let tableViewTitle = L10n.tr("Localizable", "TableViewTitle")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}