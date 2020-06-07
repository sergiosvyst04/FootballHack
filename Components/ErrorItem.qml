import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../Components"
import "../Singletons"

ColoredButton {
    id: root
    property alias error: error.text
    property date errorDate
    property alias image: crossOrCheckMarkImage.source

   background: Rectangle {
      color: Colors.secondaryColorWithOpacity
      border.width: 1
      border.color: Colors.white
   }

    RowLayout {
        anchors {
            fill: parent
            leftMargin: 10
        }
        spacing: 0

        DescriptionText {
            id: error
            Layout.preferredWidth: root.width / 2

            horizontalAlignment: Text.AlignLeft
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            font: Fonts.nunitoSans(11)
        }

        Rectangle {
            Layout.preferredWidth: 1
            Layout.fillHeight: true
            color: Colors.white
        }

        ColumnLayout {
            Layout.fillHeight: true
            Layout.topMargin: 10
            Layout.bottomMargin: 15
            spacing: 10

            Image {
                id: crossOrCheckMarkImage
                Layout.alignment: Qt.AlignCenter
                sourceSize: Qt.size(25, 250)
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 1
                color: Colors.white
            }

            DescriptionText {
                id: errorDat
                Layout.alignment: Qt.AlignHCenter
                text: Qt.formatDate(errorDate, "dd/MM/yyyy")
                font: Fonts.nunitoSans(11)
            }
        }
    }
}
