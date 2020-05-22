import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import "../Components"
import "../Singletons"
import LocationsModel 1.0


BasePage {
    bgImage: "qrc:/images/assets/icons/bright1.jpg"
    nextButtonVisible: true
    nextButtonText: qsTr("Next")
    onNextButtonClicked: navigateToItem("qrc:/Pages/PlayerInfoPage.qml",
                                        { payload : {nic: payload.nic, fullName: payload.fullName, email: payload.email, password: payload.password, countryResidence: countryComboBox.textAt(countryComboBox.currentIndex), cityResidence: cityComboBox.textAt(cityComboBox.currentIndex), dateOfBirth: birthTumbler.dateTime}})


    LocationsModel {
        id: countriesModel

        Component.onCompleted: getCountries()
    }



    LocationsModel {
        id: citiesModel
    }

    ColumnLayout {
        anchors {
            fill: parent
            leftMargin: 18
            rightMargin: 18
            topMargin: 30
        }
        spacing: 35

        DescriptionText {
            Layout.alignment: Qt.AlignHCenter
            text: qsTr("Create Account")
            font: Fonts.nunitoSans(30)
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

        Item {
            Layout.fillHeight: true
        }



    }

}
