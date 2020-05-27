import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../Singletons"
import "../Components"

RowLayout {
    id: root

    property alias years: periodOfTime.text
    property alias team: team.text
    property int fontSize

    DescriptionText {
        id: team
        font: Fonts.nunitoSans(fontSize)
    }

    Item {
        Layout.fillWidth: true
    }

    DescriptionText {
        id: periodOfTime
        font: Fonts.nunitoSans(fontSize)
        horizontalAlignment: Text.AlignLeft
    }


}
