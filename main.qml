import QtQuick 2.3
import QtQuick.Window 2.2

Window {
    visible: true
    width: 800
    height: 600
    title: "COSCUP Bidder"

    Item {
        id: displayArea
        width: parent.width
        height: parent.height * .8

        Text {
            id: priceLabel
            anchors {
                fill: parent
                margins: 16
            }

            font {
                family: "Oswald, Source Han Sans TC, sans-serif"
                pointSize: 256
                weight: Font.DemiBold
            }

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            fontSizeMode: Text.Fit
            renderType: Text.NativeRendering

            text: "5000"
        }
    }

    Item {
        id: currencyArea
        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        height: parent.height * .2
    }

    TextInput {
        id: input
        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right

            bottomMargin: 4
            leftMargin: 12
            rightMargin: 12
        }

        font {
            family: "Menlo"
            pointSize: 12
        }

        color: "#555"
        selectionColor: color
        selectedTextColor: "#fff"
        focus: true

        Keys.onReturnPressed: {
            if (text.length) {
                priceLabel.text = text
            } else {
                priceLabel.text = "0"
            }
            text = ""
            tickAnimation.start()
        }

        Text {
            id: inputPrompt
            anchors {
                right: parent.left
                baseline: parent.baseline
            }

            font: parent.font
            color: parent.color
            text: ":"
        }
    }

    ParallelAnimation {
        id: tickAnimation

        NumberAnimation {
            target: priceLabel
            property: "opacity"
            from: 0.5; to: 1
            duration: 500
            easing.type: Easing.OutBack
        }

        NumberAnimation {
            target: displayArea
            property: "y"
            from: priceLabel.height * .15
            to: 0
            duration: 500
            easing.type: Easing.OutBack
        }

        function play() {
            if (running) stop()
            start()
        }
    }
}
