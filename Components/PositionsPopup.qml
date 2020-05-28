import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../Components"
import "../Singletons"

Popup {
    property string title
    signal okClicked()

    visible: true
    modal: true
    parent: Overlay.overlay
    anchors.centerIn: parent

    width: 250
    height: positionsPopup.isFootballPositions ? 450 : 350

    background: Rectangle {
        anchors.fill: parent
        color: Colors.secondaryColor
    }

    contentItem: ColumnLayout {
        anchors {
            fill: parent
            margins: 15
        }

        DescriptionText {
            Layout.preferredWidth: parent.width
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            font: Fonts.nunitoSans(12)
            text: title
        }

        ColumnLayout {
            Layout.topMargin: 20

            Repeater {
                id: positionsRepeater
                model: positionsPopup.isFootballPositions ? ["GK", "LD", "CD", "RD", "DMF", "AMF", "RW", "LW", "CF", "Coach"]
                                                          : ["GK", "DEF", "WIN", "FRW", "Coach"]

                delegate: KindOfSportCheckBox {
                    text: modelData
                    indicatorItem.color: Colors.bgColor
                    indicatorItem.opacity: 0.7
                    indicatorItem.width: 20
                    onCheckedChanged:  {
                        if(checked)
                            positionsPopup.checkedPositions.push(text)
                        else {
                            var indexToRemove = positionsPopup.checkedPositions.indexOf(text)
                            positionsPopup.checkedPositions.splice(indexToRemove, 1)
                        }
                    }
                }
            }
        }

        Item {
            Layout.fillHeight: true
        }

        ColoredButton {
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredHeight: 40
            Layout.preferredWidth: 80
            color: Colors.transparentColor
            font: Fonts.nunitoSansBold(20)
            fontColor: Colors.white
            text: qsTr("Ok")
            onClicked: {
                  okClicked()
            }
        }
    }

}
