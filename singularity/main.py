import threading
from subprocess import call

from src.act import main as act
from src.createLevel import updateLevelData

# Create level
updateLevelData()

# Game Loop
def gameLoop():
    threading.Timer(0.5, gameLoop).start()
    act()
    print("Tick! \n\n")

# Launch
# gameLoop()

# Open UI
# call(["qmlscene", "ui/main.qml"])
