import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../Singletons"
import "../Components"

BasePage {
    bgImage: "qrc:/images/assets/icons/bright1.jpg"
    nextButtonVisible: true
    nextButtonText: qsTr("Create Account")
    onNextButtonClicked: fillTeams()

    property var teams: []

    function fillTeams()
    {
        for(var i = 0; i < youthCareerModel.count; ++i)
            teams.push({name: youthCareerModel.get(i).name, periodOfTime: youthCareerModel.get(i).periodOfTime})

        for(var j = 0; j < seniorCareerModel.count; j++)
            teams.push({name: seniorCareerModel.get(j).name, periodOfTime: seniorCareerModel.get(j).periodOfTime})

        console.log(teams)
    }


//    Component.onCompleted: {
//        console.log("Full name : ", payload.fullName, " , nic : ", payload.nic, " , email : ", payload.email)
//        console.log("country residence : ", payload.countryResidence, ", city residence : ", payload.cityResidence, "date of birth : ", Qt.formatDate(payload.dateOfBirth, "d/M/YYYY"))
//        console.log("football positions : ", payload.footballPositions, "futsalPositions : ", payload.futsalPositions, "working leg : ", payload.workingLeg)
//    }


    ColumnLayout {
        anchors {
            fill: parent
            leftMargin: 15
            rightMargin: 15
            topMargin: 30
        }

        DescriptionText {
            Layout.alignment: Qt.AlignHCenter
            text: qsTr("Biography")
            font: Fonts.nunitoSans(30)
        }

        DescriptionText {
            Layout.alignment: Qt.AlignLeft
            text: qsTr("Youth career")
            font: Fonts.nunitoSansBold(16)
        }

        AddTeamButton {
            id: addYouthTeam
            Layout.alignment: Qt.AlignLeft
            Layout.preferredHeight: 50
            Layout.preferredWidth: 120

            onClicked: {
                addTeamPopup.active = true
                addTeamPopup.isSeniorTeam = false
            }
        }

        ListView {
            id: youthCareerListView
            Layout.fillWidth: true
            Layout.preferredHeight: contentHeight
            model: youthCareerModel

            spacing: 20

            delegate: RowLayout {
                width: parent.width
                DescriptionText {
                    font: Fonts.nunitoSans(14)
                    text: model.name
                }

                Item {
                    Layout.fillWidth: true
                }

                DescriptionText {
                    font: Fonts.nunitoSans(14)
                    text: model.periodOfTime
                }
            }
        }

        DescriptionText {
            Layout.alignment: Qt.AlignLeft
            text: qsTr("Youth career")
            font: Fonts.nunitoSansBold(16)
        }

        AddTeamButton {
            id: addSeniorTeamPopup
            Layout.alignment: Qt.AlignLeft
            Layout.preferredHeight: 50
            Layout.preferredWidth: 120
            Layout.topMargin: 10

            onClicked: {
                addTeamPopup.active = true
                addTeamPopup.isSeniorTeam = true
            }

        }

        ListView {
            id: seniorCareerListView
            Layout.fillWidth: true
            Layout.preferredHeight: contentHeight
            model: seniorCareerModel

            spacing: 20

            delegate: RowLayout {
                width: parent.width
                DescriptionText {
                    font: Fonts.nunitoSans(14)
                    text: model.name
                }

                Item {
                    Layout.fillWidth: true
                }

                DescriptionText {
                    font: Fonts.nunitoSans(14)
                    text: model.periodOfTime
                }
            }
        }

        Item {
            Layout.fillHeight: true
        }
    }

    ListModel {
        id: youthCareerModel
    }

    ListModel {
        id: seniorCareerModel
    }

    Loader {
        id: addTeamPopup
        active: false
        property bool isSeniorTeam

        sourceComponent: Popup {
            anchors.centerIn: parent
            width: 250
            height: 330
            modal: true
            parent: Overlay.overlay
            visible: true

            onAboutToHide: addTeamPopup.active = false

            background: Rectangle {
                color: Colors.secondaryColor
            }

            contentItem: ColumnLayout {
                anchors {
                    fill: parent
                    topMargin: 25
                    leftMargin: 15
                    rightMargin: 15
                    bottomMargin: 35
                }
                spacing: 25

                DescriptionText {
                    Layout.alignment: Qt.AlignHCenter
                    text: qsTr("Adding team")
                    font: Fonts.nunitoSansBold(14)
                }

                DescriptionText {
                    Layout.alignment: Qt.AlignLeft
                    text: qsTr("Team name")
                    font: Fonts.nunitoSans(11)
                }

                TextField {
                    id: teamNameField
                    Layout.fillWidth: true
                    Layout.preferredHeight: 35

                    leftPadding: 15
                    bottomPadding: 0

                    font: Fonts.nunitoSans(12)
                    color: Colors.white
                    background: Rectangle {
                        color: Colors.transparentColor
                        Rectangle {
                            anchors.bottom: parent.bottom
                            width: parent.width
                            height: 1
                            color: Colors.white
                        }
                    }

                }

                DescriptionText {
                    Layout.alignment: Qt.AlignLeft
                    text: qsTr("Period of time")
                    font: Fonts.nunitoSans(11)
                }

                DatesSlider {
                    id: periodOfTimeSlider
                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                    from: addTeamPopup.isSeniorTeam ? payload.dateOfBirth.getFullYear() + 14 : payload.dateOfBirth.getFullYear()
                    to: addTeamPopup.isSeniorTeam ? new Date().getFullYear() : payload.dateOfBirth.getFullYear() + 19
                }

                Item {
                    Layout.fillHeight: true
                }

                ColoredButton {
                    Layout.alignment: Qt.AlignHCenter
                    Layout.preferredHeight: 40
                    Layout.preferredWidth: 80
                    color: Colors.transparentColor
                    text: qsTr("Ok")
                    enabled: teamNameField.text !== ""
                    font: Fonts.nunitoSansBold(20)
                    fontColor: Colors.white

                    opacity: enabled ? 1 : 0.4

                    onClicked: {
                        if(addTeamPopup.isSeniorTeam)
                            seniorCareerModel.append({name: teamNameField.text, periodOfTime:  Math.round(periodOfTimeSlider.first.value) + " - " + Math.round(periodOfTimeSlider.second.value)})
                        else
                            youthCareerModel.append({name: teamNameField.text, periodOfTime: Math.round(periodOfTimeSlider.first.value) + " - " + Math.round(periodOfTimeSlider.second.value) })
                        addTeamPopup.active = false
                    }
                }
            }

        }

    }
}
