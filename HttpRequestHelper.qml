import QtQuick 2.0

QtObject {

    signal done(string data)
    signal error

    function send(url) {
        // 建立新的 Ajax 請求
        var request = new XMLHttpRequest()

        // 告訴 request 當網路狀態改變的時候要做什麼
        request.onreadystatechange = function() {
            // 當載入完成的時候
            if (request.readyState == XMLHttpRequest.DONE) {
                if (request.status != 200) // 200 是 OK 的意思
                    error() // 不是 200，顯示錯誤
                else
                    done(request.responseText) // 傳回資訊
            }
        }

        // 用 HTTP GET 打開網址並送出
        request.open("GET", url)
        request.send()
    }

}

