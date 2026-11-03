import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root
    default property alias content: body.data
    property string title: ""
    property string trailing: ""
    property color trailingColor: Theme.muted
    property int inset: 20

    color: Theme.surface
    radius: Theme.tileRadius
    border.width: 1
    border.color: Theme.border
    clip: true

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: root.inset
        spacing: 14

        RowLayout {
            Layout.fillWidth: true
            visible: root.title.length > 0 || root.trailing.length > 0
            spacing: 8

            Text {
                text: root.title
                color: Theme.muted
                font.pixelSize: 13
                font.weight: Font.Medium
                Layout.fillWidth: true
                elide: Text.ElideRight
            }

            Text {
                text: root.trailing
                color: root.trailingColor
                font.family: "Cascadia Mono"
                font.pixelSize: 11
                visible: root.trailing.length > 0
            }
        }

        ColumnLayout {
            id: body
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 0
        }
    }
}
