// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import "../common"

RowLayout {
    id: labelLabelRow
    property alias text1: label1.text
    property alias text2: label2.text
    property alias barColor: rightBar.color
    // implicite fillWidth = true
    spacing: 20
    LabelBodySecondary {
        id: label1
        leftPadding: 10
        Layout.preferredWidth : 1
        wrapMode: Text.WordWrap
        text: ""
    }
    LabelBody {
        id: label2
        leftPadding: 2
        Layout.preferredWidth: 2
        wrapMode: Text.WordWrap
        text: ""
    }
    Rectangle {
        id: rightBar
        anchors.right: parent.right
        anchors.rightMargin: 6
        Layout.fillWidth: true
        Layout.minimumWidth: 10
        Layout.maximumWidth: 10
        implicitHeight: 40
        color: "Transparent"
    }
} // row layout

