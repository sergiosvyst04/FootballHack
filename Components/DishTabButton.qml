import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../Components"
import "../Singletons"

TabButton {
    id: root
    onCheckedChanged: {
        if(checked)
            activationAnimation.start()
    }

    contentItem: Text {
        color: Colors.white
        font: parent.checked ? Fonts.nunitoSansDemiBold(13) : Fonts.nunitoSans(13)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: root.text
    }

    background: Rectangle {
        id: bg
        anchors.fill: parent
        color: Colors.transparentColor

        Rectangle {
            anchors.bottom: parent.bottom
            height: 2
            color: Colors.white
            visible: checked

            NumberAnimation on width {
                id: activationAnimation
                from: 0
                to: bg.width
                duration: 100
            }
        }
    }
}
