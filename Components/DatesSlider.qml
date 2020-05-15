import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../Components"
import "../Singletons"

RangeSlider {
    id: root


    from: 0
    to: 100
    wheelEnabled: true

    first.value: 10
    second.value: 40

    first.handle.height: 20
    first.handle.width: 20

    second.handle.height: 20
    second.handle.width: 20

    DescriptionText {
        id: fromValueText
        anchors {
            horizontalCenter: first.handle.horizontalCenter
            bottom: first.handle.top
            bottomMargin: 12
        }
        font: Fonts.nunitoSans(11)
        text: Math.round(first.value)
    }

    DescriptionText {
        id: toValueText
        anchors {
            horizontalCenter: second.handle.horizontalCenter
            top: second.handle.bottom
            topMargin: 12
        }
        font: Fonts.nunitoSans(11)
        text: Math.round(second.value)
    }

}
