import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import "../Singletons"
import "../Components"

BasePage {
    bgImage: "qrc:/images/assets/icons/CalenddarBG.jpg"
    nextButtonVisible: false

    ColumnLayout {
        anchors {
            fill: parent
            topMargin: 20
            bottomMargin: 100
        }

        DescriptionText {
            Layout.alignment: Qt.AlignHCenter
            text: qsTr("Calendar")
            font: Fonts.nunitoSans(30)
        }

        DescriptionText {
            Layout.alignment: Qt.AlignHCenter
            text: qsTr("FC Perfectial")
            font: Fonts.nunitoSans(18)
        }

        EventsCalendar {
            id: eventsCalendar
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.topMargin: 30

            onPressAndHold: {
                eventPopup.active = true
            }
        }
    }

    Loader {
        id: eventPopup
        active: false

        sourceComponent: Popup {
            visible: true
            modal: true
            parent: Overlay.overlay
            anchors.centerIn: parent

            width: 250
            height: 450

            background: Rectangle {
                anchors.fill: parent
                color: Colors.secondaryColor
            }

            contentItem: ColumnLayout {
                anchors {
                    fill: parent
                    margins: 15
                }
                spacing: 25

                DescriptionText {
                    Layout.preferredWidth: parent.width
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    font: Fonts.nunitoSans(12)
                    text: qsTr("Set event")
                }

                ButtonGroup {
                    id: btnGroup

                    exclusive: true
                    buttons: eventsColumn.children
                }

                ColumnLayout {
                    id: eventsColumn
                    spacing: 20

                    KindOfSportCheckBox {
                        id: trainingCheckBox
                        Layout.fillWidth: true
                        text: qsTr("Training")
                        checked: false
                        indicatorItem.color: Colors.bgColor
                    }

                    KindOfSportCheckBox {
                        id: gameCheckBox
                        Layout.fillWidth: true
                        text: qsTr("Game")
                        checked: false
                        indicatorItem.color: Colors.bgColor
                    }
                }

                ColumnLayout {
                    visible: gameCheckBox.checked

                    DescriptionText {
                        font: Fonts.nunitoSans(12)
                        text: qsTr("Event name")
                    }

                    TextField {
                        id: nameTextField
                        Layout.fillWidth: true
                        Layout.preferredHeight: 40
                        color: Colors.white


                        background: Rectangle {
                            anchors.fill: parent
                            color: Colors.bgColor
                            opacity: 0.6
                        }
                    }
                }


                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 100
                    DescriptionText {
                        font: Fonts.nunitoSans(12)
                        text: qsTr("Time")
                    }

                    RowLayout {
                        Layout.alignment: Qt.AlignHCenter

                        Item {
                            Layout.fillWidth: true
                        }

                        Tumbler {
                            id: hoursTumbler
                            model: 24
                            visibleItemCount: 3
                            Layout.preferredHeight: 116
                            spacing: 15

                            delegate: DescriptionText {
                                opacity: PathView.isCurrentItem ? 1 : 0.5
                                text: modelData < 10 ? "0" + modelData : modelData
                                font: Fonts.nunitoSansBold(14)
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }

                            TumblerSeparator {
                                width: parent.width;
                                anchors {
                                    top: parent.top
                                    topMargin: 35
                                }
                            }
                            TumblerSeparator {
                                width: parent.width;
                                anchors {
                                    bottom: parent.bottom
                                    bottomMargin: 35
                                }
                            }
                        }

                        DescriptionText {
                           Layout.alignment: Qt.AlignVCenter
                            text: qsTr(":")
                            font: Fonts.nunitoSans(30)
                        }

                        Tumbler {
                            id: minutesTumbler
                            model: 60
                            visibleItemCount: 3
                            Layout.preferredHeight: 116
                            delegate: DescriptionText {
                                opacity: PathView.isCurrentItem ? 1 : 0.5
                                text: modelData < 10 ? "0" + modelData : modelData
                                font: Fonts.nunitoSansBold(14)
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                            TumblerSeparator {
                                width: parent.width;
                                anchors {
                                    top: parent.top
                                    topMargin: 35
                                }
                            }
                            TumblerSeparator {
                                width: parent.width;
                                anchors {
                                    bottom: parent.bottom
                                    bottomMargin: 35
                                }
                            }
                        }

                        Item {
                            Layout.fillWidth: true
                        }
                    }

                }

                ColoredButton {
                    Layout.alignment: Qt.AlignHCenter
                    Layout.preferredHeight: 40
                    Layout.preferredWidth: 80
                    color: Colors.transparentColor
                    font: Fonts.nunitoSansBold(20)
                    fontColor: Colors.white
                    text: qsTr("Ok")
                    opacity: enabled ? 1 : 0.5

                    enabled: btnGroup.checkState === Qt.PartiallyChecked

                    onClicked: {
                        eventPopup.active = false
                        if(gameCheckBox.checked) {
                            eventsCalendar.selectedDates.push({isTraining: false, name: nameTextField.text})
                        }
                        else {
                            eventsCalendar.selectedDates.push({isTraining: true, name: "Training"})
                        }

                        console.log("time : ", hoursTumbler.currentIndex, " : ", minutesTumbler.currentIndex, ", isTraining : ", trainingCheckBox.checked, "name : ", nameTextField.text)
                    }
                }
            }

        }


    }
}
