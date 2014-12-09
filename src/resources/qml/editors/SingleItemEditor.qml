import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.1
import QtQuick.Dialogs 1.2

import "."

AbstractEditor {
    id: root
    anchors.fill: parent

    property string originalValue: ""

    Text {
        Layout.fillWidth: true
        text: "Value:"
    }

    TextArea {
        id: textArea
        Layout.fillWidth: true
        Layout.fillHeight: true
        text: ""
        enabled: originalValue != ""
    }

    function setValue(rowValue) {
        root.originalValue = rowValue['value']
        textArea.text = rowValue['value']
    }

    function isValueChanged() {
        return originalValue != textArea.text
    }

    function resetAndDisableEditor() {
        root.originalValue = ""
        textArea.text = ""
    }

    function getValue() {
        return {"value": textArea.text}
    }
}
