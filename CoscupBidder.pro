TEMPLATE = app

QT += qml quick

SOURCES += main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =


mac {
    ICON = platform/mac/coscup.icns
    QMAKE_INFO_PLIST = platform/mac/Info.plist
    QMAKE_MAC_SDK = macosx10.9

    QMAKE_POST_LINK += macdeployqt CoscupBidder.app -qmldir=../CoscupBidder/ -dmg -verbose=1;
}

# Default rules for deployment.
include(deployment.pri)
