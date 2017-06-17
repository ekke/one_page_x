// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
import QtGraphicalEffects 1.0
import "common"
import "demo"

// This app demonstrates HowTo use Qt 5.8 new Qt Quick Controls 2, High DPI and more
// This app is NOT a production ready app
// This app's goal is only to help you to understand some concepts
// see blog http://j.mp/qt-x to learn about Qt 5.7 for Material - styled Android or iOS Apps
// learn about this one_page_x app from this article: http://j.mp/qt-one-page-x
// ekke (Ekkehard gentz) @ekkescorner

ApplicationWindow {
    id: appWindow
    // visibile must set to true - default is false
    visible: true
    // primary and accent properties:
    property variant primaryPalette: myApp.defaultPrimaryPalette()
    property color primaryLightColor: primaryPalette[0]
    property color primaryColor: primaryPalette[1]
    property color primaryDarkColor: primaryPalette[2]
    property color textOnPrimaryLight: primaryPalette[3]
    property color textOnPrimary: primaryPalette[4]
    property color textOnPrimaryDark: primaryPalette[5]
    property string iconOnPrimaryLightFolder: primaryPalette[6]
    property string iconOnPrimaryFolder: primaryPalette[7]
    property string iconOnPrimaryDarkFolder: primaryPalette[8]
    property variant accentPalette: myApp.defaultAccentPalette()
    property color accentColor: accentPalette[0]
    property color textOnAccent: accentPalette[1]
    property string iconOnAccentFolder: accentPalette[2]
    Material.primary: primaryColor
    Material.accent: accentColor
    // theme Dark vs Light properties:
    property variant themePalette: myApp.defaultThemePalette()
    property color dividerColor: themePalette[0]
    property color cardAndDialogBackground: themePalette[1]
    property real primaryTextOpacity: themePalette[2]
    property real secondaryTextOpacity: themePalette[3]
    property real dividerOpacity: themePalette[4]
    property real iconActiveOpacity: themePalette[5]
    property real iconInactiveOpacity: themePalette[6]
    property string iconFolder: themePalette[7]
    property int isDarkTheme: themePalette[8]
     // Material.dropShadowColor  OK for Light, but too dark for dark theme
    property color dropShadow: isDarkTheme? "#E4E4E4" : Material.dropShadowColor
    onIsDarkThemeChanged: {
        if(isDarkTheme == 1) {
            Material.theme = Material.Dark
        } else {
            Material.theme = Material.Light
        }
    }
    // font sizes - defaults from Google Material Design Guide
    property int fontSizeDisplay4: 112
    property int fontSizeDisplay3: 56
    property int fontSizeDisplay2: 45
    property int fontSizeDisplay1: 34
    property int fontSizeHeadline: 24
    property int fontSizeTitle: 20
    property int fontSizeSubheading: 16
    property int fontSizeBodyAndButton: 14 // is Default
    property int fontSizeCaption: 12
    // fonts are grouped into primary and secondary with different Opacity
    // to make it easier to get the right property,
    // here's the opacity per size:
    property real opacityDisplay4: secondaryTextOpacity
    property real opacityDisplay3: secondaryTextOpacity
    property real opacityDisplay2: secondaryTextOpacity
    property real opacityDisplay1: secondaryTextOpacity
    property real opacityHeadline: primaryTextOpacity
    property real opacityTitle: primaryTextOpacity
    property real opacitySubheading: primaryTextOpacity
    // body can be both: primary or secondary text
    property real opacityBodyAndButton: primaryTextOpacity
    property real opacityBodySecondary: secondaryTextOpacity
    property real opacityCaption: secondaryTextOpacity

    //
    property bool headlineColoredPrimary: false

    header: SimpleTextTitle {
        text: qsTr("A simple 1 - Page APP")
    }

    Flickable {
        id: flickable
        contentHeight: root.implicitHeight
        anchors.fill: parent
        Pane {
            id: root
            anchors.fill: parent
            ColumnLayout {
                anchors.right: parent.right
                anchors.left: parent.left
                LabelHeadline {
                    leftPadding: 10
                    text: qsTr("Some Fields")
                    color: headlineColoredPrimary ? primaryColor : accentColor
                }
                LabelCheckBarRow {
                    text: qsTr("E-mail")
                }
                LabelLabelBarRow {
                    text1: qsTr("Name ")
                    text2: qsTr("Jane Doe")
                    barColor: Material.accentColor
                }
                LabelSwitchBarRow {
                    id: multiSwitch
                    property int count: checked ? 2 : 1
                    text: qsTr("Translate Multi")
                    switchText: qsTr("%1 piece(s)","",count).arg(count)
                }
                LabelHeadline {
                    leftPadding: 10
                    text: qsTr("Show more Fields")
                    color: headlineColoredPrimary ? primaryColor : accentColor
                }
                LabelSwitchBarRow {
                    id: addressSwitch
                    text: qsTr("Address")
                }
                Pane {
                    id: addressBlock
                    // implicite padding: 6
                    leftPadding: 0
                    rightPadding: 0
                    anchors.left: parent.left
                    anchors.right: parent.right
                    visible: addressSwitch.checked
                    ColumnLayout {
                        anchors.right: parent.right
                        anchors.left: parent.left
                        LabelLabelBarRow {
                            text1: qsTr("City")
                            text2: qsTr("Munich")
                            barColor: "Red"
                        }
                        LabelLabelBarRow {
                            text1: qsTr("Street")
                            text2: qsTr("Odeonsplatz")
                            barColor: "green"
                        }
                        LabelLabelBarRow {
                            text1: qsTr("Zip")
                            text2: qsTr("80000")
                            barColor: "transparent"
                        }
                    } // addressBlock col layout
                } // addressBlock

                HorizontalDivider {}
                LabelHeadline {
                    leftPadding: 6
                    text: qsTr("Color, Opacity depends on Theme")
                    color: headlineColoredPrimary ? primaryColor : accentColor
                }
                Label {
                    leftPadding: 6
                    opacity: opacityBodyAndButton
                    text: qsTr("Swap Theme between Dark and Light from Options Menu")
                }

                Label {
                    leftPadding: 6
                    opacity: opacityBodyAndButton
                    text: "dividerColor: "+dividerColor
                }
                Label {
                    leftPadding: 6
                    opacity: opacityBodyAndButton
                    text: "primary text with opacity: " + appWindow.opacityBodyAndButton
                }
                Label {
                    leftPadding: 6
                    opacity: secondaryTextOpacity
                    text: "secondary text  with opacity: " + appWindow.opacityBodySecondary
                }
                // cards and dialogs:
                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    implicitWidth: parent.width *2 / 3
                    height: 60
                    color: appWindow.cardAndDialogBackground
                    Label {
                        leftPadding: 6
                        anchors.verticalCenter: parent.verticalCenter
                        wrapMode: Text.WordWrap
                        text: "Card, Dialog, Popup\nBackground Color: " + cardAndDialogBackground
                        opacity: opacityBodyAndButton
                    }
                }
                HorizontalDivider {}
                LabelHeadline {
                    leftPadding: 6
                    text: qsTr("Verify Primary and Accent Colors")
                    color: headlineColoredPrimary ? primaryColor : accentColor
                }
                // the primary color
                Column {
                    Layout.fillWidth: true
                    width: parent.width
                    spacing: 0
                    Rectangle {
                        Layout.fillWidth: true
                        width: parent.width
                        height: 40
                        color: appWindow.primaryLightColor
                        Label {
                            leftPadding: 6
                            anchors.verticalCenter: parent.verticalCenter
                            wrapMode: Text.WordWrap
                            text: qsTr("Primary Light Color: %1","").arg(primaryLightColor)
                            color: appWindow.textOnPrimaryLight
                        }
                    }
                    Rectangle {
                        Layout.fillWidth: true
                        width: parent.width
                        height: 40
                        color: appWindow.primaryColor
                        Label {
                            leftPadding: 6
                            anchors.verticalCenter: parent.verticalCenter
                            wrapMode: Text.WordWrap
                            text: qsTr("Primary Color: %1 --- Tap to edit","").arg(primaryColor)
                            color: appWindow.textOnPrimary
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                console.log("PRIMARY clicked: ")
                                popup.selectAccentColor = false
                                popup.open()
                            }
                        } // mouse
                    }
                    Rectangle {
                        Layout.fillWidth: true
                        width: parent.width
                        height: 40
                        color: appWindow.primaryDarkColor
                        Label {
                            leftPadding: 6
                            anchors.verticalCenter: parent.verticalCenter
                            wrapMode: Text.WordWrap
                            text: qsTr("Primary Dark Color: %1","").arg(primaryDarkColor)
                            color: appWindow.textOnPrimaryDark
                        }
                    }
                }
                // the accent color
                Rectangle {
                    Layout.fillWidth: true
                    width: parent.width
                    height: 40
                    color: Material.accentColor
                    Label {
                        leftPadding: 6
                        anchors.verticalCenter: parent.verticalCenter
                        wrapMode: Text.WordWrap
                        text: qsTr("Accent Color: %1 --- Tap to edit","").arg(accentColor)
                        color: appWindow.textOnAccent
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            console.log("ACCENT clicked: ")
                            popup.selectAccentColor = true
                            popup.open()
                        }
                    } // mouse
                }
                HorizontalDivider {}
                LabelHeadline {
                    leftPadding: 6
                    text: qsTr("Fonts, Sizes, Opacity")
                    color: headlineColoredPrimary ? primaryColor : accentColor
                }
                LabelDisplay4 {
                    leftPadding: 6
                    text: "D4: 112 px"
                }
                LabelDisplay3 {
                    leftPadding: 6
                    text: "Display3: 56 px"
                }
                LabelDisplay2 {
                    leftPadding: 6
                    text: "Display2: 45 px"
                }
                LabelDisplay1 {
                    leftPadding: 6
                    text: "Display1: 34 px"
                }
                LabelHeadline {
                    leftPadding: 6
                    text: "Headline: 24 px"
                }
                LabelHeadline {
                    leftPadding: 6
                    text: "Headline colored primary"
                    color: primaryColor
                }
                LabelHeadline {
                    leftPadding: 6
                    text: "Headline colored accent"
                    color: accentColor
                }
                LabelTitle {
                    leftPadding: 6
                    text: "Title (ToolBar): 20 px"
                }
                LabelSubheading {
                    leftPadding: 6
                    text: "Subheading: 16 px"
                }
                LabelSubheading {
                    leftPadding: 6
                    text: "Subheading colored primary"
                    color:primaryColor
                }
                LabelSubheading {
                    leftPadding: 6
                    text: "Subheading colored accent"
                    color: accentColor
                }
                // body is default px
                LabelBody {
                    leftPadding: 6
                    text: "Body (primary text) and BUTTON: 14 px"
                }
                LabelBodySecondary {
                    leftPadding: 6
                    text: "Body (secondary text): 14 px"
                }

                LabelCaption {
                    leftPadding: 6
                    text: "caption: 12 px"
                }

                HorizontalDivider {}
                LabelHeadline {
                    leftPadding: 6
                    text: qsTr("Icons")
                    color: headlineColoredPrimary ? primaryColor : accentColor
                }
                LabelSubheading {
                    leftPadding: 6
                    text: "HighDPI 24 px Icon: @[1..4]:"
                }
                Image {
                    opacity: iconActiveOpacity
                    source: "qrc:/images/"+iconFolder+"/test.png"
                }
                Label {
                    leftPadding: 6
                    text: qsTr("Icon Opacity Active: %1\nIcon Opacity Inactive: %2","").arg(iconActiveOpacity).arg(iconInactiveOpacity)
                }
                HorizontalDivider {}
                LabelHeadline {
                    leftPadding: 6
                    text: "18x18"
                    color: headlineColoredPrimary ? primaryColor : accentColor
                }
                RowLayout {
                    VerticalDivider {}
                    ColumnLayout {
                        implicitWidth: 72
                        IconActive{
                            imageName: "person.png"
                            imageSize: 18
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        LabelCaption {
                            text: "active"
                            Layout.fillWidth: false
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                    VerticalDivider {}
                    ColumnLayout {
                        implicitWidth: 72
                        IconInactive{
                            imageName: "person.png"
                            imageSize: 18
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        LabelCaption {
                            text: "inactive"
                            Layout.fillWidth: false
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                    VerticalDivider {}
                    ColumnLayout {
                        implicitWidth: 72
                        IconColored {
                            imageName: "person.png"
                            imageSize: 18
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        LabelCaption {
                            text: "primary"
                            Layout.fillWidth: false
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                    VerticalDivider {}
                    ColumnLayout {
                        implicitWidth: 72
                        IconColored {
                            imageName: "person.png"
                            imageSize: 18
                            color: accentColor
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        LabelCaption {
                            text: "accent"
                            Layout.fillWidth: false
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                    VerticalDivider {}
                } // row layout icons 18
                LabelHeadline {
                    leftPadding: 6
                    text: "Default: 24x24 (160dpi)"
                    color: headlineColoredPrimary ? primaryColor : accentColor
                }
                RowLayout {
                    VerticalDivider {}
                    ColumnLayout {
                        implicitWidth: 48
                        IconActive{
                            imageName: "person.png"
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        LabelCaption {
                            text: "active"
                            Layout.fillWidth: false
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                    VerticalDivider {}
                    ColumnLayout {
                        implicitWidth: 48
                        IconInactive{
                            imageName: "person.png"
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        LabelCaption {
                            text: "inactive"
                            Layout.fillWidth: false
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                    VerticalDivider {}
                    ColumnLayout {
                        implicitWidth: 48
                        IconColored {
                            imageName: "person.png"
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        LabelCaption {
                            text: "primary"
                            Layout.fillWidth: false
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                    VerticalDivider {}
                    ColumnLayout {
                        implicitWidth: 48
                        IconColored {
                            imageName: "person.png"
                            color: accentColor
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        LabelCaption {
                            text: "accent"
                            Layout.fillWidth: false
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                    VerticalDivider {}
                } // row layout icons
                LabelHeadline {
                    leftPadding: 6
                    text: "36x36"
                    color: headlineColoredPrimary ? primaryColor : accentColor
                }
                RowLayout {
                    VerticalDivider {}
                    ColumnLayout {
                        implicitWidth: 72
                        IconActive{
                            imageName: "person.png"
                            imageSize: 36
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        LabelCaption {
                            text: "active"
                            Layout.fillWidth: false
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                    VerticalDivider {}
                    ColumnLayout {
                        implicitWidth: 72
                        IconInactive{
                            imageName: "person.png"
                            imageSize: 36
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        LabelCaption {
                            text: "inactive"
                            Layout.fillWidth: false
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                    VerticalDivider {}
                    ColumnLayout {
                        implicitWidth: 72
                        IconColored {
                            imageName: "person.png"
                            imageSize: 36
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        LabelCaption {
                            text: "primary"
                            Layout.fillWidth: false
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                    VerticalDivider {}
                    ColumnLayout {
                        implicitWidth: 72
                        IconColored {
                            imageName: "person.png"
                            imageSize: 36
                            color: accentColor
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        LabelCaption {
                            text: "accent"
                            Layout.fillWidth: false
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                    VerticalDivider {}
                } // row layout icons 36
                LabelHeadline {
                    leftPadding: 6
                    text: "48x48"
                    color: headlineColoredPrimary ? primaryColor : accentColor
                }
                RowLayout {
                    VerticalDivider {}
                    ColumnLayout {
                        implicitWidth: 72
                        IconActive{
                            imageName: "person.png"
                            imageSize: 48
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        LabelCaption {
                            text: "active"
                            Layout.fillWidth: false
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                    VerticalDivider {}
                    ColumnLayout {
                        implicitWidth: 72
                        IconInactive{
                            imageName: "person.png"
                            imageSize: 48
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        LabelCaption {
                            text: "inactive"
                            Layout.fillWidth: false
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                    VerticalDivider {}
                    ColumnLayout {
                        implicitWidth: 72
                        IconColored {
                            imageName: "person.png"
                            imageSize: 48
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        LabelCaption {
                            text: "primary"
                            Layout.fillWidth: false
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                    VerticalDivider {}
                    ColumnLayout {
                        implicitWidth: 72
                        IconColored {
                            imageName: "person.png"
                            imageSize: 48
                            color: accentColor
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        LabelCaption {
                            text: "accent"
                            Layout.fillWidth: false
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                    VerticalDivider {}
                } // row layout icons 48
                LabelHeadline {
                    leftPadding: 6
                    text: "Floating Action Button (Default)"
                    color: headlineColoredPrimary ? primaryColor : accentColor
                }
                RowLayout {
                    VerticalDivider {}
                    ColumnLayout {
                        implicitWidth: 72
                        FloatingActionButton {
                            imageSource: "qrc:/images/"+iconOnPrimaryLightFolder+"/person.png"
                            backgroundColor: primaryLightColor
                            onClicked: console.log("do something if clicked")
                        }
                        LabelCaption {
                            text: "P... light"
                            Layout.fillWidth: false
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                    VerticalDivider {}
                    ColumnLayout {
                        implicitWidth: 72
                        FloatingActionButton {
                            imageSource: "qrc:/images/"+iconOnPrimaryFolder+"/person.png"
                        }
                        LabelCaption {
                            text: "Primary"
                            Layout.fillWidth: false
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                    VerticalDivider {}
                    ColumnLayout {
                        implicitWidth: 72
                        FloatingActionButton {
                            imageSource: "qrc:/images/"+iconOnPrimaryDarkFolder+"/person.png"
                            backgroundColor: primaryDarkColor
                        }
                        LabelCaption {
                            text: "P... dark"
                            Layout.fillWidth: false
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                    VerticalDivider {}
                    ColumnLayout {
                        implicitWidth: 72
                        FloatingActionButton {
                            imageSource: "qrc:/images/"+iconOnAccentFolder+"/person.png"
                            backgroundColor: accentColor
                        }
                        LabelCaption {
                            text: "Accent"
                            Layout.fillWidth: false
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                    VerticalDivider {}
                } // row layout FAB
                LabelHeadline {
                    leftPadding: 6
                    text: "Floating Action Button (Mini)"
                    color: headlineColoredPrimary ? primaryColor : accentColor
                }
                RowLayout {
                    VerticalDivider {}
                    ColumnLayout {
                        implicitWidth: 72
                        FloatingActionMiniButton {
                            imageSource: "qrc:/images/"+iconOnPrimaryLightFolder+"/person.png"
                            backgroundColor: primaryLightColor
                        }
                        LabelCaption {
                            text: "P... light"
                            Layout.fillWidth: false
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                    VerticalDivider {}
                    ColumnLayout {
                        implicitWidth: 72
                        FloatingActionMiniButton {
                            imageSource: "qrc:/images/"+iconOnPrimaryFolder+"/person.png"
                        }
                        LabelCaption {
                            text: "Primary"
                            Layout.fillWidth: false
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                    VerticalDivider {}
                    ColumnLayout {
                        implicitWidth: 72
                        FloatingActionMiniButton {
                            imageSource: "qrc:/images/"+iconOnPrimaryDarkFolder+"/person.png"
                            backgroundColor: primaryDarkColor
                        }
                        LabelCaption {
                            text: "P... dark"
                            Layout.fillWidth: false
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                    VerticalDivider {}
                    ColumnLayout {
                        implicitWidth: 72
                        FloatingActionMiniButton {
                            imageSource: "qrc:/images/"+iconOnAccentFolder+"/person.png"
                            backgroundColor: accentColor
                        }
                        LabelCaption {
                            text: "Accent"
                            Layout.fillWidth: false
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                    VerticalDivider {}
                } // row layout FAB Mini
            } // col layout
        } // root
        ScrollIndicator.vertical: ScrollIndicator { }
    } // flickable

    function switchPrimaryPalette(paletteIndex) {
        primaryPalette = myApp.primaryPalette(paletteIndex)
    }
    function switchAccentPalette(paletteIndex) {
        accentPalette = myApp.accentPalette(paletteIndex)
    }

    //
    PopupPalette {
        id: popup
    }

} // app window
