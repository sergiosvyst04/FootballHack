import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import "../Components"
import "../Singletons"

ColumnLayout {
    id: root
    property alias label: label.text
    property alias placeHolder: textArea.placeholderText
    property alias areaText: textArea.text
    property int textAreaHeight


    DescriptionText {
        id: label
        Layout.alignment: Qt.AlignLeft
        font: Fonts.nunitoSans(12)
    }

    ScrollView {
        id: scrollView
        Layout.fillWidth: true
        Layout.preferredHeight: textAreaHeight
        contentWidth: width
        clip: true
        TextArea {
            id: textArea
            padding: 15
            font: Fonts.nunitoSans(12)
            color: Colors.white
            wrapMode: TextEdit.WrapAtWordBoundaryOrAnywhere

            background: Rectangle {
                anchors.fill: parent
                color: Colors.secondaryColorWithOpacity
            }
        }
    }
}
