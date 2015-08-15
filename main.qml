import QtQuick 2.3
import QtQuick.Window 2.2

import "Currency.js" as Currency

Window {
    id: window
    visible: true
    width: 1024
    height: 768
    title: "COSCUP 拍賣會"

    FontLoader { source: "fonts/Oswald-Regular.ttf" }
    FontLoader { source: "fonts/Oswald-Bold.ttf" }

    Image {
        anchors.fill: parent
        source: "coscup.png"
    }

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
                family: "Oswald, Source Han Sans TC, LiHei Pro, sans-serif"
                pointSize: 256
                weight: Font.Bold
            }

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            fontSizeMode: Text.Fit
            renderType: Text.NativeRendering

            text: "..."
        }
    }

    Row {
        id: currencyArea
        anchors {
            bottom: parent.bottom
            left: parent.left
        }

        height: parent.height * .382
        width: parent.width * 0.67

        CurrencyItem {
            id: currencyUSD
            currency: "USD 美金"
            color: "#3F51B5"
        }

        CurrencyItem {
            id: currencyHKD
            currency: "HKD 港幣"
            color: "#FFC107"
        }

        CurrencyItem {
            id: currencyRMB
            currency: "RMB 人民幣"
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

                var price = Number(text)
                if (text == "refresh") {
                    priceLabel.text = "..."
                    Currency.load()
                }
                else if (isNaN(price)) {
                    window.clear()
                } else {
                    window.update(text)
                }
            } else {
                priceLabel.text = "0"
                window.clear()
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

    function clear() {
        currencyUSD.price = Currency.get("美金 (USD)", 1)
        currencyHKD.price = Currency.get("港幣 (HKD)", 1)
        currencyRMB.price = Currency.get("人民幣 (CNY)", 1)
    }

    function update(price) {
        currencyUSD.price = Currency.get("美金 (USD)", price)
        currencyHKD.price = Currency.get("港幣 (HKD)", price)
        currencyRMB.price = Currency.get("人民幣 (CNY)", price)
    }

    Component.onCompleted: {
        Currency.load()
    }
}
