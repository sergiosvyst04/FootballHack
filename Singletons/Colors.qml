import QtQuick 2.0

pragma Singleton

QtObject {
    readonly property color bgColor: "#010029"
    readonly property color secondaryColor: "#ADADAD"
    readonly property color secondaryColorWithOpacity: Qt.hsla(0, 0, 0.68, 0.54)
    readonly property color white: "white"
    readonly property color approveTextColor: "#00FF0A"
    readonly property color warningTextColor: "#F92323"
    readonly property color transparentColor: "transparent"
    readonly property color grey: "#C4C4C4"
    readonly property color activeSwitchColor: "#189E1E"
    readonly property color winColor: "#00FF0A"
}
