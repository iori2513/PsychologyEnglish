@available(iOS 11.0, *)
public enum LABiometryType : Int {

    /// The device does not support biometry.
    @available(iOS 11.2, *)
    case none

    /// The device does not support biometry.
    @available(iOS, introduced: 11.0, deprecated: 11.2, renamed: "LABiometryType.none")
    public static var LABiometryNone: LABiometryType { get }

    /// The device supports Touch ID.
    case touchID

    /// The device supports Face ID.
    case faceID
}
