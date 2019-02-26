// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum Strings {

  internal enum App {
    internal enum Mainview {
      /// Alright
      internal static let locationPermissionAccept = Strings.tr("Localizable", "app.mainview.locationPermissionAccept")
      /// Go To Settings
      internal static let locationPermissionAlertSettingsButton = Strings.tr("Localizable", "app.mainview.locationPermissionAlertSettingsButton")
      /// \nWe need your location. Please go to settings to give us access\n\n
      internal static let locationPermissionAlertText = Strings.tr("Localizable", "app.mainview.locationPermissionAlertText")
      /// Location Permission Needed
      internal static let locationPermissionAlertTitle = Strings.tr("Localizable", "app.mainview.locationPermissionAlertTitle")
      /// OK
      internal static let locationPermissionErrorOKButton = Strings.tr("Localizable", "app.mainview.locationPermissionErrorOKButton")
      /// \nThere was a problem getting your location. Please try later\n\n
      internal static let locationPermissionErrorText = Strings.tr("Localizable", "app.mainview.locationPermissionErrorText")
      /// Location Error
      internal static let locationPermissionErrorTitle = Strings.tr("Localizable", "app.mainview.locationPermissionErrorTitle")
      /// Not now
      internal static let locationPermissionReject = Strings.tr("Localizable", "app.mainview.locationPermissionReject")
      /// We need your location for some awesome features
      internal static let locationPermissionText = Strings.tr("Localizable", "app.mainview.locationPermissionText")
      /// CoolRestaurants
      internal static let title = Strings.tr("Localizable", "app.mainview.title")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    // swiftlint:disable:next nslocalizedstring_key
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
