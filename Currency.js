
// 存放所有貨幣資料
var currencies = {}

// 匯率 API 位置
var api_url = "http://www.kimonolabs.com/api/5gwbb852?apikey=Wrog1m1TeyQhJb3LMNuzQrvJ7sTpxlya"


function load() {
    // 建立新的 Ajax 請求
    var request = new XMLHttpRequest()

    // 告訴 request 當網路狀態改變的時候要做什麼
    request.onreadystatechange = function() {
        // 當載入完成的時候
        if (request.readyState == XMLHttpRequest.DONE) {
            // 記錄 HTTP status code
            console.log(request.status + " " + request.statusText)

            if (request.status == 200) {
                var data = JSON.parse(request.responseText)
                var collection = data.results.collection1

                for (var i in collection) {
                    var item = collection[i]
                    currencies[item.currency] = item
                }
            }
        }
    }

    // 用 HTTP GET 打開網址並送出
    request.open("GET", api_url)
    request.send()
}

function get(currency, base) {
    var item = currencies[currency]
    if (!item) {
        return "無價"//"ERR!"
    } else {
        var rate = Number(item.cash_buy)
        var t = base / rate
        var s = String(t)
        var i = s.indexOf(".")

        if (i < 0) {
            return s
        } else {
            return s.substr(0, i) + "." + s.substr(i+1, 2)
        }
    }
}
