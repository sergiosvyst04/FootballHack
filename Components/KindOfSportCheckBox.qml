import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import "../Components"
import "../Singletons"

CheckBox {
    id: root
    property alias indicatorItem: indicatorRect

    indicator: Rectangle {
        id: indicatorRect
        width: 25
        height: width
        radius: 15
        color: Colors.secondaryColorWithOpacity

        Rectangle {
            anchors.centerIn: parent
            width: 10
            height: 10
            radius: 5
            color: Colors.white
            visible: root.checked
        }
    }

    contentItem: Text {
        leftPadding: 50
        font: Fonts.nunitoSansDemiBold(13)
        color: Colors.white
        text: root.text
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
    }
}
