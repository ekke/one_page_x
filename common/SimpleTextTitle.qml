// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.6
import QtQuick.Layouts 1.3
import Qt.labs.controls 1.0
import Qt.labs.controls.material 1.0

ToolBar {
    id: titleToolBar
    property alias text: titleLabel.text

    RowLayout {
        focus: false
        spacing: 6
        anchors.fill: parent
        LabelTitle {
            id: titleLabel
            text: "ekke"
            leftPadding: 16
            elide: Label.ElideRight
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
            color: textOnPrimary
        }
        ToolButton {
            Image {
                id: buttonImage
                anchors.centerIn: parent
                source: "qrc:/images/"+iconOnPrimaryFolder+"/more_vert.png"
            }
            onClicked: {
                console.log("will OPEN popup")
                optionsMenu.open()
            }
            Menu {
                id: optionsMenu
                x: parent.width - width
                transformOrigin: Menu.TopRight
                MenuItem {
                    text: "Something"
                    // onTriggered: //
                }
                MenuItem {
                    text: "Something else"
                    // onTriggered: //
                }
            } // end optionsMenu
        } // end ToolButton
    } // end RowLayout
} // end ToolBar


