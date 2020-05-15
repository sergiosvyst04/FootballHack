import QtQuick 2.0
import QtQuick.Controls 2.12
import "../Singletons"
import "../Components"


Rectangle {
    id: dobTumbler

    radius: 4
    color: Colors.transparentColor

    property string date: ""
    property var dateTime
    signal close

    onDateTimeChanged: console.log("year : ", dateTime.getFullYear())

    onDateChanged: console.log("date changed to : ", date)


    DescriptionText {
        text: qsTr("Date of birth")
        anchors {
            top: parent.top
            topMargin: 26
            left: parent.left
            leftMargin: 21
        }
        color: Colors.white
        font: Fonts.nunitoSansBold(14)
    }

    Item {
        anchors {
            centerIn: parent
        }

        width: 240
        height: 116

        Row {
            id: row
            anchors {
                fill: parent
                bottomMargin: 20
            }
            spacing: 30

            ListModel {
                id: monthModel
                ListElement { name: qsTr("Jan"); fullname: qsTr("January"); days: 31 }
                ListElement { name: qsTr("Feb"); fullname: qsTr("February"); days: 29 }
                ListElement { name: qsTr("Mar"); fullname: qsTr("March"); days: 31 }
                ListElement { name: qsTr("Apr"); fullname: qsTr("April"); days: 30 }
                ListElement { name: qsTr("May"); fullname: qsTr("May"); days: 31 }
                ListElement { name: qsTr("Jun"); fullname: qsTr("June"); days: 30 }
                ListElement { name: qsTr("Jul"); fullname: qsTr("July"); days: 31 }
                ListElement { name: qsTr("Aug"); fullname: qsTr("August"); days: 31 }
                ListElement { name: qsTr("Sep"); fullname: qsTr("September"); days: 30 }
                ListElement { name: qsTr("Oct"); fullname: qsTr("October"); days: 31 }
                ListElement { name: qsTr("Nov"); fullname: qsTr("November"); days: 30 }
                ListElement { name: qsTr("Dec"); fullname: qsTr("December"); days: 31 }
            }

            Tumbler {
                id: month
                model: monthModel
                visibleItemCount: 3
                height: 116

                TumblerSeparator {
                    width: parent.width;
                    anchors {
                        top: parent.top
                        topMargin: 35
                    }
                }
                TumblerSeparator {
                    width: parent.width;
                    anchors {
                        bottom: parent.bottom
                        bottomMargin: 35
                    }
                }

                delegate: DescriptionText {
                    opacity: PathView.isCurrentItem ? 1 : 0.5
                    text: name
                    font: Fonts.nunitoSansBold(14)
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Tumbler {
                id: day

                visibleItemCount: 3
                height: 116
                model: monthModel.get(month.currentIndex).days

                TumblerSeparator {
                    width: parent.width;
                    anchors {
                        top: parent.top
                        topMargin: 35
                    }
                }
                TumblerSeparator {
                    width: parent.width;
                    anchors {
                        bottom: parent.bottom
                        bottomMargin: 35
                    }
                }
                delegate: DescriptionText {
                    opacity: PathView.isCurrentItem ? 1 : 0.5
                    text: index + 1
                    font: Fonts.nunitoSansBold(14)
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Tumbler {
                id: year
                model: 100
                visibleItemCount: 3
                height: 116
                property int currentYear
                Component.onCompleted: {
                    currentYear = new Date().getFullYear()
                }

                TumblerSeparator {
                    width: parent.width;
                    anchors {
                        top: parent.top
                        topMargin: 35
                    }
                }
                TumblerSeparator {
                    width: parent.width;
                    anchors {
                        bottom: parent.bottom
                        bottomMargin: 35
                    }
                }
                delegate: DescriptionText {
                    opacity: PathView.isCurrentItem ? 1 : 0.5
                    text: year.currentYear - index
                    font: Fonts.nunitoSansBold(14)
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

        }
    }

    ColoredButton {
        id: cancelButton
        anchors {
            bottom: parent.bottom
            left: parent.left
        }

        color: Colors.transparentColor
        text: qsTr("Cancel")
        font: Fonts.nunitoSansBold(16)
        fontColor: Colors.warningTextColor
        width: parent.width / 2
        height: 52
        onClicked: close()
    }

    ColoredButton {
        id: okButton
        anchors {
            right: parent.right
            bottom: parent.bottom
        }
        color: Colors.transparentColor

        text: qsTr("Ok")
        font: Fonts.nunitoSansBold(16)
        fontColor: Colors.white
        width: parent.width / 2
        height: 52


        onClicked: {
            var d = new Date();
            d.setFullYear(new Date().getFullYear() - year.currentIndex)
            d.setMonth(month.currentIndex)
            d.setDate(day.currentIndex + 1)
            dateTime = d
            date = Qt.formatDate(d, "d ") + monthModel.get(month.currentIndex).fullname + Qt.formatDate(d, " yyyy")

            close()
        }

    }

    Rectangle {
        height: 1
        width: parent.width
        x: parent.x
        y: okButton.y

        color: Colors.white
    }

    Rectangle {
        height: 52
        width: 1
        anchors.bottom: parent.bottom
        x: okButton.x
        color: Colors.white
    }
}
