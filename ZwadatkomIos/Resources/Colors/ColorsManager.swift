// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit.NSColor
  internal typealias Color = NSColor
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIColor
  internal typealias Color = UIColor
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Colors

// swiftlint:disable identifier_name line_length type_body_length
internal struct ColorName {
  internal let rgbaValue: UInt32
  internal var color: Color { return Color(named: self) }

  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#000000"></span>
  /// Alpha: 100% <br/> (0x000000ff)
  internal static let blackColor = ColorName(rgbaValue: 0x000000ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#29b566"></span>
  /// Alpha: 100% <br/> (0x29b566ff)
  internal static let darkGreen = ColorName(rgbaValue: 0x29b566ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#838383"></span>
  /// Alpha: 100% <br/> (0x838383ff)
  internal static let grayColor = ColorName(rgbaValue: 0x838383ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#8ac865"></span>
  /// Alpha: 100% <br/> (0x8ac865ff)
  internal static let greenColor = ColorName(rgbaValue: 0x8ac865ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#e5e5e5"></span>
  /// Alpha: 100% <br/> (0xe5e5e5ff)
  internal static let lightGray = ColorName(rgbaValue: 0xe5e5e5ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f9f9f9"></span>
  /// Alpha: 100% <br/> (0xf9f9f9ff)
  internal static let offGray = ColorName(rgbaValue: 0xf9f9f9ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ee2f35"></span>
  /// Alpha: 100% <br/> (0xee2f35ff)
  internal static let red = ColorName(rgbaValue: 0xee2f35ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#686868"></span>
  /// Alpha: 100% <br/> (0x686868ff)
  internal static let semiGray = ColorName(rgbaValue: 0x686868ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#eeeeee"></span>
  /// Alpha: 100% <br/> (0xeeeeeeff)
  internal static let softGray = ColorName(rgbaValue: 0xeeeeeeff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffffff"></span>
  /// Alpha: 100% <br/> (0xffffffff)
  internal static let whiteColor = ColorName(rgbaValue: 0xffffffff)
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

internal extension Color {
  convenience init(rgbaValue: UInt32) {
    let components = RGBAComponents(rgbaValue: rgbaValue).normalized
    self.init(red: components[0], green: components[1], blue: components[2], alpha: components[3])
  }
}

private struct RGBAComponents {
  let rgbaValue: UInt32

  private var shifts: [UInt32] {
    [
      rgbaValue >> 24, // red
      rgbaValue >> 16, // green
      rgbaValue >> 8,  // blue
      rgbaValue        // alpha
    ]
  }

  private var components: [CGFloat] {
    shifts.map {
      CGFloat($0 & 0xff)
    }
  }

  var normalized: [CGFloat] {
    components.map { $0 / 255.0 }
  }
}

internal extension Color {
  convenience init(named color: ColorName) {
    self.init(rgbaValue: color.rgbaValue)
  }
}
