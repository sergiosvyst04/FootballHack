import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../Components"
import "../Singletons"

BasePage {
    bgImage: "qrc:/images/assets/icons/LifeHacksBG.jpg"
    nextButtonVisible: false

    ColumnLayout {
        anchors {
            fill: parent
            topMargin: 20
            leftMargin: 20
            rightMargin: 20
            bottomMargin: 30
        }
        spacing: 15

        DescriptionText {
            Layout.alignment: Qt.AlignHCenter
            text: qsTr("Life Hacks")
            font: Fonts.nunitoSans(30)
        }

        Item {
            Layout.fillHeight: true
        }

        Repeater {
            model : ListModel {
                ListElement {name: "Nutrition"}
                ListElement {name: "Recovery"}
                ListElement {name: "Injuries"}
                ListElement {name: "Excersises"}
            }

            delegate: ColoredButton {
                Layout.fillWidth: true
                Layout.preferredHeight: 130

                color: Colors.secondaryColorWithOpacity

                text: model.name
                font: Fonts.nunitoSans(22)
                fontColor: Colors.white
            }
        }
    }

}
