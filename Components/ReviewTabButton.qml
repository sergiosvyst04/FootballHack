import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../Components"
import "../Singletons"

TabButton {
    id: root

    contentItem: Text {
        color: Colors.white
        font: parent.checked ? Fonts.nunitoSansDemiBold(10) : Fonts.nunitoSans(10)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: root.text
    }

    background: Rectangle {
        anchors.fill: parent
        color: parent.checked ? Colors.secondaryColorWithOpacity : Colors.transparentColor
        border.width: parent.checked ? 0 : 1
        border.color: Colors.secondaryColorWithOpacity
    }
}
