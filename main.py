import json
import threading
from botLogic.bot import bot as bot

bot1 = bot()

# Run in circles
i = 1

def runInCircles():
    global i
    if (i < 4):
        bot1.move()
        bot1.updateBotData()
        i = i + 1
    else:
        i = 1
        if (bot1.orientation < 4):
            bot1.orientation = bot1.orientation + 1
        else:
            bot1.orientation = 1


# Main Function
def main():
    runInCircles()

# Game Loop
def gameLoop():
    threading.Timer(1, gameLoop).start()
    main()

# Launch
gameLoop()
