import QtQuick 2.3
import QtQuick.Window 2.2

Window {
    visible: true
    width: 800
    height: 600
    title: "COSCUP Bidder"

    Item {
        id: displayArea
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: currencyArea.top
        }

        Text {
            id: priceLabel
            anchors {
                fill: parent
                margins: 16
            }

            font {
                family: "Oswald"
                pointSize: 256
                weight: Font.DemiBold
            }

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            fontSizeMode: Text.Fit

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
}
