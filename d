local CoreGui          = game:GetService("CoreGui")
local RunService       = game:GetService("RunService")
local TweenService     = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local Library  = {}
local Tabs     = {}
local Sections = {}

function MakeDraggable(toGold, toMove)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos = UDim2.new(
            StartPosition.X.Scale,
            StartPosition.X.Offset + Delta.X,
            StartPosition.Y.Scale,
            StartPosition.Y.Offset + Delta.Y
        )
        TweenService:Create(toMove, TweenInfo.new(0.05), {
            Position = pos
        }):Play()
	end

	toGold.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Dragging = true
            DragStart = input.Position
            StartPosition = toMove.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    Dragging = false
                end
            end)
        end
    end)

	toGold.InputChanged:Connect(function(input)
        if
            input.UserInputType == Enum.UserInputType.MouseMovement or
                input.UserInputType == Enum.UserInputType.Touch
        then
            DragInput = input
        end
    end)

	UserInputService.InputChanged:Connect(function(input)
        if input == DragInput and Dragging then
            Update(input)
        end
    end)
end

if CoreGui:FindFirstChild("Advancedware") then
    CoreGui:FindFirstChild("Advancedware"):Destroy()
end

function Library:Window(GameName, ToggleKey)
    GameName = GameName or "Unknown"
    ToggleKey = ToggleKey or Enum.KeyCode.RightAlt

    -- Instances

    local Advancedware = Instance.new("ScreenGui")
    local FatherFrameOutline = Instance.new("Frame")
    local FatherFrame = Instance.new("Frame")
    local TabHolder = Instance.new("Frame")
    local Header = Instance.new("TextLabel")
    local WareText = Instance.new("TextLabel")
    local GameText = Instance.new("TextLabel")
    local TopLine = Instance.new("Frame")
    local ContainerHolder = Instance.new("Frame")

    -- Properties

    Advancedware.Name = "Advancedware"
    Advancedware.Parent = CoreGui
    Advancedware.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    FatherFrameOutline.Name = "FatherFrameOutline"
    FatherFrameOutline.Parent = Advancedware
    FatherFrameOutline.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    FatherFrameOutline.BorderColor3 = Color3.fromRGB(26, 26, 26)
    FatherFrameOutline.Position = UDim2.new(0, 500, 0, 150)
    FatherFrameOutline.Size = UDim2.new(0, 434, 0, 504)
    FatherFrameOutline.ZIndex = -3

    FatherFrame.Name = "FatherFrame"
    FatherFrame.Parent = FatherFrameOutline
    FatherFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
    FatherFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    FatherFrame.Position = UDim2.new(0, 2, 0, 2)
    FatherFrame.Size = UDim2.new(0, 430, 0, 500)

    TabHolder.Name = "TabHolder"
    TabHolder.Parent = FatherFrame
    TabHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabHolder.BackgroundTransparency = 1.000
    TabHolder.BorderSizePixel = 0
    TabHolder.Position = UDim2.new(0.00899999961, 0, 0.0480000004, 0)
    TabHolder.Size = UDim2.new(0, 430, 0, 22)
    TabHolder.ZIndex = 5

    Header.Name = "Header"
    Header.Parent = FatherFrame
    Header.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
    Header.BorderSizePixel = 0
    Header.Size = UDim2.new(0, 430, 0, 22)
    Header.ZIndex = 3
    Header.Font = Enum.Font.Code
    Header.Text = " Advanced"
    Header.TextColor3 = Color3.fromRGB(255, 255, 255)
    Header.TextSize = 14.000
    Header.TextXAlignment = Enum.TextXAlignment.Left

    MakeDraggable(Header, FatherFrameOutline)

    WareText.Name = "WareText"
    WareText.Parent = Header
    WareText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    WareText.BackgroundTransparency = 1.000
    WareText.BorderColor3 = Color3.fromRGB(27, 42, 53)
    WareText.BorderSizePixel = 0
    WareText.Position = UDim2.new(0, 70, 0, 0)
    WareText.Size = UDim2.new(0, 90, 0, 23)
    WareText.ZIndex = 2
    WareText.Font = Enum.Font.Code
    WareText.Text = "ware"
    WareText.TextColor3 = Color3.fromRGB(255, 55, 55)
    WareText.TextSize = 14.000
    WareText.TextXAlignment = Enum.TextXAlignment.Left
    
    GameText.Name = "GameText"
    GameText.Parent = Header
    GameText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    GameText.BackgroundTransparency = 1.000
    GameText.BorderColor3 = Color3.fromRGB(27, 42, 53)
    GameText.BorderSizePixel = 0
    GameText.Position = UDim2.new(0, 100, 0, 0)
    GameText.Size = UDim2.new(0, 90, 0, 23)
    GameText.ZIndex = 2
    GameText.Font = Enum.Font.Code
    GameText.Text = "-".. GameName
    GameText.TextColor3 = Color3.fromRGB(255, 55, 55)
    GameText.TextSize = 14.000
    GameText.TextXAlignment = Enum.TextXAlignment.Left

    TopLine.Name = "TopLine"
    TopLine.Parent = Header
    TopLine.BackgroundColor3 = Color3.fromRGB(255, 55, 55)
    TopLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TopLine.BorderSizePixel = 0
    TopLine.Position = UDim2.new(0, 0, 1.08945465, 0)
    TopLine.Size = UDim2.new(0, 430, 0, 1)

    ContainerHolder.Name = "ContainerHolder"
	ContainerHolder.Parent = FatherFrame
	ContainerHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ContainerHolder.BackgroundTransparency = 1.000
	ContainerHolder.BorderColor3 = Color3.fromRGB(27, 42, 53)
	ContainerHolder.BorderSizePixel = 0
	ContainerHolder.Position = UDim2.new(0, 0, 0.0936139524, 0)
	ContainerHolder.Size = UDim2.new(0, 430, 0, 453)
    ContainerHolder.ZIndex = 5

    function Tabs:Tab(TabName)
        TabName = TabName or "Tab"

        -- Instances

        local Tab = Instance.new("TextButton")
        local TabLine = Instance.new("Frame")
        local Right = Instance.new("Frame")
        local Left = Instance.new("Frame")
        local TabLayout = Instance.new("UIListLayout")
        local SectionLineLayout = Instance.new("UIListLayout")
        local Container = Instance.new("ScrollingFrame")
        local RightLayout = Instance.new("UIListLayout")
        local LeftLayout = Instance.new("UIListLayout")
        local RightPadding = Instance.new("UIPadding")
        local LeftPadding = Instance.new("UIPadding")

        -- Properties

        local TextSize = game:GetService("TextService"):GetTextSize(TabName, 15, Enum.Font.Code, Vector2.new(344, 26)).X

        Tab.Name = "Tab"
        Tab.Parent = TabHolder
        Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Tab.BackgroundTransparency = 1.000
        Tab.BorderSizePixel = 0
        Tab.Size = UDim2.new(0, TextSize + 5, 0, 26)
        Tab.ZIndex = 3
        Tab.AutoButtonColor = false
        Tab.Font = Enum.Font.Code
        Tab.Text = TabName
        Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
        Tab.TextSize = 14.000
        Tab.TextTransparency = 0.4

        TabLine.Name = "TabLine"
        TabLine.Parent = Tab
        TabLine.BackgroundColor3 = Color3.fromRGB(255, 55, 55)
        TabLine.BorderSizePixel = 0
        TabLine.Position = UDim2.new(0, 1, 1, -2)
        TabLine.Size = UDim2.new(0, TextSize + 1, 0, 1)
		TabLine.Visible = false

        Right.Name = "Right"
        Right.Parent = Container
        Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Right.BackgroundTransparency = 1.000
        Right.BorderSizePixel = 0
        Right.Position = UDim2.new(0.494095334, 0, 0.00316542001, 0)
        Right.Size = UDim2.new(0, 202,0, 800)

        LeftLayout.Name = "LeftLayout"
        LeftLayout.Parent = Left
        LeftLayout.SortOrder = Enum.SortOrder.LayoutOrder
        LeftLayout.Padding = UDim.new(0, 8)

        RightLayout.Name = "RightLayout"
        RightLayout.Parent = Right
        RightLayout.SortOrder = Enum.SortOrder.LayoutOrder
        RightLayout.Padding = UDim.new(0, 8)

        LeftPadding.Name = "LefPadding"
        LeftPadding.Parent = Left
        LeftPadding.PaddingTop = UDim.new(0, 2)

        RightPadding.Name = "RightPadding"
        RightPadding.Parent = Right
        RightPadding.PaddingTop = UDim.new(0, 2)

        Left.Name = "Left"
        Left.Parent = Container
        Left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Left.BackgroundTransparency = 1.000
        Left.Position = UDim2.new(0.00697672367, 0, 0.00316542001, 0)
        Left.Size = UDim2.new(0, 215, 0, 800)

		TabLayout.Name = "TabLayout"
		TabLayout.Parent = TabHolder
		TabLayout.FillDirection = Enum.FillDirection.Horizontal
		TabLayout.SortOrder = Enum.SortOrder.LayoutOrder

		Container.Name = "Container"
		Container.Parent = ContainerHolder
		Container.Active = true
		Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Container.BackgroundTransparency = 1.000
		Container.BorderSizePixel = 0
		Container.Size = UDim2.new(0, 430, 0, 453)
		Container.CanvasSize = UDim2.new(0, 0, 0, 800)
		Container.ScrollBarThickness = 0
        Container.Visible = false
        Container.Position = UDim2.new(0,7,0,10)

		-- Effects

		Tab.MouseButton1Click:Connect(function()
            for i, v in pairs(TabHolder:GetChildren()) do
                if v.Name == "Tab" then
                    TweenService:Create(v, TweenInfo.new(.3), {
                        TextTransparency = 0.5
                    }):Play()
                    if v:FindFirstChild("TabLine") then
                        TweenService:Create(v:FindFirstChild("TabLine"), TweenInfo.new(.2), {
                            Visible = false
                        }):Play()
                    end
                end
            end
            for i, v in pairs(ContainerHolder:GetChildren()) do
                if v.Name == "Container" then
                    v.Visible = false
                end
            end
            Container.Visible = true
            TweenService:Create(Tab, TweenInfo.new(.3), {
                TextTransparency = 0
            }):Play()
            TweenService:Create(TabLine, TweenInfo.new(.0), {
                Visible = true
            }):Play()
            wait(.3)
        end)
        ContainerHolder:FindFirstChild("Container").Visible = true
        TweenService:Create(TabHolder:FindFirstChild("Tab"), TweenInfo.new(.3), {
            TextTransparency = 0
        }):Play()
        TweenService:Create(TabHolder:FindFirstChild("Tab"):FindFirstChild("TabLine"), TweenInfo.new(.3), {
            Visible = true
        }):Play()

        function Sections:Section(Side)
            Side = Side or "Left"

            -- Instances

            local SectionLineLayout = Instance.new("UIListLayout")
            local LSectionOutline = Instance.new("Frame")
			local LSection = Instance.new("Frame")
			local LContent = Instance.new("Frame")
			local ContentLayout = Instance.new("UIListLayout")


            -- Properties

			if Side == "Left" then
				LSectionOutline.Parent = Left
			elseif Side == "Right" then
				LSectionOutline.Parent = Right
			end

            SectionLineLayout.Name = "SectionLineLayout"
            SectionLineLayout.Parent = LSectionOutline
            SectionLineLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            SectionLineLayout.SortOrder = Enum.SortOrder.LayoutOrder
            SectionLineLayout.VerticalAlignment = Enum.VerticalAlignment.Center

            LSection.Name = "LSection"
            LSection.Parent = LSectionOutline
            LSection.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
            LSection.BorderColor3 = Color3.fromRGB(0, 0, 0)
            LSection.BorderSizePixel = 0
            LSection.Position = UDim2.new(0.00875445796, 0, 0.00378341042, 0)
            LSection.Size = UDim2.new(0, 198, 0, 430)

            LSectionOutline.Name = "LSectionOutline"
            LSectionOutline.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            LSectionOutline.BorderColor3 = Color3.fromRGB(0, 0, 0)
            LSectionOutline.Position = UDim2.new(0, 7, 0, 9)
            LSectionOutline.Size = UDim2.new(0, 202, 0, 434)

            LContent.Name = "LContent"
            LContent.Parent = LSection
            LContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            LContent.BackgroundTransparency = 1.000
            LContent.BorderSizePixel = 0
            LContent.Position = UDim2.new(0, -1, 0, 0)
            LContent.Size = UDim2.new(0, 201, 0, 428)
            LContent.ZIndex = -3

			ContentLayout.Parent = LContent
			ContentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder


			ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                LSection.Size = UDim2.new(0, 198, 0, ContentLayout.AbsoluteContentSize.Y + 6)
                LSectionOutline.Size = UDim2.new(0, 202, 0, ContentLayout.AbsoluteContentSize.Y + 10)
                LContent.Size = UDim2.new(0, 201, 0, ContentLayout.AbsoluteContentSize.Y + 4)
            end)

            local Elements = {}

            function Elements:SecTitle(SecName)
                SecName = SecName or "Section"

                -- Instances

				local LSecTitle = Instance.new("Frame")
				local LLabel_Title = Instance.new("TextLabel")

                -- Properties

				LSecTitle.Name = "LSecTitle"
				LSecTitle.Parent = LContent

                LSecTitle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                LSecTitle.BackgroundTransparency = 1.000
                LSecTitle.BorderColor3 = Color3.fromRGB(27, 42, 53)
                LSecTitle.BorderSizePixel = 0
                LSecTitle.Position = UDim2.new(0.271144271, 0, 0, 0)
                LSecTitle.Size = UDim2.new(0, 92, 0, 7)

                LLabel_Title.Name = "LLabel_Title"
                LLabel_Title.Parent = LSecTitle
                LLabel_Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                LLabel_Title.BackgroundTransparency = 1.000
                LLabel_Title.BorderColor3 = Color3.fromRGB(27, 42, 53)
                LLabel_Title.BorderSizePixel = 0
                LLabel_Title.Position = UDim2.new(0, -46, 0, -10)
                LLabel_Title.Size = UDim2.new(0, 152, 0, 15)
                LLabel_Title.Font = Enum.Font.Code
                LLabel_Title.Text = SecName
                LLabel_Title.TextColor3 = Color3.fromRGB(255, 255, 255)
                LLabel_Title.TextSize = 14.000
                LLabel_Title.TextStrokeTransparency = 0.000
                LLabel_Title.TextXAlignment = Enum.TextXAlignment.Left

                function Elements:Bind(TglName, Def, Callback)
                    TglName = TglName or "Bind"
                    Def = Def or false
                    Callback = Callback or function()end
                    local Key

                    -- Instances

                    local LBind = Instance.new("Frame")
                    local LB_ToggleTitle = Instance.new("TextLabel")
                    local LB_BindText = Instance.new("TextButton")

                    -- Properties

                    LBind.Name = "LBind"
                    LBind.Parent = LContent
                    LBind.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                    LBind.BackgroundTransparency = 1.000
                    LBind.BorderColor3 = Color3.fromRGB(27, 42, 53)
                    LBind.BorderSizePixel = 0
                    LBind.Size = UDim2.new(0, 196, 0, 22)

                    LB_ToggleTitle.Name = "LB_ToggleTitle"
                    LB_ToggleTitle.Parent = LBind
                    LB_ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    LB_ToggleTitle.BackgroundTransparency = 1.000
                    LB_ToggleTitle.BorderSizePixel = 0
                    LB_ToggleTitle.Position = UDim2.new(0, 8, 0, 2)
                    LB_ToggleTitle.Size = UDim2.new(0, 190, 0, 15)
                    LB_ToggleTitle.Font = Enum.Font.Code
                    LB_ToggleTitle.Text = "Bind"
                    LB_ToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                    LB_ToggleTitle.TextSize = 14.000
                    LB_ToggleTitle.TextStrokeTransparency = 0.000
                    LB_ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left

                    LB_BindText.Name = "LB_BindText"
                    LB_BindText.Parent = LBind
                    LB_BindText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    LB_BindText.BackgroundTransparency = 1.000
                    LB_BindText.BorderSizePixel = 0
                    LB_BindText.Position = UDim2.new(0, 110, 0, 2)
                    LB_BindText.Size = UDim2.new(0, 81, 0, 15)
                    LB_BindText.Font = Enum.Font.Code
                    LB_BindText.Text = "[...]"
                    LB_BindText.TextColor3 = Color3.fromRGB(255, 255, 255)
                    LB_BindText.TextSize = 14.000
                    LB_BindText.TextXAlignment = Enum.TextXAlignment.Right

                end

                function Elements:Button(ButtonName, Callback)
                    ButtonName = ButtonName or "Button"
                    Callback = Callback or function()end

                    -- Instances

                    local LButton = Instance.new("Frame")
                    local LB_InFrame = Instance.new("Frame")
                    local LB_OutFrame = Instance.new("Frame")
                    local LB_Button = Instance.new("TextButton")

                    -- Properties

                    LButton.Name = "LButton"
                    LButton.Parent = LContent
                    LButton.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
                    LButton.BackgroundTransparency = 1.000
                    LButton.BorderColor3 = Color3.fromRGB(27, 42, 53)
                    LButton.BorderSizePixel = 0
                    LButton.Size = UDim2.new(0, 196, 0, 26)

                    LB_InFrame.Name = "LB_InFrame"
                    LB_InFrame.Parent = LButton
                    LB_InFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    LB_InFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    LB_InFrame.Position = UDim2.new(0, 8, 0, 4)
                    LB_InFrame.Size = UDim2.new(0, 179, 0, 18)

                    LB_OutFrame.Name = "LB_OutFrame"
                    LB_OutFrame.Parent = LButton
                    LB_OutFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                    LB_OutFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    LB_OutFrame.Position = UDim2.new(0, 6, 0, 2)
                    LB_OutFrame.Size = UDim2.new(0, 183, 0, 22)
                    LB_OutFrame.ZIndex = -3

                    LB_Button.Name = "LB_Button"
                    LB_Button.Parent = LButton
                    LB_Button.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                    LB_Button.BackgroundTransparency = 1.000
                    LB_Button.Position = UDim2.new(0, 8, 0, 4)
                    LB_Button.Size = UDim2.new(0, 179, 0, 18)
                    LB_Button.Font = Enum.Font.Code
                    LB_Button.Text = ButtonName
                    LB_Button.TextColor3 = Color3.fromRGB(255, 255, 255)
                    LB_Button.TextSize = 14.000
                    LB_Button.TextStrokeTransparency = 0.000
                    LB_Button.TextWrapped = true

                    LB_Button.MouseButton1Click:Connect(function()
						pcall(Callback)
					end)

					LB_Button.MouseEnter:Connect(function()
						LB_OutFrame.BorderColor3 = Color3.fromRGB(255,255,255)
					end)

					LB_Button.MouseLeave:Connect(function()
						LB_OutFrame.BorderColor3 = Color3.fromRGB(0,0,0)
					end)
                end

                function Elements:Dropdown(DrpName, List, Def, Callback)
                    DrpName = DrpName or "Dropdown"
                    List = List or {"Item", "Item", "Item", "Item", "Item", "Item"}
                    Def = Def or " ..."
                    Callback = Callback or function()end
                    local drp = false

                    -- Instances

                    local LDropdown = Instance.new("Frame")
                    local LD_OutFrame = Instance.new("Frame")
                    local LD_DropdownArrow = Instance.new("ImageLabel")
                    local LD_InFrame = Instance.new("Frame")
                    local LD_Button = Instance.new("TextButton")
                    local LD_DScroll = Instance.new("ScrollingFrame")
                    local LD_Dropdown = Instance.new("UIListLayout")
                    local LD_ScrollInline = Instance.new("Frame")

                    -- Properties

                    LDropdown.Name = "LDropdown"
                    LDropdown.Parent = LContent
                    LDropdown.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
                    LDropdown.BackgroundTransparency = 1.000
                    LDropdown.BorderColor3 = Color3.fromRGB(27, 42, 53)
                    LDropdown.BorderSizePixel = 0
                    LDropdown.Position = UDim2.new(0, 0, 0.279620856, 0)
                    LDropdown.Size = UDim2.new(0, 196, 0, 26)

                    LD_OutFrame.Name = "LD_OutFrame"
                    LD_OutFrame.Parent = LDropdown
                    LD_OutFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                    LD_OutFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    LD_OutFrame.Position = UDim2.new(0, 6, 0, 2)
                    LD_OutFrame.Size = UDim2.new(0, 183, 0, 22)
                    LD_OutFrame.ZIndex = -3

                    LD_InFrame.Name = "LD_InFrame"
                    LD_InFrame.Parent = LDropdown
                    LD_InFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    LD_InFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    LD_InFrame.Position = UDim2.new(0, 8, 0, 4)
                    LD_InFrame.Size = UDim2.new(0, 179, 0, 18)

                    LD_Button.Name = "LD_Button"
                    LD_Button.Parent = LDropdown
                    LD_Button.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                    LD_Button.BackgroundTransparency = 1.000
                    LD_Button.BorderSizePixel = 0
                    LD_Button.Position = UDim2.new(0, 12, 0, 4)
                    LD_Button.Size = UDim2.new(0, 172, 0, 18)
                    LD_Button.Font = Enum.Font.Code
                    LD_Button.Text = "Dropdown [" .. Def .. "]"
                    LD_Button.TextColor3 = Color3.fromRGB(255, 255, 255)
                    LD_Button.TextSize = 14.000
                    LD_Button.TextStrokeTransparency = 0.000
                    LD_Button.TextXAlignment = Enum.TextXAlignment.Left

                    LD_DScroll.Name = "LD_DScroll"
                    LD_DScroll.Parent = LD_Button
                    LD_DScroll.Active = true
                    LD_DScroll.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                    LD_DScroll.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    LD_DScroll.Position = UDim2.new(0, -4, 0, 25)
                    LD_DScroll.Size = UDim2.new(0, 179, 0, 0)
                    LD_DScroll.ScrollBarThickness = 5
                    LD_DScroll.Visible = false

                    LD_Dropdown.Name = "LD_Dropdown"
                    LD_Dropdown.Parent = LD_DScroll
                    LD_Dropdown.SortOrder = Enum.SortOrder.LayoutOrder

                    LD_ScrollInline.Name = "LD_ScrollInline"
                    LD_ScrollInline.Parent = LD_Button
                    LD_ScrollInline.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    LD_ScrollInline.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    LD_ScrollInline.Position = UDim2.new(0, -6, 1.25, 0)
                    LD_ScrollInline.Size = UDim2.new(0, 183, 0, 0)
                    LD_ScrollInline.ZIndex = 0
                    LD_ScrollInline.Visible = false

                    LD_DropdownArrow.Name = "LD_DropdownArrow"
                    LD_DropdownArrow.Parent = LDropdown
                    LD_DropdownArrow.BackgroundTransparency = 1.000
                    LD_DropdownArrow.Position = UDim2.new(0.842000008, 0, 0, 2)
                    LD_DropdownArrow.Size = UDim2.new(0, 21, 0, 21)
                    LD_DropdownArrow.ZIndex = 2
                    LD_DropdownArrow.Image = "rbxassetid://3926307971"
                    LD_DropdownArrow.ImageRectOffset = Vector2.new(324, 524)
                    LD_DropdownArrow.ImageRectSize = Vector2.new(36, 36)

                    local deb = false

                    local function toggleDrp()
                        if deb == false then
                            local num = 0
                            for i, v in pairs(LD_DScroll:GetChildren()) do
                                if v.Name == "Item" then
                                    num = num + 1
                                end
                            end
                            local size = 75
                            if num == 1 then
                                size = 18.75
                            elseif num == 2 then
                                size = 18.75 * 2
                            elseif num == 3 then
                                size = 18.75 * 3
                            end
                            if drp then
                                deb = true
                                TweenService:Create(LD_DropdownArrow, TweenInfo.new(.3), {
                                    Rotation = 0
                                }):Play()
                                TweenService:Create(LD_DScroll, TweenInfo.new(.3), {
                                    Size = UDim2.new(0, 179, 0, 0)
                                }):Play()
                                TweenService:Create(LD_ScrollInline, TweenInfo.new(.3), {
                                    Size = UDim2.new(0, 183, 0, 0)
                                }):Play()
                                TweenService:Create(LDropdown, TweenInfo.new(.3), {
                                    Size = UDim2.new(0, 196, 0, 26)
                                }):Play()
                                wait(.3)
                                LD_ScrollInline.Visible = false
                                LD_DScroll.Visible = false
                                drp = false
                                deb = false
                            else
                                deb = true
                                LD_ScrollInline.Visible = true
                                LD_DScroll.Visible = true
                                TweenService:Create(LD_DropdownArrow, TweenInfo.new(.3), {
                                    Rotation = 180
                                }):Play()
                                TweenService:Create(LD_DScroll, TweenInfo.new(.3), {
                                    Size = UDim2.new(0, 179, 0, size)
                                }):Play()
                                TweenService:Create(LD_ScrollInline, TweenInfo.new(.3), {
                                    Size = UDim2.new(0, 183, 0, size + 4)
                                }):Play()
                                TweenService:Create(LDropdown, TweenInfo.new(.3), {
                                    Size = UDim2.new(0, 196, 0, size + 33)
                                }):Play()
                                wait(.3)
                                drp = true
                                deb = false
                            end
                        end
                    end

                    local function CreateItem(ItemName)
                        ItemName = ItemName or "Item"
                        local Item = Instance.new("TextButton")

                        Item.Name = "Item"
                        Item.Parent = LD_DScroll
                        Item.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                        Item.BorderColor3 = Color3.fromRGB(255, 255, 255)
                        Item.BorderSizePixel = 0
                        Item.Size = UDim2.new(0, 179, 0, 18)
                        Item.ZIndex = 3
                        Item.AutoButtonColor = false
                        Item.Font = Enum.Font.Code
                        Item.Text = ItemName
                        Item.TextColor3 = Color3.fromRGB(255, 255, 255)
                        Item.TextSize = 14.000
                        Item.TextStrokeTransparency = 0.000
                        Item.TextTransparency = 0.2

                        Item.MouseEnter:Connect(function()
                            Item.TextTransparency = 0
                        end)

                        Item.MouseLeave:Connect(function()
                            Item.TextTransparency = 0.2
                        end)

                        Item.MouseButton1Click:Connect(function()
                            LD_Button.Text = "Dropdown [" .. ItemName .. "]"
                            if drp then
                                toggleDrp()
                            end
                        end)
                    end

                    LD_DScroll.CanvasSize = UDim2.new(0, 0, 0, LD_Dropdown.AbsoluteContentSize.Y + 3)

                    for i, v in pairs(List) do
                        CreateItem(v)
                    end

                    -- Effects

                    LD_Button.MouseButton1Click:Connect(function()
                        toggleDrp()
					end)

                    LD_Button.MouseEnter:Connect(function()
                        LD_OutFrame.BorderColor3 = Color3.fromRGB(255, 255, 255)
                    end)
                    LD_Button.MouseLeave:Connect(function()
                        LD_OutFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    end)
                end

                function Elements:Label(LblName)
                    LblName = LblName or 'Label';

                    -- Instances

                    local LLabel = Instance.new("Frame")
                    local LLabel_Title_2 = Instance.new("TextLabel")

                    -- Properties

                    LLabel.Name = "LLabel"
                    LLabel.Parent = LContent
                    LLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                    LLabel.BackgroundTransparency = 1.000
                    LLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
                    LLabel.BorderSizePixel = 0
                    LLabel.Size = UDim2.new(0, 196, 0, 22)

                    LLabel_Title_2.Name = "LLabel_Title"
                    LLabel_Title_2.Parent = LLabel
                    LLabel_Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    LLabel_Title_2.BackgroundTransparency = 1.000
                    LLabel_Title_2.BorderSizePixel = 0
                    LLabel_Title_2.Position = UDim2.new(0, 8, 0, 3)
                    LLabel_Title_2.Size = UDim2.new(0, 190, 0, 15)
                    LLabel_Title_2.Font = Enum.Font.Code
                    LLabel_Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
                    LLabel_Title_2.TextSize = 14.000
                    LLabel_Title_2.TextStrokeTransparency = 0.000
                    LLabel_Title_2.TextXAlignment = Enum.TextXAlignment.Left
                end

                function Elements:Slider(SldName, SliderConfig, Callback)
                    SldName = SldName or "Slider"
                    local Min = SliderConfig.Min or 0
                    local Max = SliderConfig.Max or 100
                    local Def = SliderConfig.Def or Min
                    local Precise = SliderConfig.Precise or false
                    local Prefix = SliderConfig.Prefix or ""
                    local DecPoint = SliderConfig.DecPoint or 1
                    Callback = Callback or function()end
                    local connected = false

                    -- Instances

                    local LSlider = Instance.new("Frame")
                    local LS_InFrame = Instance.new("Frame")
                    local LS_OutFrame = Instance.new("Frame")
                    local LS_Button = Instance.new("TextButton")
                    local LS_Title = Instance.new("TextLabel")
                    local LS_Value = Instance.new("TextLabel")

                    -- Properties

                    LSlider.Name = "LSlider"
                    LSlider.Parent = LContent
                    LSlider.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
                    LSlider.BackgroundTransparency = 1.000
                    LSlider.BorderColor3 = Color3.fromRGB(27, 42, 53)
                    LSlider.BorderSizePixel = 0
                    LSlider.Size = UDim2.new(0, 196, 0, 26)

                    LS_InFrame.Name = "LS_InFrame"
                    LS_InFrame.Parent = LSlider
                    LS_InFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    LS_InFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    LS_InFrame.Position = UDim2.new(0, 8, 0, 4)
                    LS_InFrame.Size = UDim2.new(0, 179, 0, 18)

                    LS_OutFrame.Name = "LS_OutFrame"
                    LS_OutFrame.Parent = LSlider
                    LS_OutFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                    LS_OutFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    LS_OutFrame.Position = UDim2.new(0, 6, 0, 2)
                    LS_OutFrame.Size = UDim2.new(0, 183, 0, 22)
                    LS_OutFrame.ZIndex = -3

                    LS_Button.Name = "LS_Button"
                    LS_Button.Parent = LSlider
                    LS_Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                    LS_Button.BorderSizePixel = 0
                    LS_Button.Position = UDim2.new(0.0408163257, 0, 0.153846145, 0)
                    LS_Button.Size = UDim2.new(0, 179, 0, 18)
                    LS_Button.Font = Enum.Font.SourceSans
                    LS_Button.Text = ""
                    LS_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
                    LS_Button.TextSize = 14.000
                    LS_Button.AutoButtonColor = false

                    local DefVal = Precise and string.format("%." .. tostring(DecPoint) .. "f", tostring((Def / Max) * (Max - Min) + Min)) or tostring(math.floor((Def / Max) * (Max - Min) + Min))

                    LS_Title.Name = "LS_Title"
                    LS_Title.Parent = LS_Button
                    LS_Title.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                    LS_Title.BackgroundTransparency = 1.000
                    LS_Title.BorderSizePixel = 0
                    LS_Title.Size = UDim2.new(0, 179, 0, 18)
                    LS_Title.ZIndex = 6
                    LS_Title.Font = Enum.Font.Code
                    LS_Title.Text = SldName .. ": " .. DefVal .. Prefix
                    LS_Title.TextColor3 = Color3.fromRGB(255, 255, 255)
                    LS_Title.TextSize = 14.000
                    LS_Title.TextStrokeTransparency = 0.000

                    LS_Value.Name = "LS_Value"
                    LS_Value.Parent = LS_Button
                    LS_Value.BackgroundColor3 = Color3.fromRGB(255, 55, 55)
                    LS_Value.BorderSizePixel = 0
                    if Precise == true then
                        LS_Value.Size = UDim2.new(0, (Def / Max) * (Max - Min) + Min, 0, 18)
                    else
                        LS_Value.Size = UDim2.new(0, math.floor((Def / Max) * (Max - Min) + Min), 0, 18)
                    end
                    LS_Value.ZIndex = 3
                    LS_Value.Font = Enum.Font.SourceSans
                    LS_Value.Text = ""
                    LS_Value.TextColor3 = Color3.fromRGB(0, 0, 0)
                    LS_Value.TextSize = 14.000

                    -- Effects

                local function move(input)
                    local Calc = math.clamp((input.Position.X - LS_Button.AbsolutePosition.X) / LS_Button.AbsoluteSize.X, 0, 1)
                    local Value = Precise and string.format("%." .. tostring(DecPoint) .. "f", tostring(((Calc * Max) / Max) * (Max - Min) + Min)) or tostring(math.floor(((Calc * Max) / Max) * (Max - Min) + Min))
                    LS_Value:TweenSize(UDim2.new(Calc, 0, 0, 18), "Out", "Sine", 0.1, true)
                    LS_Title.Text = SldName .. ": " .. Value .. Prefix
                    pcall(Callback, Value)
                end
                LS_Button.InputBegan:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            connected = true
                        end
                    end
                )
                LS_Button.InputEnded:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            connected = false
                        end
                    end
                )
                game:GetService("UserInputService").InputChanged:Connect(
                function(input)
                    if connected and input.UserInputType == Enum.UserInputType.MouseMovement then
                        move(input)
                    end
                end
                )

                LS_Button.MouseEnter:Connect(function()
                    LS_OutFrame.BorderColor3 = Color3.fromRGB(255, 255, 255)
                end)
                LS_Button.MouseLeave:Connect(function()
                    LS_OutFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                end)

                end

                function Elements:Toggle(TglName, Def, Callback)
                    TglName = TglName or "Toggle"
                    Def = Def or false
                    Callback = Callback or function()end

                    -- Instances

                    local LToggle = Instance.new("Frame")
                    local LT_ToggleTitle = Instance.new("TextLabel")
                    local LT_OutFrame = Instance.new("Frame")
                    local LT_InFrame = Instance.new("Frame")
                    local LT_Button = Instance.new("TextButton")

                    -- Properties

                    LToggle.Name = "LToggle"
                    LToggle.Parent = LContent
                    LToggle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                    LToggle.BackgroundTransparency = 1.000
                    LToggle.BorderColor3 = Color3.fromRGB(27, 42, 53)
                    LToggle.BorderSizePixel = 0
                    LToggle.Size = UDim2.new(0, 196, 0, 22)

                    LT_ToggleTitle.Name = "LT_ToggleTitle"
                    LT_ToggleTitle.Parent = LToggle
                    LT_ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    LT_ToggleTitle.BackgroundTransparency = 1.000
                    LT_ToggleTitle.BorderSizePixel = 0
                    LT_ToggleTitle.Position = UDim2.new(0, 28, 0, 2)
                    LT_ToggleTitle.Size = UDim2.new(0, 168, 0, 15)
                    LT_ToggleTitle.Font = Enum.Font.Code
                    LT_ToggleTitle.Text = TglName
                    LT_ToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                    LT_ToggleTitle.TextSize = 14.000
                    LT_ToggleTitle.TextStrokeTransparency = 0.000
                    LT_ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left

                    LT_OutFrame.Name = "LT_OutFrame"
                    LT_OutFrame.Parent = LToggle
                    LT_OutFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                    LT_OutFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    LT_OutFrame.Position = UDim2.new(0, 6, 0, 3)
                    LT_OutFrame.Size = UDim2.new(0, 14, 0, 14)

                    LT_InFrame.Name = "LT_InFrame"
                    LT_InFrame.Parent = LToggle
                    LT_InFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                    LT_InFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    LT_InFrame.Position = UDim2.new(0, 8, 0, 5)
                    LT_InFrame.Size = UDim2.new(0, 10, 0, 10)

                    LT_Button.Name = "LT_Button"
                    LT_Button.Parent = LToggle
                    LT_Button.BackgroundColor3 = Color3.fromRGB(255, 55, 55)
                    LT_Button.BorderSizePixel = 0
                    LT_Button.Position = UDim2.new(0, 8, 0, 5)
                    LT_Button.Size = UDim2.new(0, 10, 0, 10)
                    LT_Button.Font = Enum.Font.SourceSans
                    LT_Button.Text = ""
                    LT_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
                    LT_Button.TextSize = 14.000

                    -- Effects

                    if Def then
                        LT_Button.BackgroundTransparency = 0
                        pcall(Callback, true)
                    else
                        LT_Button.BackgroundTransparency = 1
                    end

                    LT_Button.MouseButton1Click:Connect(function()
						if Def then
                            LT_Button.BackgroundTransparency = 1
                            pcall(Callback, false)
                            Def = false
                        else
                            LT_Button.BackgroundTransparency = 0
                            pcall(Callback, true)
                            Def = true
                        end
					end)


					LT_Button.MouseEnter:Connect(function()
						LT_OutFrame.BorderColor3 = Color3.fromRGB(255,255,255)
					end)

					LT_Button.MouseLeave:Connect(function()
						LT_OutFrame.BorderColor3 = Color3.fromRGB(0,0,0)
					end)
                end

                function Elements:KToggle(TglName, Def, Callback)
                    TglName = TglName or "Toggle Bind"
                    Def = Def or false
                    Callback = Callback or function()end
                    local Key
                    local changeCon = false

                    -- Instances

                    local LToggleBind = Instance.new("Frame")
                    local LTB_ToggleTitle = Instance.new("TextLabel")
                    local LTB_OutFrame = Instance.new("Frame")
                    local LTB_InFrame = Instance.new("Frame")
                    local LTB_Button = Instance.new("TextButton")
                    local LTB_BindText = Instance.new("TextButton")

                    -- Properties

                    LToggleBind.Name = "LToggleBind"
                    LToggleBind.Parent = LContent
                    LToggleBind.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                    LToggleBind.BackgroundTransparency = 1.000
                    LToggleBind.BorderColor3 = Color3.fromRGB(27, 42, 53)
                    LToggleBind.BorderSizePixel = 0
                    LToggleBind.Size = UDim2.new(0, 196, 0, 22)

                    LTB_ToggleTitle.Name = "LTB_ToggleTitle"
                    LTB_ToggleTitle.Parent = LToggleBind
                    LTB_ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    LTB_ToggleTitle.BackgroundTransparency = 1.000
                    LTB_ToggleTitle.BorderSizePixel = 0
                    LTB_ToggleTitle.Position = UDim2.new(0, 28, 0, 2)
                    LTB_ToggleTitle.Size = UDim2.new(0, 170, 0, 15)
                    LTB_ToggleTitle.Font = Enum.Font.Code
                    LTB_ToggleTitle.Text = "Toggle Bind"
                    LTB_ToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                    LTB_ToggleTitle.TextSize = 14.000
                    LTB_ToggleTitle.TextStrokeTransparency = 0.000
                    LTB_ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left

                    LTB_OutFrame.Name = "LTB_OutFrame"
                    LTB_OutFrame.Parent = LToggleBind
                    LTB_OutFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                    LTB_OutFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    LTB_OutFrame.Position = UDim2.new(0, 6, 0, 3)
                    LTB_OutFrame.Size = UDim2.new(0, 14, 0, 14)

                    LTB_InFrame.Name = "LTB_InFrame"
                    LTB_InFrame.Parent = LToggleBind
                    LTB_InFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                    LTB_InFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    LTB_InFrame.Position = UDim2.new(0, 8, 0, 5)
                    LTB_InFrame.Size = UDim2.new(0, 10, 0, 10)

                    LTB_Button.Name = "LTB_Button"
                    LTB_Button.Parent = LToggleBind
                    LTB_Button.BackgroundColor3 = Color3.fromRGB(255, 55, 55)
                    LTB_Button.BorderSizePixel = 0
                    LTB_Button.Position = UDim2.new(0, 8, 0, 5)
                    LTB_Button.Size = UDim2.new(0, 10, 0, 10)
                    LTB_Button.Font = Enum.Font.SourceSans
                    LTB_Button.Text = ""
                    LTB_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
                    LTB_Button.TextSize = 14.000

                    LTB_BindText.Name = "LTB_BindText"
                    LTB_BindText.Parent = LToggleBind
                    LTB_BindText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    LTB_BindText.BackgroundTransparency = 1.000
                    LTB_BindText.BorderSizePixel = 0
                    LTB_BindText.Position = UDim2.new(0, 110, 0, 2)
                    LTB_BindText.Size = UDim2.new(0, 80, 0, 15)
                    LTB_BindText.Font = Enum.Font.Code
                    LTB_BindText.Text = "[...]"
                    LTB_BindText.TextColor3 = Color3.fromRGB(255, 255, 255)
                    LTB_BindText.TextSize = 14.000
                    LTB_BindText.TextXAlignment = Enum.TextXAlignment.Right

                    -- Effects

                    LTB_Button.MouseEnter:Connect(function()
                        LTB_OutFrame.BorderColor3 = Color3.fromRGB(255,255,255)
                    end)

                    LTB_Button.MouseLeave:Connect(function()
                        LTB_OutFrame.BorderColor3 = Color3.fromRGB(0,0,0)
                    end)

                    LTB_Button.MouseButton1Click:Connect(function()
                        if Def then
                            LTB_Button.BackgroundTransparency = 1
                            pcall(Callback, false)
                            Def = false
                        else
                            LTB_Button.BackgroundTransparency = 0
                            pcall(Callback, true)
                            Def = true
                        end
                    end)


                    LTB_BindText.MouseButton1Click:Connect(function()
                        changeCon = true
                        changeCon = true
                        LTB_BindText.Text = "[NULL]"
                    end)

                    LTB_BindText.MouseButton2Click:Connect(function()
                        if changeCon == false and LTB_BindText.Text ~= "[...]" then
                            changeCon = false
                            LTB_BindText.Text = "[...]"
                            Key = nil;
                            game:GetService("StarterGui"):SetCore("SendNotification", {
                                Title = "Advancedware";
                                Text = "Bind Cleared";
                                Icon = "";
                                Duration = 3;
                            })
                        end
                    end)

                    local Binds = {
                        ["Shift"] = "-Shift",
                        ["Alt"] = "-Alt",
                        ['Control'] = "-CTRL",
                        ['CapsLock'] = "CpsLck",
                        ['Return'] = "Enter",
                        ['Backquote'] = '`',
                        ['Escape'] = 'Esc',
                        ['Left'] = "L",
                        ["Right"] = "R",
                        ["Delete"] = "Del",
                        ['One'] = "1",
                        ["Two"] = "2",
                        ['Three'] = "3",
                        ["Four"] = "4",
                        ["Five"] = "5",
                        ["Six"] = "6",
                        ["Seven"] = "7",
                        ['Eight'] = "8",
                        ['Nine'] = "9",
                        ['Zero'] = "0"
                    }

                    local BlackBinds = {
                        'End'
                    }

                    if Def then
                        LTB_Button.BackgroundTransparency = 0
                        pcall(Callback, true)
                    else
                        LTB_Button.BackgroundTransparency = 1
                    end

                    UserInputService.InputBegan:Connect(function(input)
                        if changeCon == false and Key ~= nil and input.KeyCode == Key then
                            if Def then
                                LTB_Button.BackgroundTransparency = 1
                                pcall(Callback, false)
                                Def = false
                            else
                                LTB_Button.BackgroundTransparency = 0
                                pcall(Callback, true)
                                Def = true
                            end
                        end
                    end)

                    UserInputService.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.Keyboard then
                            if changeCon == true then
                                local Value = tostring(input.KeyCode):gsub("Enum.KeyCode.", "")

                                for i, v in pairs(Binds) do
                                    if Value:match(i) then
                                        Value = Value:gsub(i, v)
                                    end
                                end
                                if not table.find(BlackBinds, Value) then
                                    Key = input.KeyCode
                                    LTB_BindText.Text = "[" .. Value:upper() .. "]"
                                    task.wait(.1)
                                    changeCon = false
                                end
                            end
                        end
                    end)

                    UserInputService.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton2 then
                            if changeCon == true then
                                changeCon = false
                                LTB_BindText.Text = "[...]"
                                game:GetService("StarterGui"):SetCore("SendNotification", {
                                    Title = "Advancedware";
                                    Text = "Input Cancelled";
                                    Icon = "";
                                    Duration = 3;
                                })
                            end
                        end
                    end)
                end
            end
            return Elements
        end
        return Sections
    end
    return Tabs
end
return Library
