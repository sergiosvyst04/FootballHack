import QtQuick 2.0
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../Singletons"

ColoredButton {
    color: Colors.transparentColor


    RowLayout {
        anchors.verticalCenter: parent.verticalCenter
        spacing: 15
        Rectangle {
            Layout.preferredHeight: 30
            Layout.preferredWidth: 30
            radius: 15
            color: Colors.transparentColor
            border.width: 1
            border.color: Colors.white

            DescriptionText {
                anchors.centerIn: parent
                text: qsTr("+")
            }
        }

        DescriptionText {
            text: qsTr("Add team")
            font: Fonts.nunitoSansDemiBold(12)
        }
    }
}
