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
        initialItem: Qt.resolvedUrl("qrc:/Pages/OffersPage.qml")
        Keys.onBackPressed: {

        }
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
