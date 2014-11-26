import json
import threading

bot = {}
bot['x'] = 1
bot['y'] = 1
bot['orientation'] = 1
bot['speed'] = 1 # 1 is forward, -1 is backward

# Run in circles
i = 1

def runInCircles():
    global i
    if (i < 4):
        move()
        i = i + 1
    else:
        i = 1
        if (bot['orientation'] < 4):
            bot['orientation'] = bot['orientation'] + 1
        else:
            bot['orientation'] = 1

# Move
def moveUp():
    bot['y'] = bot['y'] + 1
    bot['orientation'] = 1
    updateBotData()

def moveRight():
    bot['x'] = bot['x'] + 1
    bot['orientation'] = 2
    updateBotData()

def moveDown():
    bot['y'] = bot['y'] - 1
    bot['orientation'] = 3
    updateBotData()

def moveLeft():
    bot['x'] = bot['x'] - 1
    bot['orientation'] = 4
    updateBotData()

def moveToCoord(x,y,orientation = 1):
    bot['x'] = x
    bot['y'] = y
    bot['orientation'] = orientation
    updateBotData()

# Move forward
def move(speed = 1):
    if (bot['orientation'] == 1):
        moveUp()
    elif (bot['orientation'] == 2):
        moveRight()
    elif (bot['orientation'] == 3):
        moveDown()
    elif (bot['orientation'] == 4):
        moveLeft()

# Update Bot Data
def updateBotData():
    with open('data/bot.json', 'w') as outfile:
        json.dump(bot, outfile)


# Main Function
def main():
    runInCircles()

# Debug
def debug():
    print ("Debug:")
    print ("bot['x']: " + str(bot['x']))
    print ("bot['y']: " + str(bot['y']))
    print ("bot['orientation']: " + str(bot['orientation']))
    print ("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")


# Game Loop
def gameLoop():
    threading.Timer(1, gameLoop).start()
    main()
    debug()
# Launch
gameLoop()
