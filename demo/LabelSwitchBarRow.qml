// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import "../common"

RowLayout {
    id: labelSwitchRow
    property alias text: theLabel.text
    property alias switchText: label2.text
    property alias checked: theSwitch.checked
    property alias barColor: rightBar.color
    // implicite fillWidth = true
    spacing: 20
    LabelBodySecondary {
        id: theLabel
        leftPadding: 10
        Layout.preferredWidth : 2
        text: ""
        wrapMode: Text.WordWrap
    }
    // without the Pane Switch would be horzontally centered
    // don't use a Rectangle because rectangle has wrong background
    Pane {
        bottomPadding: 0
        leftPadding: 0
        Layout.preferredWidth: 1
        Layout.fillWidth: true
        Switch {
            id: theSwitch
            topPadding: 0
            leftPadding: 0
            anchors.top: parent.top
            checked: false
        }
    }
    LabelBody {
        id: label2
        leftPadding: 2
        Layout.preferredWidth: 3
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
