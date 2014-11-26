import QtQuick 2.0
import Ubuntu.Components 1.1
//import "logic.js" as Logic
Item {
    id: grid
    width: 700; height: width
    anchors.centerIn: parent

    property int gridSize: 4
    property int currentTurn : 0

    Component.onCompleted: {
        // Initialize grid creating empty tiles
        var i = 0;
        while (i < gridSize*gridSize) {
            cellsModel.append({"itemColor":"green"});
            i++;
        }

        //Read Bot Data
        updateBotData();
    }

    function updateBotData() {
        var xhr = new XMLHttpRequest;
        xhr.open("GET", "data/bot.json");
        xhr.onreadystatechange = function() {
            if (xhr.readyState == XMLHttpRequest.DONE) {
                console.log(xhr.responseText);
                console.log("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n
                \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
                var bot_data = JSON.parse(xhr.responseText);
                bot.posX = bot_data.x;
                bot.posY = bot_data.y;
                bot.orientation = bot_data.orientation;
            }
        }
        xhr.send();
    }

    Item {
        id: gameLoop
        Timer {
            interval: 100; running: true; repeat: true
            onTriggered:{
                updateBotData()
                }
        }
    }

    ListModel {
        id: cellsModel
    }

    GridView {
        id: cells
        interactive: false
        anchors.centerIn: parent
        width: grid.height-100; height: width
        cellWidth: width/(grid.gridSize)
        cellHeight: cellWidth
        model: cellsModel

        delegate: cell

        Item {
            id: bot
            width: cells.cellHeight
            height: width

            property int posX: 1
            property int posY: 3
            property real orientation: 1.5 // 1 - n; 2 - e; 3 - s; 4 - w;
            x: cells.cellHeight*(posX-1)
            y: cells.cellHeight*(gridSize-posY)

            Rectangle {
                id: body
                anchors.fill: parent
                anchors.margins: units.gu(3)
                color: UbuntuColors.coolGrey
                radius: units.gu(2)
                rotation: -90 + 90*bot.orientation

                // Arrow
                Rectangle {
                    color: Qt.lighter(UbuntuColors.coolGrey,2)
                    width: units.gu(8); height: units.gu(2)
                    x: body.width/2-width/2
                }

                // Skills/body parts
                Rectangle {
                    color: Qt.lighter(UbuntuColors.orange, 0.8)
                    width: units.gu(5); height: units.gu(1)
                    x: units.gu(1); y: units.gu(4)
                }
                Rectangle {
                    color: Qt.lighter(UbuntuColors.blue, 0.8)
                    width: units.gu(3); height: units.gu(1)
                    x: units.gu(1); y: units.gu(6)
                }
                Rectangle {
                    color: Qt.lighter(UbuntuColors.green, 0.8)
                    width: units.gu(8); height: units.gu(1)
                    x: units.gu(1); y: units.gu(8)
                }

            }
        }

    }



    Component {
        id: cell
        Rectangle {
            width: cells.cellHeight
            height: width
            color: "transparent" //itemColor
            border.color: "black"
            border.width: 1
        }
    }
}
