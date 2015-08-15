mac {
    ICON = platform/mac/coscup.icns
    QMAKE_INFO_PLIST = platform/mac/Info.plist
    QMAKE_MAC_SDK = macosx10.9

    CONFIG(release) {
        QMAKE_POST_LINK += macdeployqt CoscupBidder.app -qmldir=../CoscupBidder -dmg -verbose=3;
    }
} else:android-no-sdk {
    target.path = /data/user/qt
    export(target.path)
    INSTALLS += target
} else:android {
    x86 {
        target.path = /libs/x86
    } else: armeabi-v7a {
        target.path = /libs/armeabi-v7a
    } else {
        target.path = /libs/armeabi
    }
    export(target.path)
    INSTALLS += target
} else:unix {
    isEmpty(target.path) {
        qnx {
            target.path = /tmp/$${TARGET}/bin
        } else {
            target.path = /opt/$${TARGET}/bin
        }
        export(target.path)
    }
    INSTALLS += target
}

export(INSTALLS)
