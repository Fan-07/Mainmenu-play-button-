# Mainmenu-play-button-
play button script for roblox studio - with camera angled at your wherever u want (screen tilting to cursor system), enter smoothly when the button is clicked

|| EXTREMELY IMPORTANT ||

1)Insert a "Menu Camera" (MUST BE NAMED EXACTLY THAT) part in your work space. the direction its facing will act as your camera for your cursor tilt system. you can maybe have it face one part of your map

2) Insert a "Main Menu GUI" GUI in StarterGui. In it, add a "MainFrame" Frame. In itm add a "Play" textbutton. you may customize/design the button however you want.

3) also under "Main Menu GUI", add a "MenuCameraScript" Local script. extract the code from the provided menucamerascript file

4) under The "Play" textbutton, add the provided main localscript.

5) (Optional) under lighting, you may add "blur" effect. when the play button is clicked, it smoothly removes the blur and transitions into your game

If done right, when you load into your game, your camera must be facing the same direction as the Menu Camera. when you click the "Play" text button, you will be loaded into the game. Under the same Main frame, you may later add different UI (like settings button) which wont hamper this button's functionality

your hierarchy must be as followed

--

Workspace -> Menu Camera

StarterGui  -> Main Menu GUI -> MainFrame -> Play

--
      read the code comments to get through your otherGUI management



|| GLitchy Text ||

your mainframe hierarchy should be: <img width="191" height="75" alt="image" src="https://github.com/user-attachments/assets/3f9128e0-a268-4891-adac-37e36f8f5184" />
with the "letter" folder containing individual textlabels for each letters. (folder must be named "letters")
