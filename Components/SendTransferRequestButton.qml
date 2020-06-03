import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.12
import "../Singletons"
import "../Components"

Button {
    id: root
    property alias color: back.color
    checkable: true


    background: Rectangle {
        id: back
        radius: parent.height / 2
        Component.onCompleted: console.log("bg color : " ,color)
    }

    contentItem: Text {
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        wrapMode: Text.WordWrap

        font: root.font
        text: root.text
        color: Colors.bgColor
    }

    layer.enabled: true
    layer.effect: DropShadow {
        color: root.color
        radius: 14
    }
}
