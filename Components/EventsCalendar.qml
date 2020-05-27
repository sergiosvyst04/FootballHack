import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.10
import "../Singletons"
import "../Components"

Calendar {
    id: root
    minimumDate: new Date()
    locale: Qt.locale("en_AU")
    frameVisible: false
    property var selectedDates: []

    onSelectedDatesChanged: console.log("selected dates changed to : ", selectedDates)


    style: CalendarStyle {
        gridVisible: true

        background: Rectangle {
            color: Colors.secondaryColorWithOpacity
        }

        dayDelegate: Rectangle {
            color: Colors.transparentColor
            Label {
                anchors {
                    top: parent.top
                    left: parent.left
                    topMargin: 5
                    leftMargin: 5
                }

                text: styleData.date.getDate()
                color: Colors.white
                opacity: styleData.valid ? 1 : 0.6
                font.weight: styleData.visibleMonth ? Font.Medium : Font.ExtraLight
            }
        }

        navigationBar: RowLayout {
            spacing: 30
            height: 35
            width: root.width

            Item {
                Layout.fillWidth: true
            }

            ColoredButton {
                id: subtractMonthButton
                Layout.preferredHeight: 20
                Layout.preferredWidth: 20
                color: Colors.transparentColor
                fontColor: Colors.white
                text: "<"
                onClicked: root.showPreviousMonth()
            }

            DescriptionText {
                font: Fonts.nunitoSans(14)
                text: styleData.title
            }

            ColoredButton {
                id: addMonthButton
                Layout.preferredHeight: 20
                Layout.preferredWidth: 20
                color: Colors.transparentColor
                fontColor: Colors.white
                text: ">"
                onClicked: root.showNextMonth()
            }

            Item {
                Layout.fillWidth: true
            }
        }

        dayOfWeekDelegate:  Rectangle {
            height: 50
            color: Colors.transparentColor



            DescriptionText {
                anchors.centerIn: parent
                font: Fonts.nunitoSansBold(11)
                text: {
                    switch(styleData.dayOfWeek) {
                    case 0:
                        return "Sun";
                    case 1:
                        return "Mon"
                    case 2:
                        return "Tue"
                    case 3:
                        return "Wed";
                    case 4:
                        return "Thu";
                    case 5:
                        return "Fri";
                    case 6:
                        return "Sat";
                    }
                }
            }
        }
    }
}
