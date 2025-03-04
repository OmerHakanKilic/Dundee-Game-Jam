extends Node

var treasury:int=30
var popularity:int=40
var climate:int=30
var leadership:int=30

var currentTurn = 0

var midgameStart = 8
var endgameStart = 16
var gameLength = 24

var shouldReset = false

var flags : Dictionary={}

var gameLost = false

#Settings

var volume:int=50
var colorblindMode:bool=false
