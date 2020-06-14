import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.10
import "../Singletons"
import "../Components"

Button {
    id: root
    property alias color: back.color
    property alias fontColor: textItem.color
    property alias back: back

    font: Fonts.nunitoSans(14)
    background: Rectangle {
        id: back
        anchors.fill: parent
        opacity: 0.54
    }

    contentItem: Text {
        id: textItem
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        text: root.text
        font: root.font
    }

}
