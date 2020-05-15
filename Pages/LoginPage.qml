import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../Singletons"
import "../Components"

BasePage {
bgImage: "qrc:/images/assets/icons/bright1.jpg"
nextButtonVisible: true
nextButtonText: qsTr("Log In")


ColumnLayout {
    anchors{
        fill: parent
        topMargin: 30
        leftMargin: 18
        rightMargin: 18
    }
    spacing: 25

    DescriptionText {
        Layout.alignment: Qt.AlignHCenter
        text: qsTr("Log In")
        font: Fonts.nunitoSans(30)
    }

    LabeledTextEdit {
        Layout.fillWidth: true
        Layout.topMargin: 90
        label: qsTr("Email")
        validator: Utils.validateEmail
        warningText: qsTr("please enter a valid email (e.g johndoe@gmail.com)")
        stackIndex: 0
    }

    LabeledTextEdit {
        Layout.fillWidth: true
        label: qsTr("Password")
        usePasswordMask: true
    }

    Item {
        Layout.fillHeight: true
    }

}
}
