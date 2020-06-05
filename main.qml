import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import "Pages"
import "Singletons"

ApplicationWindow {
    visible: true
    width: 350
    height: 780
    title: qsTr("Hello World")


    StackView {
        id: rootStackView
        anchors.fill: parent
        initialItem: Qt.resolvedUrl("qrc:/Pages/SendTaskPage.qml")
        Keys.onBackPressed: {

        }
    }

    ListModel {
        id: playersModel

        ListElement {photo: "qrc:/images/assets/icons/Avatar.png"; name: qsTr("Serhii Svyst") }
        ListElement {name: qsTr("Andrii Diachuk"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Pavlo Snylyk"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Orest Pashkevych"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Pavlo Kozlaniuk"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Sergio Ramos"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Sergio Aguero"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Sergi Roberto"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Pavlo Maldini"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Taras Grytchuk"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Taras Shevchenko"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Andrii Shevchenko"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Sedio Mane"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Mohamad"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Jurii Tsybyk"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Jurii Klop"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Andriano"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Andrii macsca"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Taras Stepanenko"); photo: "qrc:/images/assets/icons/Avatar.png"}
        ListElement {name: qsTr("Taras Taras"); photo: "qrc:/images/assets/icons/Avatar.png"}
    }

    function navigateBack() {
        rootStackView.pop();
    }

    function navigateToFirst() {
        rootStackView.pop(null)
    }

    function replaceItem(itemURL, properties) {
        rootStackView.replace(___maybeResolveUrl(itemURL), properties)
    }

    function replaceView(itemURL) {
        rootStackView.clear();
        navigateToItem(itemURL);
    }

    function navigateToItem(itemURL, properties) {
        rootStackView.push(___maybeResolveUrl(itemURL), properties);
    }

    function __isString(arg) {
        return typeof arg === 'string' || arg instanceof String
    }

    function ___maybeResolveUrl(itemURL){
        if(__isString(itemURL)) {
            return Qt.resolvedUrl(itemURL)
        }
        else {
            return itemURL;
        }
    }
}
