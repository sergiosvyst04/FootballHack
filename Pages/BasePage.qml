import QtQuick 2.12
import QtQuick.Controls 2.12
import "../Singletons"
import "../Components"


Page {
    property string bgImage
    property string nextButtonText: qsTr("Next")
    property bool nextButtonVisible: false


    signal nextButtonClicked()

    background:  Image {
        id: backgroundImage
        source: bgImage

        Rectangle {
            anchors.fill: parent
            color: Colors.bgColor
            opacity: 0.77
        }
    }

    header : Rectangle {
        height: 42

        ColoredButton {
            anchors {
                left: parent.left
                leftMargin: 20
                verticalCenter: parent.verticalCenter
            }
            color: "transparent"
            back.border.width: 1
            back.border.color: Colors.white

            height: 30
            width: 50
            text: qsTr("Back")
        }
    }

    footer: Item {
        height: nextButtonVisible ? 100 : 0
        ColoredButton {
            id: nextButton
            width: 300
            height: 55
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.top
            }

            visible: nextButtonVisible
            color: "transparent"
            back.border.width: 1
            back.border.color: Colors.white

            font: Fonts.nunitoSansDemiBold(22)
            fontColor:  Colors.white
            text: nextButtonText


            onClicked: {
                nextButtonClicked();
            }
        }
    }

}
