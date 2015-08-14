
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
        return "ERR!"
    } else {
        var rate = Number(item.cash_buy)
        var t = Math.round(base / rate * 100)
        var s = String(t)
        if (t % 100 == 0) {
            return s.substring(0, s.length - 2)
        } else {
            return s.substring(0, s.length - 2) + "." + s.substring(-2)
        }
    }
}
