import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import "../Singletons"
import "../Components"

ProgressBar {
    id: root


    background: Rectangle {
        anchors.fill: parent
        color: Colors.wateringBarBackgroundColor
        opacity: 0.5
    }

    contentItem: Item {
        Rectangle {
            anchors.bottom: parent.bottom
            width: parent.width
            height: root.visualPosition * parent.height
            color: Colors.wateringBarBackgroundColor

            DescriptionText {
                anchors.centerIn: parent
                font: Fonts.nunitoSans(12)
                text: root.value * 100 + "%"
            }
        }
    }
}
