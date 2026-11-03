pragma Singleton
import QtQuick

QtObject {
    readonly property color background: "#171916"
    readonly property color surface: "#20231F"
    readonly property color surfaceRaised: "#292D27"
    readonly property color border: "#353A32"
    readonly property color foreground: "#E9EBE5"
    readonly property color muted: "#92988C"
    readonly property color accent: "#B4DC69"
    readonly property color accent2: "#B9A5E8"
    readonly property color quiet: "#687064"
    readonly property color success: "#B4DC69"
    readonly property color warning: "#D9B56D"
    readonly property color danger: "#D98989"

    readonly property int tileRadius: 26
    readonly property int controlRadius: 14
    readonly property int gutter: 12
    readonly property int pageMargin: 28
}
