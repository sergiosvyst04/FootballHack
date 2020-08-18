import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import "../Components"
import "../Singletons"

ColumnLayout {
    property alias barColor: circle.color
    property var norm
    property var consumed
    property alias nutrient: nutrient.text

    Rectangle {
        id: circle
        Layout.alignment: Qt.AlignHCenter
        Layout.preferredHeight: 90
        Layout.preferredWidth: 90
        radius: 55

        DescriptionText {
            anchors.centerIn: parent
            font: Fonts.nunitoSansBold(14)
            text: "%1/%2".arg(consumed).arg(norm)
        }
    }

    DescriptionText {
        id: nutrient
        Layout.preferredWidth: parent.width
        font: Fonts.nunitoSans(14)
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
    }
}
