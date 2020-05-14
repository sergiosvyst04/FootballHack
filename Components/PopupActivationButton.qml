import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import "../Singletons"
import "../Components"

ColumnLayout {
    property alias labelText: label.text
    property alias popupContentItem: popup.contentItem
    property alias popupItem: popup
    property alias fieldText: btn.text
    property alias button: btn


    Label {
        id: label
        font.pixelSize: 11
        font.weight: Font.Normal
        font.family: Fonts.__nunitoSans
        font.letterSpacing: 3
        color: Colors.white
        width: parent.width
        height: 18
    }

    ColoredButton {
        id: btn
        Layout.fillWidth: true
        Layout.preferredHeight: 50
        color: Colors.secondaryColor

        contentItem: Text {
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            leftPadding: 15
            text: btn.text
            font: Fonts.nunitoSans(12)
            color: Colors.white
        }



        onClicked: {
            popup.visible = !popup.visible
        }

        Popup {
            id: popup
            background: Rectangle {
                anchors.fill: parent
                color: Colors.secondaryColor
                opacity: 0.8
            }

            y: parent.height + 2
            padding: 0
            width: parent.width
            height: 235
        }


    }
}
