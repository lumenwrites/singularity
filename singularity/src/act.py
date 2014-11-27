from src.bot import bot as bot

# Create bot
bot1 = bot()

# Run in circles
i = 1

def runInCircles():
    global i
    if (i < 4):
        bot1.move()
        i = i + 1
    else:
        i = 1
        if (bot1.orientation < 4):
            bot1.turn(bot1.orientation + 1)
        else:
            bot1.turn(1)

def main():
    runInCircles()
    # bot1.moveUp()
