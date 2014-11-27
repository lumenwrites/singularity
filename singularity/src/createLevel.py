import json
from random import randint

def updateLevelData():
    cell_type = 1
    gridSize = 9

    level_data = {}
    level_data['grid'] = []
    level_data['gridSize'] = gridSize



    for y in range(gridSize):
        row = []
        for x in range(gridSize):
            cell_data = {}
            cell_data['x'] = str(len(row)).zfill(2)
            cell_data['y'] = str(len(level_data['grid'])).zfill(2)

            rand = randint(0, gridSize*gridSize)
            # generate gem with probability of
            if (rand < 4):
                cell_data['cell_type'] = 2
                print("Gem!! " + str(rand))
            else:
                cell_data['cell_type'] = 1
            row.append(cell_data)
            # print("[" + str(len(row)).zfill(2) + "," +
            #       str(gridSize-len(level_data)).zfill(2) + "]", end='')

        level_data['grid'].append(row)
        # print()
        # print()





    with open('data/level.json', 'w') as outfile:
        # print (level_data)
        json.dump(level_data, outfile)
