import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import "../Components"
import "../Singletons"

ColoredButton {
    id: root
    property bool isEndorsed
    property alias task: task.text

    background: Rectangle {
        color: Colors.secondaryColorWithOpacity
        border.width: 1
        border.color: Colors.white
    }

    RowLayout {
        anchors {
            fill: parent
            leftMargin: 20
            rightMargin: 20
        }

        DescriptionText {
            id: task
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            font: Fonts.nunitoSans(11)
        }

        Item {
            Layout.fillWidth: true
        }

        Image {
            Layout.alignment: Qt.AlignVCenter
            sourceSize: Qt.size(30, 30)
            source: "qrc:/images/assets/icons/respect_icon.png"
            visible: root.isEndorsed
        }
    }

}
