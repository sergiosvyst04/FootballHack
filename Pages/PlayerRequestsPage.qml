import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import "../Components"
import "../Singletons"

BasePage {
    bgImage: "qrc:/images/assets/icons/OffersPageBG.jpg"


    ColumnLayout {
        anchors {
            fill: parent
            leftMargin: 35
            rightMargin: 35
            bottomMargin: 50
        }

        spacing: 30

        DescriptionText {
            Layout.alignment: Qt.AlignHCenter
            text: qsTr("Requests")
            font: Fonts.nunitoSans(30)
        }

        TabBar {
            id: requestsTabBar
            Layout.fillWidth: true
            Layout.preferredHeight: 50

            currentIndex: requestsSwipeView.currentIndex

            spacing: 0
            background:  Rectangle {
                color: Colors.transparentColor
            }

            ReviewTabButton {
                text: qsTr("Incoming")
                height: 50
            }

            ReviewTabButton {
                text: qsTr("Outcoming")
                height: 50
            }
        }


        SwipeView {
            id: requestsSwipeView
            Layout.fillHeight: true
            Layout.fillWidth: true
            clip: true

            onCurrentIndexChanged: requestsTabBar.currentIndex = currentIndex

            ListView {
                id: inComingRequestsListView

                clip: true
                spacing: 30
                model: incomingRequestsModel

                delegate: IncomingRequestDelegate {
                    isIncoming: true
                    width: parent.width
                    height: 140

                    team: model.team
                    logo: model.logo
                }

            }


            ListView {
                id: outComingRequestsListView

                clip: true
                spacing: 30
                model: outComingRequestsModel

                delegate: IncomingRequestDelegate {

                    isIncoming: false
                    width: parent.width
                    height: 140
                    team: model.team
                    logo: model.logo
                    state: model.state


                    color: model.state === 1 ? Colors.winColor : model.state === 2 ? Colors.warningTextColor : Colors.secondaryColor
                }
            }
        }
    }

    ListModel {
        id: incomingRequestsModel

        ListElement {team: "FC Perfectial"; logo: "qrc:/images/assets/icons/PerfectialLogo.png"}
        ListElement {team: "FC Liverpool"; logo: "qrc:/images/assets/icons/LiverpoolLogo.png"}
        ListElement {team: "FC Barcelona"; logo: "qrc:/images/assets/icons/BarcelonaLogo.png"}
    }

    ListModel {
        id: outComingRequestsModel

        ListElement {team: "FC Perfectial"; logo: "qrc:/images/assets/icons/PerfectialLogo.png"; state: 0}
        ListElement {team: "FC Liverpool"; logo: "qrc:/images/assets/icons/LiverpoolLogo.png"; state: 1}
        ListElement {team: "FC Barcelona"; logo: "qrc:/images/assets/icons/BarcelonaLogo.png"; state: 2}
    }

}
