--Setting variables
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

playerPosX = 640
playerPosY = 360

PlayermovementSpeed1 = 120

SpaceClickCounter = 0

--function Loader

function love.load()

    x = 50

	love.graphics.setDefaultFilter('nearest', 'nearest')

	main_font = love.graphics.newFont('doctorglitch.otf', 80)

	love.graphics.setFont(main_font)

	love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
		fullscreen = false,
		resizable = false,
		vsync = true,
	})

end

--keypressed

function love.keypressed(key1Variable)

	if key1Variable == 'escape' then
		print("0101WKpr")
		love.event.quit()
	end

	if key1Variable == 'space' then
		SpaceClickCounter = SpaceClickCounter + 1
	end

end

--movement + boosting  BOOSTING MADE FOR FUN AND ALSO TESTING BOARDERS

function love.update(dt)

    if love.keyboard.isDown('d') then
        --playerPosX = playerPosX + PlayermovementSpeed1 * dt
        playerPosX = math.min(WINDOW_WIDTH - 50, playerPosX + PlayermovementSpeed1 * dt)

        if love.keyboard.isDown('right') then
            playerPosX = math.min(WINDOW_WIDTH - 50, playerPosX + PlayermovementSpeed1 * dt)
         end
        
    end

    if love.keyboard.isDown('a') then
        playerPosX = math.max(0, playerPosX - PlayermovementSpeed1 * dt)
    
        if love.keyboard.isDown('left') then
            playerPosX = math.max(0, playerPosX - PlayermovementSpeed1 * dt)
        end

    end

    if love.keyboard.isDown('s') then
        playerPosY = math.min(WINDOW_HEIGHT - 50, playerPosY + PlayermovementSpeed1 * dt)

		if love.keyboard.isDown('down') then
			playerPosY = math.min(WINDOW_HEIGHT - 50, playerPosY + PlayermovementSpeed1 * dt)
        end
    
	end
 
    if love.keyboard.isDown('w') then
        playerPosY = math.max(0, playerPosY - PlayermovementSpeed1 * dt)
		
		if love.keyboard.isDown('up') then
            playerPosY = math.max(0, playerPosY - PlayermovementSpeed1 * dt)
        end

    end



end

function love.draw()

	love.graphics.clear(0/255, 0/255, 0/255, 255/255)

	love.graphics.setColor(255/255, 255/255, 055/255, 255/255)

	love.graphics.printf(
		SpaceClickCounter,
		0,                                                              --the offset (from left)
		WINDOW_HEIGHT/2 - 6,                                            --height position 
		WINDOW_WIDTH,                                                   --width position
		'center'                                                        --proportions 
	)

--[[    love.graphics.printf(
		'Press ESC to quit',
		0,
		WINDOW_HEIGHT/28,
		WINDOW_WIDTH,
		'left'
	)]]

	
	--player

	love.graphics.setColor(0/255, 255/255, 0/255, 255/255)
	love.graphics.rectangle('fill', playerPosX, playerPosY, 50, 50)

end