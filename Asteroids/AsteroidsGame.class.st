"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

I represent the game world and handle keystrokes and gamestate.

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	asteroidsWorld:		<Object>
	endScreen:		<Object>
	hpLeft:		<Object>


    Implementation Points
"
Class {
	#name : #AsteroidsGame,
	#superclass : #SystemWindow,
	#instVars : [
		'asteroidsWorld',
		'hpLeft',
		'endScreen'
	],
	#category : #Asteroids
}

{ #category : #playing }
AsteroidsGame class >> play [
	self new
		openInWorld.
		
]

{ #category : #'as yet unclassified' }
AsteroidsGame >> createEndScreen [
	endScreen := TextMorph new.
	self updateGameState.
	^endScreen
]

{ #category : #initialization }
AsteroidsGame >> createWorld [
	asteroidsWorld := AsteroidsWorld new.
	self addMorph: asteroidsWorld frame: (0@0 corner: 1@1).
	^asteroidsWorld
]

{ #category : #'as yet unclassified' }
AsteroidsGame >> damageDealt [
 hpLeft := hpLeft  - 1.
 self updateGameState.
 (hpLeft < 1 ) ifTrue: [ self gameOver ]
]

{ #category : #'as yet unclassified' }
AsteroidsGame >> gameOver [
	asteroidsWorld stopStepping.
	endScreen contents:'You ran out of health, Game Over'.
]

{ #category : #'as yet unclassified' }
AsteroidsGame >> gameWon [ 
   asteroidsWorld stopStepping.
	endScreen contents:'You won the game, Hurray!'.
]

{ #category : #'event processing' }
AsteroidsGame >> handleKeyDown: anEvent [
   ^true
]

{ #category : #'event handling' }
AsteroidsGame >> handleMouseEnter: anEvent [ 
 anEvent hand newMouseFocus: self.
 anEvent hand newKeyboardFocus: self.
]

{ #category : #'event handling' }
AsteroidsGame >> handleMouseLeave: anEvent [ 
 anEvent hand newMouseFocus: nil.
 anEvent hand newKeyboardFocus: nil.
]

{ #category : #'event handling' }
AsteroidsGame >> handlesKeyboard: anEvent [ 
 ^true

]

{ #category : #'event handling' }
AsteroidsGame >> handlesMouseOver: anEvent [ 
  ^true
]

{ #category : #initialization }
AsteroidsGame >> initialize [ 
	super initialize.
	self color: Color blue.
	self extent: 640@480.
	self setLabel: 'Asteroids';
	               addMorph: self createEndScreen;
						beUnresizeable.

	self takeKeyboardFocus. 
	self handlesKeyUp: true.

	self newGame.
]

{ #category : #'event handling' }
AsteroidsGame >> keyStroke: anEvent [ 
	|keyValue|.
	
	keyValue := anEvent keyValue.
	
	keyValue = $+ asciiValue
		ifTrue: [ self startStepping ].
	keyValue = $- asciiValue
		ifTrue: [ self stopStepping ].


	keyValue = 30 
		ifTrue: [ asteroidsWorld thrustShip  ].
	keyValue = 29
	    ifTrue: [ asteroidsWorld turnShipRight ] .
	keyValue = 28
		 ifTrue: [ asteroidsWorld turnShipLeft ].
]

{ #category : #'instance creation' }
AsteroidsGame >> newGame [
	asteroidsWorld := self createWorld.
	hpLeft := 30.
	self updateGameState.
]

{ #category : #'as yet unclassified' }
AsteroidsGame >> updateGameState [
	endScreen contents: 'Hp left: ' ,hpLeft asString.
]
