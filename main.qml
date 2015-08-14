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
        height: parent.height * .618

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

    Row {
        id: currencyArea
        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        height: parent.height * .382

        CurrencyItem {
            id: currencyUSD
            currency: "USD"
            color: "#3F51B5"
        }

        CurrencyItem {
            id: currencyHKD
            currency: "HKD"
            color: "#FFC107"
        }

        CurrencyItem {
            id: currencyRMB
            currency: "RMB"
            color: "#F44336"
        }
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
                currencyUSD.price = Math.round(text / 32)
                currencyHKD.price = Math.round(text / 4)
                currencyRMB.price = Math.round(text / 5)
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

    HttpRequestHelper {
        id: helper
        onDone: {
            var response = JSON.parse(data)
        }
    }

    Component.onCompleted:{
        helper.send("https://www.kimonolabs.com/api/5gwbb852?apikey=Wrog1m1TeyQhJb3LMNuzQrvJ7sTpxlya")
    }
}
