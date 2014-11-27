import json

class bot:
    def __init__(self):
        self.x = 1
        self.y = 1
        self.orientation = 1
        self.speed = 1 # 1 is forward, -1 is backward
        print("Bot created!")
        self.updateBotData()

    def moveUp(self):
        self.y = self.y - 1 # reversed grid
        self.orientation = 1
        self.updateBotData()

    def moveRight(self):
        self.x = self.x + 1
        self.orientation = 2
        self.updateBotData()

    def moveDown(self):
        self.y = self.y + 1 # reversed grid
        self.orientation = 3
        self.updateBotData()

    def moveLeft(self):
        self.x = self.x - 1
        self.orientation = 4
        self.updateBotData()

    def turn(self, orientation = 1):
        self.orientation = orientation
        self.updateBotData()

    def moveToCoord(self, x, y):
        self.x = x
        self.y = y
        self.updateBotData()

    # Move forward
    def move(self, speed = 1):
        if (self.orientation == 1):
            self.moveUp()
        elif (self.orientation == 2):
            self.moveRight()
        elif (self.orientation == 3):
            self.moveDown()
        elif (self.orientation == 4):
            self.moveLeft()


    # Update Bot Data
    def updateBotData(self):
        with open('data/bot.json', 'w') as outfile:
            bot_data = {}
            bot_data['x'] = self.x
            bot_data['y'] = self.y
            bot_data['orientation'] = self.orientation
            bot_data['speed'] = self.speed
            json.dump(bot_data, outfile)

    # Debug
    def debug():
        print ("Debug:")
        print ("x: " + str(self.x))
        print ("y: " + str(self.y))
        print ("orientation" + str(self.orientation))
        print ("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
