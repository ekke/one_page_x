// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import "../common"

RowLayout {
    id: labelCheckRow
    property alias text: theLabel.text
    property alias switchText: theCheckBox.text
    property alias checked: theCheckBox.checked
    property alias barColor: rightBar.color
    // implicite fillWidth = true
    spacing: 20
    LabelBodySecondary {
        id: theLabel
        leftPadding: 10
        Layout.preferredWidth : 1
        text: ""
        wrapMode: Label.WordWrap
    }
    // without the Pane Switch would be horzontally centered
    // don't use a Rectangle because rectangle has wrong background
    Pane {
        bottomPadding: 0
        leftPadding: 0
        Layout.preferredWidth: 2
        Layout.fillWidth: true
        CheckBox {
            id: theCheckBox
            topPadding: 0
            leftPadding: 0
            anchors.top: parent.top
            checked: false
        }
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
