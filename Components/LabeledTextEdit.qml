import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0
import "../Singletons"
import "../Components"

Column {
    id: root
    spacing: 4
    property alias label: label.text
    property alias text: textField.text
    property bool usePasswordMask: false

    property alias textField: textField
    property alias stackIndex: extraTextStack.currentIndex
    property alias approveText: approvetext.text
    property alias warningText: warningText.text

    property alias validator: textField.validator
    property alias validated: textField.validated
    property alias readOnly: textField.readOnly


    DescriptionText {
        id: label
        font: Fonts.nunitoSans(11)
        height: 16
        opacity: root.enabled ? 1.0 : 0.3
    }

    Column {
        spacing: 7
        width: parent.width

        StyledTextField {
            id: textField
            width: parent.width
            height: 50
            isPassword: usePasswordMask

            onHasNotValidated: {
                extraTextStack.currentIndex = 2
                warningAnim.running = true
            }

            onValidatedChanged: {
                if(validated === true) {
                    extraTextStack.currentIndex = 1
                }
                else {
                    extraTextStack.currentIndex = 0
                }
            }

        }

        StackLayout {
            id: extraTextStack
            height: 15
            width: parent.width
            currentIndex: 0

            Item {

            }

            Item {
                Label {
                    id: approvetext
                    anchors.centerIn: parent
                    color: Colors.approveTextColor
                    width: parent.width
                    font: Fonts.nunitoSans(11)
                    opacity: 0.2

                    NumberAnimation on opacity {
                        to: 1.0
                        duration: 300
                        running: validated
                    }

                    NumberAnimation on width {
                        from: parent.width - 10
                        to: parent.width
                        duration: 150
                        running: validated
                    }
                }
            }

            Item {
                Label {
                    id: warningText
                    anchors.centerIn: parent
                    color: Colors.warningTextColor
                    width: parent.width
                    font: Fonts.nunitoSansBold(11, 0)

                    SequentialAnimation {
                        id: warningAnim

                        NumberAnimation {
                            target: warningText
                            property: "width"
                            from: warningText.width
                            to: warningText.width + 10
                            duration: 100
                        }

                        NumberAnimation {
                            target: warningText
                            property: "width"
                            from: warningText.width + 10
                            to: warningText.width - 10
                            duration: 100
                        }

                        NumberAnimation {
                            target: warningText
                            property: "width"
                            from: warningText.width - 10
                            to: warningText.width
                            duration: 100
                        }
                    }

                }
            }

        }
    }
}
