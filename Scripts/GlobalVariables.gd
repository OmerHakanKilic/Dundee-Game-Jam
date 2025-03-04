extends Node

var treasury:int=30
var popularity:int=40
var climate:int=30
var leadership:int=30

var currentTurn = 0

var midgameStart = 10
var endgameStart = 20

var currentEventId:int=0
var flags : Dictionary={}

var gameLost = false

#Settings

var volume:int=50
var colorblindMode:bool=false
