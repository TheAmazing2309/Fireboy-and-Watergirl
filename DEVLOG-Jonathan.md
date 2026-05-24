# Dev Log:

This document must be updated daily every time you finish a work session.

### 2026-05-11 - Working on proposal
Worked during the class period on creating a proposal and planning out a project class structure for out UML diagram.

### 2026-05-13 - Finishing prototype & Setting up repo
Spent the class period and all of Dojo (2.25 tours total) to set up the repository including adding a gitignore. Also tested branching, and added all the images and descriptions to the proposal. Also created a constructor for the map class and figured out how to load them from the file and display them on the screen properly.

### 2026-05-14 - Collision Detection
Worked in class and for an hour at home to make collision detection in all four directions between the players and the tiles. Also created a Hitbox class. Also fixed the tileMap loading issues.

### 2026-05-15 - Collision Detection Part 2
Working in class to fix collision detection. The prior system was not working as intended. Also merged main from Charles's branch and resolved the conflict.

### 2026-05-17 - Player Position Adjustments
Worked in class and during the entirety of Dojo to adjust the player position after a collision was detected. The adjustment is still very snappy, however.

### 2026-05-18 - Player Adjustments and Jumping Session 1
Worked in class. Fixed player adjustments so that they are less snappy and fixed the mathematical calculation errors. However, the jumping is now broken and does not allow the player to jump even when on solid ground.

### 2026-05-18 - Player Adjustments and Jumping Session 2
Worked in Dojo for 1.5 hours on player adjustments and jumping. The jumping and collisions now work perfectly. The jumping correctly detects if a player is on solid ground and the player can no longer double jump or jusp right after they walk off an edge.

### 2026-05-19 - ButtonTiles and SlidingTiles
Worked in class and during Dojo for 1.5 hours on creating Buttons. The Buttons detect when a player is on top of them. Also reconfigued the Map constructor so that it properly links a reference into the Button of the SlidingTile, however I am not done with that yet.

### 2026-05-20 - SlidingTiles and scaling
Worked in class and during dojo to finish up the slidingTiles being properly passed into the Buttons. The slidingTiles now move as inteded when the buttons are clicked. Began working on some scaling issued because we want to make the levels a little bigger.

### 2026-05-21 - Hitboxes and scaling
Worked during class and at home for 2 hours. Fixed the scaling issue by saving the previous coordinates of the player and drawing a white rect over them. This is however very clunky and still leaves inconsistant dashed lines everywhere. I also split the hitbox into collisionhitbox and renderhitbox to allow for more control of a different display vs collision checking area. I also updated the rest of the code to reflect this change. Merged to main too.

### 2026-05-22 - Exit Doors
Worked at home for 2 hours on exit door activation. I also later changed the system of the exit door activating based on proximity to instead acivate strictly based on the current player's coordinates. This ended up being a much more effective and better looking way to do this.

### 2026-05-23 - Making manual textures for the tiles AND liquidtiles Session 1
Worked for two hours to manually draw textures for the background bricks and for the platform bricks. Also changed the rendering to only re-render the closest tiles every frame so that the game does not lag. Also added liquidTiles that can detect the different player types and end the game accordingly. Also made both door activations simultaneously change the game state to win.

### 2026-05-23 - Fixing button rendering, slidingTile rendering AND gems Session 2
Working for 3 hours to fix the rendering for the sliding tiles and the buttons so that they do not take up the wholt ile, and also are color coded with the sliding tiles. Also making the liquid tiles render more nicely. Also maing the timer look nicer. Also adding gems that the correct player can collect.