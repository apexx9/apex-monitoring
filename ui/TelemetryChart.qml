import QtQuick

Item {
    id: root
    property color lineColor: Theme.accent
    property color secondaryColor: Theme.muted
    property bool showSecondary: true
    property var values: [0.38,0.42,0.39,0.48,0.46,0.51,0.49,0.56,0.52,0.59,0.55,0.63,0.60,0.67,0.64,0.72,0.68,0.74,0.70,0.79,0.76,0.82,0.78,0.87,0.84,0.90,0.86,0.93,0.89,0.96]
    property var comparison: [0.34,0.37,0.36,0.41,0.40,0.43,0.42,0.46,0.45,0.49,0.47,0.52,0.50,0.54,0.53,0.57,0.55,0.60,0.58,0.62,0.61,0.65,0.63,0.67,0.66,0.70,0.68,0.72,0.71,0.75]

    Canvas {
        id: plot
        anchors.fill: parent
        onPaint: {
            const ctx = getContext("2d")
            ctx.clearRect(0, 0, width, height)
            ctx.strokeStyle = Theme.border
            ctx.lineWidth = 1
            ctx.setLineDash([2, 6])
            for (let i = 1; i <= 3; ++i) {
                const y = height * i / 4
                ctx.beginPath(); ctx.moveTo(0, y); ctx.lineTo(width, y); ctx.stroke()
            }
            ctx.setLineDash([])
            function draw(series, color, lineWidth) {
                if (!series || series.length < 2) return
                ctx.beginPath()
                series.forEach((v, i) => {
                    const x = width * i / (series.length - 1)
                    const y = height - 8 - v * (height - 16)
                    if (i === 0) ctx.moveTo(x, y)
                    else {
                        const px = width * (i - 1) / (series.length - 1)
                        const py = height - 8 - series[i - 1] * (height - 16)
                        const mid = (px + x) / 2
                        ctx.bezierCurveTo(mid, py, mid, y, x, y)
                    }
                })
                ctx.strokeStyle = color
                ctx.lineWidth = lineWidth
                ctx.lineCap = "round"
                ctx.lineJoin = "round"
                ctx.stroke()
            }
            if (root.showSecondary) draw(root.comparison, root.secondaryColor, 1.4)
            draw(root.values, root.lineColor, 2.4)
        }
        Connections {
            target: root
            function onValuesChanged() { plot.requestPaint() }
            function onComparisonChanged() { plot.requestPaint() }
            function onWidthChanged() { plot.requestPaint() }
            function onHeightChanged() { plot.requestPaint() }
            function onShowSecondaryChanged() { plot.requestPaint() }
        }
    }
}
