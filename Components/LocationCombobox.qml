import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../Singletons"
import "../Components"

ComboBox {
    id: root
    font: Fonts.nunitoSans(12)


    background: Rectangle {
        anchors.fill: parent
        color: Colors.secondaryColorWithOpacity
    }

    indicator: Item {

    }

    delegate: ColoredButton {
        height: 40
        width: parent.width
        color: index === root.currentIndex ? "lightgrey" : Colors.transparentColor
        contentItem:  DescriptionText {
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            text: modelData
            font: root.font
        }

        Rectangle {
            anchors.bottom: parent.bottom
            width: parent.width
            height: 1
            color: Colors.white
        }
        onClicked: activated(index)

    }

    contentItem: DescriptionText {
        anchors {
            left: parent.left
            leftMargin: 15
        }
        text: root.displayText
        font: root.font
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
    }

    popup: Popup {
        id: popup
        y: root.height +5
        width: root.width
        implicitHeight: 200

        leftPadding: 15
        rightPadding: 10
        bottomPadding: 20

        contentItem: ListView {
            clip: true

            implicitHeight: popup.height
            model: root.popup.visible ? root.delegateModel : null
            currentIndex: root.highlightedIndex
        }

        background: Rectangle {
            color: Colors.secondaryColor
            opacity: 0.9
        }
    }
}
