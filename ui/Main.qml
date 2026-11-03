import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: window
    width: 1440
    height: 960
    minimumWidth: 980
    minimumHeight: 700
    visible: true
    title: "APEX Monitor"
    color: Theme.background

    RowLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            Layout.preferredWidth: 218
            Layout.fillHeight: true
            color: "#1B1E1A"
            border.color: Theme.border
            border.width: 0

            ColumnLayout {
                anchors.fill: parent
                anchors.leftMargin: 18
                anchors.rightMargin: 14
                anchors.topMargin: 24
                anchors.bottomMargin: 18
                spacing: 20

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 10
                    Rectangle {
                        width: 34
                        height: 34
                        radius: 11
                        color: Theme.accent
                        Text { anchors.centerIn: parent
                        text: "A"
                        color: "#20251B"
                        font.pixelSize: 19
                        font.weight: Font.Black }
                    }
                    ColumnLayout {
                        spacing: 1
                        Text { text: "APEX"
                        color: Theme.foreground
                        font.pixelSize: 13
                        font.weight: Font.Bold
                        font.letterSpacing: 1.2 }
                        Text { text: "MONITOR"
                        color: Theme.muted
                        font.pixelSize: 9
                        font.family: "Cascadia Mono"
                        font.letterSpacing: 1.1 }
                    }
                }

                Rectangle { Layout.fillWidth: true
                height: 1
                color: Theme.border }

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 5
                    Text { text: "WORKSPACE"
                    color: Theme.quiet
                    font.pixelSize: 9
                    font.family: "Cascadia Mono"
                    font.weight: Font.DemiBold
                    leftPadding: 10
                    bottomPadding: 5 }
                    Repeater {
                        model: [
                            {name:"Overview",glyph:"◫",active:true},
                            {name:"Devices",glyph:"▦"},
                            {name:"Telemetry",glyph:"⌁"},
                            {name:"Analysis",glyph:"∿"},
                            {name:"3D Studio",glyph:"◇"}
                        ]
                        delegate: Rectangle {
                            Layout.fillWidth: true
                            height: 39
                            radius: 12
                            color: modelData.active ? Theme.surfaceRaised : "transparent"
                            RowLayout {
                                anchors.fill: parent
                                anchors.leftMargin: 11
                                anchors.rightMargin: 10
                                spacing: 11
                                Text { text: modelData.glyph
                                color: modelData.active ? Theme.accent : Theme.muted
                                font.pixelSize: 17
                                Layout.preferredWidth: 19
                                horizontalAlignment: Text.AlignHCenter }
                                Text { text: modelData.name
                                color: modelData.active ? Theme.foreground : Theme.muted
                                font.pixelSize: 12
                                font.weight: modelData.active ? Font.DemiBold : Font.Normal
                                Layout.fillWidth: true }
                                Rectangle { visible: modelData.active
                                width: 5
                                height: 5
                                radius: 3
                                color: Theme.accent }
                            }
                        }
                    }
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 5
                    Text { text: "SYSTEM"
                    color: Theme.quiet
                    font.pixelSize: 9
                    font.family: "Cascadia Mono"
                    font.weight: Font.DemiBold
                    leftPadding: 10
                    bottomPadding: 5 }
                    Repeater {
                        model: [
                            {name:"Diagnostics",glyph:"⌕"},
                            {name:"Alerts",glyph:"△"},
                            {name:"Data logger",glyph:"▤"}
                        ]
                        delegate: RowLayout {
                            Layout.fillWidth: true
                            Layout.leftMargin: 11
                            Layout.rightMargin: 10
                            height: 36
                            spacing: 11
                            Text { text: modelData.glyph
                            color: Theme.muted
                            font.pixelSize: 16
                            Layout.preferredWidth: 19
                            horizontalAlignment: Text.AlignHCenter }
                            Text { text: modelData.name
                            color: Theme.muted
                            font.pixelSize: 12
                            Layout.fillWidth: true }
                        }
                    }
                }

                Item { Layout.fillHeight: true }

                Rectangle {
                    Layout.fillWidth: true
                    radius: 15
                    color: Theme.surface
                    border.color: Theme.border
                    implicitHeight: 66
                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 11
                        spacing: 9
                        Rectangle { width: 30
                        height: 30
                        radius: 10
                        color: Theme.surfaceRaised
                        Text { anchors.centerIn: parent
                        text: "USB"
                        color: Theme.accent2
                        font.pixelSize: 8
                        font.family: "Cascadia Mono"
                        font.bold: true } }
                        ColumnLayout { Layout.fillWidth: true
                        spacing: 2
                        Text { text: "No device connected"
                        color: Theme.foreground
                        font.pixelSize: 10
                        font.weight: Font.Medium }
                        Text { text: "Connect a board to begin"
                        color: Theme.muted
                        font.pixelSize: 9 } }
                        Rectangle { width: 6
                        height: 6
                        radius: 3
                        color: Theme.warning }
                    }
                }
            }
        }

        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 0

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 58
                color: Theme.background
                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: 26
                    anchors.rightMargin: 28
                    Text { text: "Workspace"
                    color: Theme.muted
                    font.pixelSize: 11 }
                    Text { text: "/"
                    color: Theme.quiet
                    font.pixelSize: 11 }
                    Text { text: "Overview"
                    color: Theme.foreground
                    font.pixelSize: 11
                    font.weight: Font.Medium }
                    Item { Layout.fillWidth: true }
                    Text { text: "LOCAL SESSION"
                    color: Theme.muted
                    font.pixelSize: 9
                    font.family: "Cascadia Mono" }
                    Rectangle { width: 1
                    height: 18
                    color: Theme.border }
                    Text { text: "v0.1.0"
                    color: Theme.muted
                    font.pixelSize: 10
                    font.family: "Cascadia Mono" }
                }
            }

            OverviewPage {
                Layout.fillWidth: true
                Layout.fillHeight: true
                anchors.leftMargin: 26
                anchors.rightMargin: 28
                anchors.topMargin: 8
                anchors.bottomMargin: 22
            }
        }
    }
}

