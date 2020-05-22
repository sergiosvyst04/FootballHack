import QtQuick 2.12
import QtQuick.Controls 2.5
import "../Singletons"
import "../Components"


Page {
    property string bgImage
    property string nextButtonText: qsTr("Next")
    property bool nextButtonVisible: false
    property bool nextButtonEnabled: true
    property bool backButtonVisible: backButton.visible

    property var payload: ({})


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
        height: 50
        color: "transparent"

        ColoredButton {
            id: backButton
            anchors {
                left: parent.left
                leftMargin: 10
                verticalCenter: parent.verticalCenter
            }
            visible: rootStackView.depth > 1
            color: "transparent"
            fontColor: Colors.white
            back.border.width: 1
            back.border.color: Colors.white

            height: 30
            width: 50
            text: qsTr("Back")
            onClicked: navigateBack()
        }
    }

    footer: Item {
        height: nextButtonVisible ? 100 : 0
        ColoredButton {
            id: nextButton

            width: 300
            height: 50
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: parent.top
            }

            opacity: enabled ? 1 : 0.3
            visible: nextButtonVisible
            color: "transparent"
            back.border.width: 1
            back.border.color: Colors.white
            enabled: nextButtonEnabled

            font: Fonts.nunitoSans(19, 0)
            fontColor:  Colors.white
            text: nextButtonText


            onClicked: {
                nextButtonClicked();
            }
        }
    }

}
