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

        property int blankCount: 0

        Keys.onReturnPressed: {
            if (text.length) {
                priceLabel.text = text
                blankCount = 0

                var price = Number(text)
                if (text == "refresh" || text == "r") {
                    priceLabel.text = "..."
                    Currency.load()
                } else if (text == "exit" || text == "quit" || text == "q") {
                    Qt.quit()
                } else if (isNaN(price)) {
                    window.clear()
                } else {
                    window.update(text)
                }
            } else {
                blankCount += 1
                if (blankCount >= 2) {
                    var sentences = ["Arvin 紀錄", "CCKai 行政 場務", "Conan 線路", "小畢 (CrBoy) 總召", "EAT 場務", "Frank Ye 場務", "Gent 行銷", "HaWay 紀錄", "博凱 場務 線路", "腦腦 場務", "Iven 紀錄", "阿哲 場務", "HenryLee 場務", "Joean 紀錄", "Jordan 紀錄", "崧源 行政", "Peter Dave Hello 線路", "RSChiang 行銷", "Sars 線路", "Teresa 紀錄", "牙牙 紀錄", "Vagabond 場務", "三子 紀錄", "Kevin-WY 場務", "adaam 紀錄", "小卓 - AL 行政", "lin4h 場務", "遇雨 場務", "奇猴 銷售", "小草 行政", "Aminzai 紀錄", "裸男 場務", "喬巴 場務", "Angelboy 行政", "Anson 場務", "青箭 場務", "YiHung 場務", "au 議程委員會", "阿旺 紀錄", "Shooter 場務", "YWJamesLin 線路", "大眼 場務", "HBA 場務", "鈴鐺 場務", "BinotaLiu 場務", "BobChao 行政", "BOBO 場務", "其詳 行政 銷售", "崑元 場務", "糖果荔枝 銷售", "四貓貓 場務", "Chi Kuo 場務", "choupi 紀錄", "阿豪 紀錄", "克莉絲汀（貓咪） 行政 場務", "浩克 場務", "Trista 場務", "小白 場務", "凍仁翔 行銷", "CJOKER 紀錄", "clkao 議程委員會", "cras4202tw 紀錄", "西歪街 紀錄", "貓貓 場務", "Slash 場務", "大助 紀錄", "丹丹 紀錄", "掉(ry猴子 線路", "Paul保羅 場務", "david 線路", "Denny Huang 線路", "HALU 場務", "珣珣 場務", "左邊 線路", "小翊 線路", "Donny 場務", "DreamerC(Chen Shang-Pin) 線路", "Ernest / dwchiang 銷售", "Emma 場務", "ㄅㄌ（Erickson） 場務", "fateyan / 肥燕 場務", "魚丸 場務", "Frank 線路", "freedom 議程委員會", "小趴 線路", "Owen 場務", "gugod 議程委員會", "小夢 場務", "傻羽 場務", "空空 場務", "腹黒い茶 線路", "Hashman 場務", "丞相 紀錄", "HC 議程委員會", "Hikari 場務", "孟穎 場務", "筱君 場務", "點點 紀錄", "idfer 場務", "Infax Lai 線路", "一尾 場務", "波卡Poka 線路", "Jason 場務", "Jason3e7 線路", "Jefferysac 場務", "Jeremy 場務", "刺蝟 場務", "杰翰 場務", "Sung 場務", "葉子 場務", "JohnDoe 線路", "Jolin 場務", "Jouston 銷售", "jserv 議程委員會", "浚原 線路", "手慢君 線路", "Kevin Chen 場務", "玖楠 場務", "Elvis 場務", "Liyang 場務", "Lloyd Huang 出納", "Lorex 線路", "Lorraine 行政", "麵包 場務", "零夢 場務", "王笑笑 線路", "megshao 場務", "Ming 線路", "蜜私酒 場務", "曉晰 紀錄", "MouseMs 場務", "Muka 行銷", "Nalant 線路", "竣翔 場務", "胃炎 場務", "Can 紀錄", "TakoTsai 線路", "nfsnfs 行政", "桌機哥 場務", "朋朋 場務", "o00winnie00o 場務", "Orin 行銷", "othree 紀錄", "胖胖 線路", "pcchou (PCC) 線路", "小松 場務", "pingooo 議程委員會", "pm5 行政", "姿姿 場務", "小ㄐ 行政", "小葵 場務", "宜倫 場務", "歐西里斯 行銷", "Fish福 場務", "魚魚 線路", "影子 行銷", "Lora 闇鴉 行政", "Chuck 紀錄", "shiashia蝦蝦 銷售", "詩庭 場務", "Shouko 翔子 場務", "Yang 場務", "Shu Hua 場務", "欣哥 場務", "Singing Li 會計", "恩榕 場務", "蛇蛇 (Snake) 行銷", "soidid 行政", "Song11 場務", "sony 場務", "凌羽 線路", "Yiching 場務", "小燁 場務", "Lafin 紀錄", "星雨 紀錄", "Starlition 線路", "Jerry 場務", "Timchen119 會計", "Tim 場務", "Toomore Chiang 行政", "熊猫 場務", "taka 場務", "Paddy 銷售", "Violet阿紫 行銷", "小聖 紀錄", "ws育慈 行銷", "阿吉 場務", "Stanley 場務", "Chris 場務", "Beta 場務", "xxx 線路", "雁子 行銷", "Leo 場務", "小方 場務", "LY 行政", "Zac 紀錄", "ZAL 場務", "天羽嘉龍 線路", "皇甫 線路", "竹本立里 線路", "Eiling 線路"]
                    priceLabel.text = sentences[Math.floor(Math.random() * sentences.length)]
                } else {
                    priceLabel.text = "0"
                }

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
        update(); return
        currencyUSD.price = Currency.get("美金 (USD)", 1)
        currencyHKD.price = Currency.get("港幣 (HKD)", 1)
        currencyRMB.price = Currency.get("人民幣 (CNY)", 1)
    }

    function update(price) {
        currencyUSD.price = "無價"//Currency.get("美金 (USD)", price)
        currencyHKD.price = "無價"//Currency.get("港幣 (HKD)", price)
        currencyRMB.price = "無價"//Currency.get("人民幣 (CNY)", price)
    }

    Component.onCompleted: {
        Currency.load()
    }
}
