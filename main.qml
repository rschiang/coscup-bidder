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

            text: "6890"
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
}
