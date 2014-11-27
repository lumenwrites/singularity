# class bot:
#     def __init__(self):
#         self.x = 1
#         self.y = 1
#         self.orientation = 1
#         self.speed = 1 # 1 is forward, -1 is backward

#     def moveUp(self):
#         self.y = self.y + 1
#         self.orientation = 1

#     def moveRight(self):
#         self.x = self.x + 1
#         self.orientation = 2

#     def moveDown(self):
#         self.y = self.y - 1
#         self.orientation = 3

#     def moveLeft(self):
#         self.x = self.x - 1
#         self.orientation = 4

#     def moveToCoord(self, x, y, orientation = 1):
#         self.x = x
#         self.y = y
#         self.orientation = orientation

#     # Update Bot Data
#     def updateBotData(self):
#         with open('data/bot.json', 'w') as outfile:
#             bot_data = {}
#             bot_data['x'] = self.x
#             bot_data['y'] = self.y
#             bot_data['orientation'] = self.orientation
#             bot_data['speed'] = self.speed
#             json.dump(bot_data, outfile)
