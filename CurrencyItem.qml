import QtQuick 2.0

Item {
    id: root

    property alias currency: currencyLabel.text
    property alias price: priceLabel.text
    property color color

    implicitHeight: parent.height
    implicitWidth: parent.width / 3

    Text {
        id: currencyLabel
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: priceLabel.top
            leftMargin: 8
            rightMargin: 8
        }

        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 56
        fontSizeMode: Text.Fit

        font.family: "Oswald"
        font.weight: Font.Normal

        Rectangle { color: "#9933b5e5"; anchors.fill: parent }
    }

    Text {
        id: priceLabel
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            leftMargin: 8
            rightMargin: 8
            bottomMargin: -8
        }

        height: parent.height * .724
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 256
        fontSizeMode: Text.Fit

        color: root.color
        font.family: "Oswald"
        font.weight: Font.DemiBold

        onTextChanged: animation.play()
        Rectangle { color: "#992b7500"; anchors.fill: parent }
    }

    NumberAnimation {
        id: animation
        target: priceLabel
        property: "opacity"
        from: 0.5; to: 1
        duration: 500
        easing.type: Easing.OutBack

        function play() {
            if (running) stop()
            start()
        }
    }
}
