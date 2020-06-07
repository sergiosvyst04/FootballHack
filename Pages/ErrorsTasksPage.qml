import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../Singletons"
import "../Components"

BasePage {
    bgImage: "qrc:/images/assets/icons/ProfilePageBG.jpg"

    ColumnLayout {
        anchors {
            fill: parent
        }
        spacing: 35

        TabBar {
            id: tabBar
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: parent.width - 60
            Layout.preferredHeight: 50

            spacing: 0
            background: Rectangle {
                color: Colors.transparentColor
            }

            ReviewTabButton {
                text: qsTr("Errors")
                height: 50
            }

            ReviewTabButton {
                text: qsTr("Tasks")
                height: 50
            }
        }

        SwipeView {
            id: swipeView
            Layout.fillHeight: true
            Layout.fillWidth: true

            currentIndex: tabBar.currentIndex
            onCurrentIndexChanged: tabBar.currentIndex = currentIndex

            ListView {
                id: errorsListView
                Layout.fillWidth: true
                Layout.fillHeight: true
                spacing: 25

                delegate: ErrorItem {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width - 60
                    height: 90
                    error: model.error
                    errorDate: new Date()
                    image: model.isCorrected ? "qrc:/images/assets/icons/apply.png" : "qrc:/images/assets/icons/red_cross.png"
                }

                model: ListModel {
                    ListElement {error: "error 1"; isCorrected: false}
                    ListElement {error: "error 2"; isCorrected: false}
                    ListElement {error: "error 3"; isCorrected: true}
                    ListElement {error: "Playing too widely. You let winger to go between defenders "; isCorrected: false}
                    ListElement {error: "error 5"; isCorrected: false}
                    ListElement {error: "error 6"; isCorrected: true}
                    ListElement {error: "error 6"; isCorrected: true}
                }
            }

            ListView {
                id: tasksListView
                Layout.fillWidth: true
                Layout.fillHeight: true
                spacing: 0

                delegate: TaskDelegate {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width - 60
                    height: 65

                    task: model.task
                    isEndorsed: model.isEndorsed
                }

                model: ListModel {
                    ListElement{task: "task 1"; isEndorsed: false}
                    ListElement{task: "task 2"; isEndorsed: true}
                    ListElement{task: "task 3"; isEndorsed: false}
                    ListElement{task: "task 4"; isEndorsed: false}
                    ListElement{task: "task 5"; isEndorsed: true}
                    ListElement{task: "task 6"; isEndorsed: false}
                    ListElement{task: "task 7"; isEndorsed: false}
                    ListElement{task: "task 8"; isEndorsed: false}
                    ListElement{task: "task 9"; isEndorsed: true}
                    ListElement{task: "task 10"; isEndorsed: false}
                    ListElement{task: "task 11"; isEndorsed: true}
                }
            }


        }
    }
}
