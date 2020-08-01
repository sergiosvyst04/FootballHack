import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../Components"
import "../Singletons"
import LocationsModel 1.0

BasePage {
    bgImage: "qrc:/images/assets/icons/ProfilePageBG.jpg"
    nextButtonVisible: true
    nextButtonText: qsTr("Save")

    LocationsModel {
        id: countriesModel

        Component.onCompleted: getCountries()
    }

    LocationsModel {
        id: citiesModel
    }


    Flickable {
        id: scrollView
        anchors {
            fill: parent
            leftMargin: 20
            rightMargin: 20
            bottomMargin: 25
        }
        boundsBehavior: Flickable.StopAtBounds
        contentHeight: column.height
        contentWidth: column.width
        clip: true
        ColumnLayout {
            id: column
            width: scrollView.width
            spacing: 20

            DescriptionText {
                Layout.alignment: Qt.AlignHCenter
                font: Fonts.nunitoSans(30)
                text: qsTr("Settings")
            }


            RowLayout {
                Layout.fillWidth: true
                spacing: 30
                ColumnLayout {
                    DescriptionText {
                        Layout.alignment: Qt.AlignLeft
                        text: qsTr("Avatar")
                        font: Fonts.nunitoSans(11)
                    }

                    Image {
                        id: avatartImage
                        Layout.preferredHeight: 80
                        Layout.preferredWidth: 80
                        source: "qrc:/images/assets/icons/Avatar.png"
                    }
                }

                ColoredButton {
                    id: removeavatartImageBtn
                    Layout.preferredHeight: 25
                    Layout.preferredWidth: 25

                    back.radius: 13
                    visible: avatartImage.status !== Image.Null

                    font: Fonts.nunitoSansBold(10)
                    fontColor: Colors.bgColor
                    text: qsTr("X")
                    onClicked: avatartImage.source = ""
                }

                Item {
                    Layout.fillWidth: true
                }

                ColoredButton {
                    id: downloadEmblemButton
                    Layout.alignment: Qt.AlignRight
                    Layout.preferredHeight: 40
                    Layout.preferredWidth: 80

                    back.color: Colors.transparentColor
                    back.border.width: 1
                    back.border.color: Colors.white

                    text: qsTr("Download")
                    fontColor: Colors.white
                    font: Fonts.nunitoSansBold(9)

                    onClicked: {
                        dialog.isForEmblem = true
                        dialog.open()
                    }
                }
            }

            LabeledTextEdit {
                id: nicNameField
                Layout.topMargin: 30
                Layout.fillWidth: true
                label: qsTr("Nic name")
            }

            LabeledTextEdit {
                id: fullNameField
                Layout.fillWidth: true
                label: qsTr("Full Name")
            }

            LabeledTextEdit {
                id: emailField
                Layout.fillWidth: true
                label: qsTr("Email")
                validator: Utils.validateEmail
                stackIndex: 0
            }

            ColumnLayout {
                DescriptionText {
                    Layout.alignment: Qt.AlignLeft
                    text: qsTr("Country residence")
                    font: Fonts.nunitoSans(11)
                }

                LocationCombobox {
                    id: countryComboBox
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    currentIndex: -1
                    model: countriesModel

                    onActivated: {
                        currentIndex = index
                        cityComboBox.enabled = true
                        citiesModel.getCities(countryComboBox.textAt(countryComboBox.currentIndex))
                    }

                }
            }

            ColumnLayout {
                DescriptionText {
                    Layout.alignment: Qt.AlignLeft
                    text: qsTr("City residence")
                    font: Fonts.nunitoSans(11)
                }

                LocationCombobox {
                    id: cityComboBox
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    currentIndex: -1
                    model: citiesModel
                    enabled: false
                }
            }

            PopupActivationButton {
                id: birthButton
                Layout.fillWidth: true
                labelText: qsTr("Date of birth")
                fieldText: birthTumbler.date

                popupContentItem: BirthTumbler {
                    id: birthTumbler
                    onClose: {
                        birthButton.popupItem.close()
                    }
                }

            }

            ColumnLayout {

                DescriptionText {
                    Layout.alignment: Qt.AlignLeft
                    text: qsTr("Weight (kg)")
                    font: Fonts.nunitoSans(11)
                }

                SpinBox {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    from: 20
                    to: 120
                    value: 60

                    background: Rectangle {
                        color: Colors.secondaryColor
                    }
                }

            }

            ColumnLayout {

                DescriptionText {
                    Layout.alignment: Qt.AlignLeft
                    text: qsTr("Working leg")
                    font: Fonts.nunitoSans(11)
                }

                LocationCombobox {
                    id: workingLegComboBox
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50

                    model: ["Right", "Left"]
                    currentIndex: -1
                    popup.height: 120
                }
            }

            ColumnLayout {
                id: footballPosition

                DescriptionText {
                    Layout.alignment: Qt.AlignLeft
                    text: qsTr("Position")
                    font: Fonts.nunitoSans(11)
                }

                ColoredButton {
                    id: footballPositionsButton
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    color: Colors.secondaryColor
                    contentItem: Text {
                        leftPadding: 15
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignLeft
                        font: Fonts.nunitoSans(12)
                        text: parent.text
                        color: Colors.white
                    }

                    onClicked:  {
                        positionsPopup.active = true
                    }


                }
            }


            Item {
                Layout.fillHeight: true
            }
        }
    }

    Loader {
        id: positionsPopup
        active: false
        property bool isFootballPositions
        property var checkedPositions: []

        sourceComponent: PositionsPopup {
            title: qsTr("Your preferred positions")
            onOkClicked: {
                positionsPopup.active = false
                footballPositionsButton.text = positionsPopup.checkedPositions.join(" ")
            }
        }
    }
}
