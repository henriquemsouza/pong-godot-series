extends Node2D


onready var screenWidth = get_tree().get_root().size.x
onready var screenHeight = get_tree().get_root().size.y
onready var halfScreenWidth =  screenWidth/2
onready var halfScreenHeight =  screenHeight/2


var paddleColor = Color.aqua
var paddleSizee =  Vector2(10.0,100.0)
var haldPaddleHeight =  paddleSizee.y/2
var paddlePadding = 10.0

var ballRadius = 10.0
var ballColor =  Color.chocolate
onready var ballPosition = Vector2(halfScreenWidth,halfScreenHeight)

onready	var playerPosition =  Vector2(paddlePadding, halfScreenHeight - haldPaddleHeight)
onready var playerRectangle = Rect2(playerPosition, paddleSizee)

onready var aiPosition =  Vector2(
		screenWidth -( paddlePadding +paddleSizee.x), 
		halfScreenHeight - haldPaddleHeight
	)
onready var aiRectangle = Rect2(aiPosition, paddleSizee)

var stringPosition


var font = DynamicFont.new()
var robotoFile = load("res://Roboto-Light.ttf")
var fontSize = 24
var halfWidthFont
var heightFont
var stringValue ="HELOWW"


func _ready() -> void:
	font.font_data = robotoFile
	font.size =  fontSize
	halfWidthFont =  font.get_string_size(stringValue).x/2
	heightFont = font.get_height()
	stringPosition = Vector2( halfScreenWidth -halfWidthFont,
		heightFont
	)
	

	
func _physics_process(_delta: float) -> void:
	pass
	
func _draw() -> void:
	setStartPOsition()
	
	
func setStartPOsition():
	draw_circle(ballPosition, ballRadius, ballColor)
	
	draw_rect(playerRectangle, paddleColor)
	draw_rect(aiRectangle ,paddleColor)
	
	draw_string(font,stringPosition,stringValue)
	
