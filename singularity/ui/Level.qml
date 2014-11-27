import QtQuick 2.0
import Ubuntu.Components 1.1
//import "logic.js" as Logic
Item {
    id: grid
    //width: 100; height: width
    //anchors.centerIn: parent

    property int gridSize:  0 //16
    property int cellSize: units.gu(8)
    property int currentTurn : 0

    x:100
    y:100

    Component.onCompleted: {
        // Update level data
        updateLevelData()

        //Read Bot Data
        updateBotData();

    }

    function updateBotData() {
        var xhr = new XMLHttpRequest;
        xhr.open("GET", "../data/bot.json");
        xhr.onreadystatechange = function() {
            if (xhr.readyState == XMLHttpRequest.DONE) {
                //console.log(xhr.responseText);
                var bot_data = JSON.parse(xhr.responseText);
                bot.posX = bot_data.x;
                bot.posY = bot_data.y;
                bot.orientation = bot_data.orientation;
            }
        }
        xhr.send();
    }


    function updateLevelData() {
        var xhr = new XMLHttpRequest;
        xhr.open("GET", "../data/level.json");
        xhr.onreadystatechange = function() {
            if (xhr.readyState == XMLHttpRequest.DONE) {
                //console.log(xhr.responseText);
                var level_data = JSON.parse(xhr.responseText);

                // Populate grid
                console.log("Cell Type: " + level_data['grid'][0][0].cell_type)

                // Set grid size
                grid.gridSize = level_data['gridSize']
                //grid.width = level_data['gridSize']*units.gu(8)
                cells.width = grid.cellSize*level_data['gridSize']

                // Initialize grid creating empty tiles
                var num = 1;
                var y = 0;
                while (y < level_data['gridSize']) {
                    var x = 0;
                    while (x < level_data['gridSize']) {
                        cellsModel.append({"cell_type": level_data['grid'][x][y].cell_type,
                        "x" : level_data['grid'][x][y].y,
                        "y" : level_data['grid'][x][y].x,
                        "num" : num
                    });
                        //console.log("cell number: " + x + 4*y);
                        //console.log("y: " + y);
                        x++;
                        num++
                    }
                    y++;
                    //console.log("\n")
                }
            }
        }
        xhr.send();
    }


    Item {
        id: gameLoop
        Timer {
            interval: 500; running: true; repeat: true
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
        //anchors.centerIn: parent
        cellWidth: grid.cellSize
        cellHeight: cellWidth
        width: cellWidth*grid.gridSize; height: width
        model: cellsModel

        delegate: cell

        Item {
            id: bot
            width: cells.cellHeight
            height: width

            property int posX: 1
            property int posY: 3
            property real orientation: 1.5 // 1 - n; 2 - e; 3 - s; 4 - w;
            x: cells.cellHeight*(posX)
            y: cells.cellHeight*(posY)

            Rectangle {
                id: body
                anchors.fill: parent
                anchors.margins: parent.width*0.1
                color: UbuntuColors.coolGrey
                radius: parent.width*0.1
                rotation: -90 + 90*bot.orientation

                // Arrow
                Rectangle {
                    color: Qt.lighter(UbuntuColors.blue, 0.8)
                    width: parent.width-parent.width/5; height: parent.width/10
                    x: parent.width/10
                    y: 0
                    radius: parent.width/20
                }

                // Skills/body parts
                // Rectangle {
                //     color: Qt.lighter(UbuntuColors.orange, 0.8)
                //     width: units.gu(5); height: units.gu(1)
                //     x: units.gu(1); y: units.gu(4)
                // }
                // Rectangle {
                //     color: Qt.lighter(UbuntuColors.blue, 0.8)
                //     width: units.gu(3); height: units.gu(1)
                //     x: units.gu(1); y: units.gu(6)
                // }
                // Rectangle {
                //     color: Qt.lighter(UbuntuColors.green, 0.8)
                //     width: units.gu(8); height: units.gu(1)
                //     x: units.gu(1); y: units.gu(8)
                // }

            }
        }

    }



    Component {
        id: cell
        Rectangle {
            width: cells.cellWidth
            height: width
            color: "transparent" //itemColor
            border.color: "black"
            border.width: 1

            Text {
                anchors.centerIn: parent
                text: "x: " + model.x  +
                "\ny: " + model.y +
                //"\nType: " + model.cell_type +
                "\nnum: " + model.num
            }

            Image {
                source: "../img/gem.png"
                y: -1
                visible: model.cell_type == 2? true:false
            }
        }
    }
}
