import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../Components"
import "../Singletons"

BasePage {
    bgImage: "qrc:/images/assets/icons/OffersPageBG.jpg"

    ColumnLayout {
        anchors {
            fill: parent
            leftMargin: 20
            rightMargin: 20
            topMargin: 20
            bottomMargin: 30
        }
        spacing: 30

        DescriptionText {
            Layout.alignment: Qt.AlignHCenter
            text: qsTr("Offers")
            font: Fonts.nunitoSans(30)
        }

        ListView {
            id: offersListView
            Layout.fillHeight: true
            Layout.fillWidth: true

            spacing: 20
            clip: true

            model: offersModel

            delegate: OfferItem {
                height: 140
                width: parent.width

                name: model.teamName
                position: model.position
                age: model.age
                logo: model.logo
                onDetailsClicked: navigateToItem("qrc:/Pages/OfferDetailsPage.qml", {name: name, position: position, age: age, logo: model.logo,
                                                     kind: model.kind, comment: model.comment, leg: model.leg, city: model.city})
            }
        }
    }


    ListModel {
        id: offersModel
        ListElement {teamName: "FC Perfectial"; position: "F"; age: "26-32"; logo: "qrc:/images/assets/icons/PerfectialLogo.png"; comment: "We want to get a player who is 100% professional. You mustn’t skip trainings and games. And the last one - you must be IT employer. You must be best in your ddeal, score at least 15 goals every season and go on every training, not drinking, not smoking, cmalksnmclkanslcknsalkcnalsknclkansc salkcnaslkcn asc aslkcnlsakc slkcnaslkcn"; city: "Lviv"; kind: "Futsal"; leg: "Left"}
        ListElement {teamName: "FC Liverpool"; position: "RD"; age: "22-24"; logo: "qrc:/images/assets/icons/LiverpoolLogo.png"; comment: "We want to get a player who is 100% professional. You mustn’t skip trainings and games. And the last one - you must be IT employer."; city: "Lviv"; kind: "Football"; leg: "Right"}
        ListElement {teamName: "FC Barcelona"; position: "CD"; age: "26-29"; logo: "qrc:/images/assets/icons/BarcelonaLogo.png"; comment: "We want to get a player who is 100% professional. You mustn’t skip trainings and games. And the last one - you must be IT employer."; city: "Barca"; kind: "Football"; leg: "Right"}
        ListElement {teamName: "FC Corevalue"; position: "F"; age: "25-27"; logo: "qrc:/images/assets/icons/CoreLogo.png"; comment: "We want to get a player who is 100% professional. You mustn’t skip trainings and games. And the last one - you must be IT employer."; city: "Lviv"; kind: "Futsal"; leg: "Left"}
    }

}
