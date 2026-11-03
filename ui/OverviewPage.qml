import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root
    property string selectedRange: "1H"
    property bool demoMode: true

    Flickable {
        anchors.fill: parent
        contentWidth: width
        contentHeight: page.implicitHeight
        clip: true
        ScrollBar.vertical: ScrollBar { policy: ScrollBar.AsNeeded }

        ColumnLayout {
            id: page
            width: parent.width
            spacing: 18

            RowLayout {
                Layout.fillWidth: true
                spacing: 12
                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 4
                    Text {
                        text: "System overview"
                        color: Theme.foreground
                        font.pixelSize: 26
                        font.weight: Font.DemiBold
                        font.letterSpacing: -0.8
                    }
                    Text {
                        text: "Hardware performance at a glance"
                        color: Theme.muted
                        font.pixelSize: 13
                    }
                }
                Rectangle {
                    radius: 20
                    color: Theme.surface
                    border.color: Theme.border
                    border.width: 1
                    implicitWidth: statusRow.implicitWidth + 24
                    implicitHeight: 34
                    RowLayout {
                        id: statusRow
                        anchors.centerIn: parent
                        spacing: 8
                        Rectangle { width: 7
                        height: 7
                        radius: 4
                        color: Theme.warning }
                        Text { text: "DEMO DATA"
                        color: Theme.muted
                        font.pixelSize: 10
                        font.family: "Cascadia Mono"
                        font.weight: Font.DemiBold }
                    }
                }
            }

            GridLayout {
                id: grid
                Layout.fillWidth: true
                columns: width >= 1120 ? 4 : width >= 760 ? 2 : 1
                columnSpacing: 12
                rowSpacing: 12

                BentoTile {
                    Layout.columnSpan: grid.columns >= 2 ? 2 : 1
                    Layout.preferredHeight: 236
                    Layout.fillWidth: true
                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 8
                        RowLayout {
                            Layout.fillWidth: true
                            Text {
                                text: "Hardware health"
                                color: Theme.foreground
                                font.pixelSize: 27
                                font.weight: Font.DemiBold
                                font.letterSpacing: -0.8
                                Layout.fillWidth: true
                            }
                            Text { text: "●"
                            color: Theme.accent
                            font.pixelSize: 12 }
                        }
                        Text { text: "ESP32 development board"
                        color: Theme.muted
                        font.pixelSize: 13 }
                        Item { Layout.fillHeight: true }
                        RowLayout {
                            Layout.fillWidth: true
                            spacing: 22
                            ColumnLayout {
                                spacing: 2
                                Text { text: "98.6%"
                                color: Theme.foreground
                                font.pixelSize: 34
                                font.family: "Cascadia Mono"
                                font.weight: Font.DemiBold }
                                Text { text: "UPTIME · SIMULATED"
                                color: Theme.muted
                                font.pixelSize: 9
                                font.family: "Cascadia Mono" }
                            }
                            Rectangle { width: 1
                            height: 42
                            color: Theme.border }
                            ColumnLayout {
                                spacing: 2
                                Text { text: "4"
                                color: Theme.foreground
                                font.pixelSize: 25
                                font.family: "Cascadia Mono" }
                                Text { text: "ACTIVE CHANNELS"
                                color: Theme.muted
                                font.pixelSize: 9
                                font.family: "Cascadia Mono" }
                            }
                            ColumnLayout {
                                spacing: 2
                                Text { text: "0"
                                color: Theme.foreground
                                font.pixelSize: 25
                                font.family: "Cascadia Mono" }
                                Text { text: "CRITICAL ALERTS"
                                color: Theme.muted
                                font.pixelSize: 9
                                font.family: "Cascadia Mono" }
                            }
                        }
                    }
                    Rectangle {
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        width: 150
                        height: 92
                        color: "transparent"
                        Canvas {
                            anchors.fill: parent
                            onPaint: {
                                const c = getContext("2d")
                                c.clearRect(0,0,width,height)
                                c.strokeStyle = Theme.accent
                                c.globalAlpha = 0.8
                                c.lineWidth = 2
                                c.beginPath()
                                const a = [52,48,56,43,46,31,38,24,30,18,25,12]
                                a.forEach((v,i) => { const x = i*(width-8)/(a.length-1); const y = v; if (!i) c.moveTo(x,y); else c.lineTo(x,y) })
                                c.stroke()
                            }
                        }
                    }
                }

                BentoTile {
                    title: "Device stack"
                    Layout.preferredHeight: 236
                    Layout.fillWidth: true
                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 12
                        RowLayout {
                            Layout.fillWidth: true
                            Rectangle { width: 34
                            height: 34
                            radius: 11
                            color: Theme.surfaceRaised
                            Text { anchors.centerIn: parent
                            text: "MCU"
                            color: Theme.accent
                            font.pixelSize: 9
                            font.family: "Cascadia Mono"
                            font.bold: true } }
                            ColumnLayout { Layout.fillWidth: true
                            spacing: 2
                            Text { text: "ESP32"
                            color: Theme.foreground
                            font.pixelSize: 13
                            font.weight: Font.Medium }
                            Text { text: "ESP-32D · COM11"
                            color: Theme.muted
                            font.pixelSize: 10
                            font.family: "Cascadia Mono" } }
                            Text { text: "●"
                            color: Theme.warning
                            font.pixelSize: 10 }
                        }
                        Rectangle { Layout.fillWidth: true
                        height: 1
                        color: Theme.border }
                        RowLayout {
                            Layout.fillWidth: true
                            Rectangle { width: 34
                            height: 34
                            radius: 11
                            color: Theme.surfaceRaised
                            Text { anchors.centerIn: parent
                            text: "UART"
                            color: Theme.accent2
                            font.pixelSize: 9
                            font.family: "Cascadia Mono"
                            font.bold: true } }
                            ColumnLayout { Layout.fillWidth: true
                            spacing: 2
                            Text { text: "Serial interface"
                            color: Theme.foreground
                            font.pixelSize: 13 }
                            Text { text: "115200 baud · 8N1"
                            color: Theme.muted
                            font.pixelSize: 10
                            font.family: "Cascadia Mono" } }
                        }
                        Item { Layout.fillHeight: true }
                        Text { text: "NOT CONNECTED · EXAMPLE CONFIG"
                        color: Theme.warning
                        font.pixelSize: 9
                        font.family: "Cascadia Mono" }
                    }
                }

                BentoTile {
                    title: "System load"
                    Layout.preferredHeight: 236
                    Layout.fillWidth: true
                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 8
                        RowLayout {
                            Layout.fillWidth: true
                            Text { text: "42"
                            color: Theme.foreground
                            font.pixelSize: 42
                            font.family: "Cascadia Mono"
                            font.weight: Font.DemiBold }
                            Text { text: "%"
                            color: Theme.muted
                            font.pixelSize: 19
                            font.family: "Cascadia Mono"
                            Layout.alignment: Qt.AlignBottom }
                            Item { Layout.fillWidth: true }
                            Text { text: "CPU"
                            color: Theme.muted
                            font.pixelSize: 11
                            font.family: "Cascadia Mono" }
                        }
                        Rectangle {
                            Layout.fillWidth: true
                            height: 9
                            radius: 5
                            color: Theme.surfaceRaised
                            Rectangle { width: parent.width * 0.42
                            height: parent.height
                            radius: 5
                            color: Theme.accent }
                        }
                        RowLayout { Layout.fillWidth: true
                        Text { text: "Memory"
                        color: Theme.muted
                        font.pixelSize: 11 }
                        Item { Layout.fillWidth: true }
                        Text { text: "61%"
                        color: Theme.foreground
                        font.pixelSize: 11
                        font.family: "Cascadia Mono" } }
                        Rectangle { Layout.fillWidth: true
                        height: 5
                        radius: 3
                        color: Theme.surfaceRaised
                        Rectangle { width: parent.width * 0.61
                        height: parent.height
                        radius: 3
                        color: Theme.accent2 } }
                        Item { Layout.fillHeight: true }
                        Text { text: "SIMULATED TELEMETRY"
                        color: Theme.muted
                        font.pixelSize: 9
                        font.family: "Cascadia Mono" }
                    }
                }

                BentoTile {
                    title: "Telemetry"
                    trailing: "LIVE PREVIEW"
                    Layout.columnSpan: grid.columns >= 2 ? 2 : 1
                    Layout.preferredHeight: 270
                    Layout.fillWidth: true
                    ColumnLayout {
                        Layout.fillWidth: true
                        RowLayout {
                            Layout.fillWidth: true
                            ColumnLayout { Layout.fillWidth: true
                            spacing: 3
                            Text { text: "Signal activity"
                            color: Theme.foreground
                            font.pixelSize: 23
                            font.weight: Font.DemiBold }
                            Text { text: "ADC · GPIO 34"
                            color: Theme.muted
                            font.pixelSize: 10
                            font.family: "Cascadia Mono" } }
                            RowLayout {
                                spacing: 2
                                Repeater {
                                    model: ["1M", "5M", "1H", "ALL"]
                                    delegate: Rectangle {
                                        radius: 12
                                        color: root.selectedRange === modelData ? Theme.foreground : "transparent"
                                        implicitWidth: rangeText.implicitWidth + 15
                                        implicitHeight: 26
                                        Text { id: rangeText
                                        anchors.centerIn: parent
                                        text: modelData
                                        color: root.selectedRange === modelData ? Theme.background : Theme.muted
                                        font.pixelSize: 9
                                        font.family: "Cascadia Mono" }
                                        MouseArea { anchors.fill: parent
                                        onClicked: root.selectedRange = modelData }
                                    }
                                }
                            }
                        }
                        TelemetryChart { Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.topMargin: 8 }
                        RowLayout {
                            Layout.fillWidth: true
                            Text { text: "0.0"
                            color: Theme.muted
                            font.pixelSize: 9
                            font.family: "Cascadia Mono" }
                            Item { Layout.fillWidth: true }
                            Text { text: "1.2"
                            color: Theme.accent
                            font.pixelSize: 9
                            font.family: "Cascadia Mono" }
                            Item { Layout.fillWidth: true }
                            Text { text: "2.4"
                            color: Theme.muted
                            font.pixelSize: 9
                            font.family: "Cascadia Mono" }
                        }
                    }
                }

                BentoTile {
                    title: "Resource allocation"
                    Layout.preferredHeight: 270
                    Layout.fillWidth: true
                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 10
                        Text { text: "Peripheral usage"
                        color: Theme.foreground
                        font.pixelSize: 22
                        font.family: "Cascadia Mono"
                        font.weight: Font.DemiBold }
                        RowLayout {
                            Layout.fillWidth: true
                            spacing: 3
                            Repeater {
                                model: [{v:34,c:Theme.accent},{v:26,c:Theme.accent2},{v:18,c:"#777D72"},{v:12,c:"#555B51"},{v:10,c:"#3D433B"}]
                                delegate: Rectangle { Layout.fillWidth: modelData.v
                                height: 31
                                radius: 7
                                color: modelData.c }
                            }
                        }
                        Repeater {
                            model: [{n:"GPIO",v:"34%",c:Theme.accent},{n:"ADC",v:"26%",c:Theme.accent2},{n:"UART",v:"18%",c:"#777D72"},{n:"PWM",v:"12%",c:"#555B51"}]
                            delegate: RowLayout {
                                Layout.fillWidth: true
                                Rectangle { width: 7
                                height: 7
                                radius: 4
                                color: modelData.c }
                                Text { text: modelData.n
                                color: Theme.muted
                                font.pixelSize: 11
                                Layout.fillWidth: true }
                                Text { text: modelData.v
                                color: Theme.foreground
                                font.pixelSize: 11
                                font.family: "Cascadia Mono" }
                            }
                        }
                        Item { Layout.fillHeight: true }
                        Text { text: "EXAMPLE CHANNEL DISTRIBUTION"
                        color: Theme.muted
                        font.pixelSize: 9
                        font.family: "Cascadia Mono" }
                    }
                }

                BentoTile {
                    title: "Controller performance"
                    Layout.preferredHeight: 270
                    Layout.fillWidth: true
                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 9
                        Text { text: "PID response"
                        color: Theme.foreground
                        font.pixelSize: 22
                        font.weight: Font.DemiBold }
                        RowLayout {
                            Layout.fillWidth: true
                            ColumnLayout { Layout.fillWidth: true
                            spacing: 2
                            Text { text: "0.024"
                            color: Theme.foreground
                            font.pixelSize: 24
                            font.family: "Cascadia Mono" }
                            Text { text: "SETTLING ERROR"
                            color: Theme.muted
                            font.pixelSize: 8
                            font.family: "Cascadia Mono" } }
                            ColumnLayout { Layout.fillWidth: true
                            spacing: 2
                            Text { text: "118"
                            color: Theme.foreground
                            font.pixelSize: 24
                            font.family: "Cascadia Mono" }
                            Text { text: "RPM"
                            color: Theme.muted
                            font.pixelSize: 8
                            font.family: "Cascadia Mono" } }
                        }
                        Rectangle { Layout.fillWidth: true
                        height: 1
                        color: Theme.border }
                        RowLayout { Layout.fillWidth: true
                        Text { text: "Kp"
                        color: Theme.muted
                        font.pixelSize: 11 }
                        Item { Layout.fillWidth: true }
                        Text { text: "1.20"
                        color: Theme.foreground
                        font.pixelSize: 11
                        font.family: "Cascadia Mono" } }
                        RowLayout { Layout.fillWidth: true
                        Text { text: "Ki"
                        color: Theme.muted
                        font.pixelSize: 11 }
                        Item { Layout.fillWidth: true }
                        Text { text: "0.08"
                        color: Theme.foreground
                        font.pixelSize: 11
                        font.family: "Cascadia Mono" } }
                        RowLayout { Layout.fillWidth: true
                        Text { text: "Kd"
                        color: Theme.muted
                        font.pixelSize: 11 }
                        Item { Layout.fillWidth: true }
                        Text { text: "0.02"
                        color: Theme.foreground
                        font.pixelSize: 11
                        font.family: "Cascadia Mono" } }
                        Text { text: "SIMULATED CONTROLLER VALUES"
                        color: Theme.muted
                        font.pixelSize: 9
                        font.family: "Cascadia Mono" }
                    }
                }

                BentoTile {
                    title: "Operating range"
                    Layout.preferredHeight: 270
                    Layout.fillWidth: true
                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 12
                        Text { text: "Motor temperature"
                        color: Theme.foreground
                        font.pixelSize: 20
                        font.weight: Font.DemiBold }
                        RowLayout { Layout.fillWidth: true
                        Text { text: "42.8"
                        color: Theme.foreground
                        font.pixelSize: 33
                        font.family: "Cascadia Mono"
                        font.weight: Font.DemiBold }
                        Text { text: "°C"
                        color: Theme.muted
                        font.pixelSize: 15
                        Layout.alignment: Qt.AlignBottom }
                        Item { Layout.fillWidth: true }
                        Text { text: "NORMAL"
                        color: Theme.accent
                        font.pixelSize: 9
                        font.family: "Cascadia Mono" } }
                        Rectangle {
                            Layout.fillWidth: true
                            height: 38
                            radius: 10
                            color: Theme.surfaceRaised
                            Rectangle { x: parent.width * 0.2
                            width: parent.width * 0.6
                            height: parent.height
                            radius: 10
                            color: Theme.accent
                            opacity: 0.14 }
                            Rectangle { x: parent.width * 0.57
                            width: 3
                            height: parent.height + 8
                            y: -4
                            radius: 2
                            color: Theme.foreground }
                        }
                        RowLayout { Layout.fillWidth: true
                        Text { text: "0°C"
                        color: Theme.muted
                        font.pixelSize: 10
                        font.family: "Cascadia Mono" }
                        Item { Layout.fillWidth: true }
                        Text { text: "80°C limit"
                        color: Theme.muted
                        font.pixelSize: 10
                        font.family: "Cascadia Mono" } }
                        Item { Layout.fillHeight: true }
                        Text { text: "THRESHOLD MONITOR · EXAMPLE"
                        color: Theme.muted
                        font.pixelSize: 9
                        font.family: "Cascadia Mono" }
                    }
                }

                BentoTile {
                    title: "Acquisition stream"
                    trailing: "SAMPLE"
                    Layout.columnSpan: grid.columns >= 2 ? 2 : 1
                    Layout.preferredHeight: 210
                    Layout.fillWidth: true
                    ColumnLayout {
                        Layout.fillWidth: true
                        RowLayout {
                            Layout.fillWidth: true
                            ColumnLayout { Layout.fillWidth: true
                            spacing: 2
                            Text { text: "Sample #024,190"
                            color: Theme.foreground
                            font.pixelSize: 21
                            font.family: "Cascadia Mono"
                            font.weight: Font.DemiBold }
                            Text { text: "ADC0 · 12-bit resolution"
                            color: Theme.muted
                            font.pixelSize: 10
                            font.family: "Cascadia Mono" } }
                            Text { text: "2.84 kHz"
                            color: Theme.accent
                            font.pixelSize: 11
                            font.family: "Cascadia Mono" }
                        }
                        Item { Layout.fillHeight: true }
                        RowLayout {
                            Layout.fillWidth: true
                            spacing: 3
                            Repeater {
                                model: [22,31,26,39,45,36,52,43,60,48,57,68,54,73,62,80,69,75,58,84,72,91,78,86,66,95,82,88,74,97,84,90,71,83,68,92,77,86,74,94]
                                delegate: Rectangle { Layout.fillWidth: true
                                Layout.alignment: Qt.AlignBottom
                                height: modelData * 0.58
                                radius: 2
                                color: index === 39 ? Theme.accent : Theme.muted
                                opacity: index === 39 ? 1 : 0.18 + index / 100 }
                            }
                        }
                        Rectangle { Layout.fillWidth: true
                        height: 1
                        color: Theme.border }
                        RowLayout {
                            Layout.fillWidth: true
                            Text { text: "Sample rate  2.84 kHz"
                            color: Theme.muted
                            font.pixelSize: 10
                            font.family: "Cascadia Mono" }
                            Item { Layout.fillWidth: true }
                            Text { text: "Buffer  64%"
                            color: Theme.muted
                            font.pixelSize: 10
                            font.family: "Cascadia Mono" }
                        }
                    }
                }

                BentoTile {
                    title: "Hardware activity"
                    Layout.columnSpan: grid.columns >= 2 ? 2 : 1
                    Layout.preferredHeight: 210
                    Layout.fillWidth: true
                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 8
                        Repeater {
                            model: [
                                {t:"Serial interface initialized",d:"COM11 · 115200 baud · example",s:"INFO",c:Theme.accent},
                                {t:"ADC threshold crossed",d:"GPIO 34 · 2.84 V · sample",s:"WARN",c:Theme.warning},
                                {t:"Telemetry buffer ready",d:"64% capacity · sample",s:"INFO",c:Theme.accent2}
                            ]
                            delegate: RowLayout {
                                Layout.fillWidth: true
                                spacing: 10
                                Rectangle { width: 30
                                height: 30
                                radius: 10
                                color: Theme.surfaceRaised
                                Text { anchors.centerIn: parent
                                text: "↗"
                                color: modelData.c
                                font.pixelSize: 13 } }
                                ColumnLayout { Layout.fillWidth: true
                                spacing: 2
                                Text { text: modelData.t
                                color: Theme.foreground
                                font.pixelSize: 11
                                font.weight: Font.Medium }
                                Text { text: modelData.d
                                color: Theme.muted
                                font.pixelSize: 9
                                font.family: "Cascadia Mono" } }
                                Text { text: modelData.s
                                color: modelData.c
                                font.pixelSize: 9
                                font.family: "Cascadia Mono" }
                            }
                        }
                    }
                }
            }
        }
    }
}

