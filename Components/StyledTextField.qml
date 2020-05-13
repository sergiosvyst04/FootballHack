import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.12
import "../Singletons"

TextField {
    id: control
    property bool isPassword: false
    property var validator: undefined
    property bool validated: validator === undefined
    property bool __firstFocused: false


    signal hasNotValidated()

    onFocusChanged: {
        if(!focus && !textField.validated && text.length > 0)
            hasNotValidated()
    }

    Material.accent: "red"

    leftPadding: 20
    font: Fonts.nunitoSans(12)
    color: Colors.white
    width: parent.width
    height: 30
    echoMode: isPassword ? TextInput.Password : TextInput.Normal
    passwordMaskDelay: 100
    passwordCharacter: "*"

    background:  Rectangle {
       anchors.fill: parent
        color: Colors.secondaryColorWithOpacity
    }

    onTextChanged:  {
        if(validator !== undefined) {
            validated = validator(text);
        }
    }

    Item {
        id: iconsStack
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 10
        width: 20
        height: 20

        Image {
            visible: extraTextStack.currentIndex === 2
            source: "qrc:/images/assets/icons/519791-101_Warning-512.png"
            sourceSize: Qt.size(26, 23)
            anchors.centerIn: parent
        }

        Image {
           id: passwordIcon
           anchors.centerIn: parent
           visible: isPassword && extraTextStack.currentIndex !== 2
           source: control.echoMode === TextInput.Password ? "qrc:/images/assets/icons/password__preview.png" : "qrc:/images/assets/icons/password_preview_off.png"
           MouseArea {
               anchors.fill: parent
               onClicked: {
                   control.echoMode = control.echoMode === TextInput.Password ? TextInput.Normal : TextInput.Password
               }
           }
        }
    }


}
