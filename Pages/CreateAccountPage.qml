import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import "../Components"
import "../Singletons"

BasePage {
    bgImage: "qrc:/images/assets/icons/bright1.jpg"
    nextButtonVisible: true
    nextButtonText: qsTr("Next")
    nextButtonEnabled: nicNameField.text.length > 2 && fullNameField.validated && emailField.validated && passwordField.validated
    onNextButtonClicked: navigateToItem("qrc:/Pages/CreateAccountNextPage.qml"
                                        ,{ payload : {nic: nicNameField.text, fullName: fullNameField.text, email: emailField.text, password: passwordField.text} })


    ColumnLayout {
        anchors {
            fill: parent
            topMargin: 30
            leftMargin: 18
            rightMargin: 18
        }

        DescriptionText {
            Layout.alignment: Qt.AlignHCenter
            text: qsTr("Create Account")
            font: Fonts.nunitoSans(30)
            color: Colors.white
        }

        LabeledTextEdit {
            id: nicNameField
            Layout.fillWidth: true
            Layout.topMargin: 35
            label: qsTr("Nic name")
        }

        LabeledTextEdit {
            id: fullNameField
            Layout.fillWidth: true
            label: qsTr("Full Name")
            warningText: qsTr("Use at least 3 characters")
            validated: fullNameField.text.length > 2
        }

        LabeledTextEdit {
            id: emailField
            Layout.fillWidth: true
            label: qsTr("Email")
            validator: Utils.validateEmail
            approveText: qsTr("Looks great!")
            warningText: qsTr("please enter a valid email (e.g johndoe@gmail.com)")
            stackIndex: 0
        }

        LabeledTextEdit {
            id: passwordField
            Layout.fillWidth: true

            label: qsTr("Password")
            validator: Utils.validatePassword
            usePasswordMask: true
            approveText: qsTr("Excellent")
            warningText: qsTr("Use at least 8 characters")
            stackIndex: 0
        }

        Item {
            Layout.fillHeight: true
        }
    }

}
