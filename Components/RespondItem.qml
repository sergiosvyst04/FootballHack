import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.13
import "../Singletons"
import "../Components"

ColumnLayout {
    id: root

    property alias ava: avatar.source
    property alias name: name.text
    property alias respond: respond.text
    property alias advantages: advantages.text
    property alias disadvantages: disAdvantages.text

    spacing: 8


     RowLayout {
         spacing: 25
         Image {
             id: avatar
             Layout.alignment: Qt.AlignVCenter
             sourceSize: Qt.size(40, 40)

             layer.enabled: true
             layer.effect: OpacityMask {
                 maskSource: Item {
                     width: avatar.width
                     height: avatar.height
                     Rectangle {
                         anchors.centerIn: parent
                         width: avatar.adapt ? avatar.width : Math.min(avatar.width, avatar.height)
                         height: avatar.adapt ? avatar.height : width
                         radius: Math.min(width, height)
                     }
                 }
             }
         }

         DescriptionText {
             id: name
             font: Fonts.nunitoSansBold(13)
         }
     }

     DescriptionText {
         id: respond
         Layout.topMargin: 15
         Layout.preferredWidth: parent.width
         font: Fonts.nunitoSans(12)
         wrapMode: Text.WrapAtWordBoundaryOrAnywhere
         horizontalAlignment: Text.AlignLeft
     }

     RowLayout {
         spacing: 20
         Rectangle {
             Layout.preferredHeight: 25
             Layout.preferredWidth: 25
             color: Colors.transparentColor
             border.width: 1
             border.color: Colors.white
             radius: 13

             DescriptionText {
                 anchors.centerIn: parent
                 text: "+"
             }
         }

         DescriptionText {
             font: Fonts.nunitoSans(12)
             text: qsTr("Advantages")
         }
     }

     DescriptionText {
         id: advantages
         Layout.preferredWidth: parent.width
         font: Fonts.nunitoSans(12)
         wrapMode: Text.WrapAtWordBoundaryOrAnywhere
         horizontalAlignment: Text.AlignLeft
     }

     RowLayout {
         spacing: 20
         Rectangle {
             Layout.preferredHeight: 25
             Layout.preferredWidth: 25
             color: Colors.transparentColor
             border.width: 1
             border.color: Colors.white
             radius: 13

             DescriptionText {
                 anchors.centerIn: parent
                 text: "-"
             }
         }

         DescriptionText {
             font: Fonts.nunitoSans(12)
             text: qsTr("Disadvantages")
         }
     }

     DescriptionText {
         id: disAdvantages
         Layout.preferredWidth: parent.width
         font: Fonts.nunitoSans(12)
         wrapMode: Text.WrapAtWordBoundaryOrAnywhere
         horizontalAlignment: Text.AlignLeft
     }

}
