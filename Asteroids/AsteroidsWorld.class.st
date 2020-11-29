"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

I represent the game world and handle drawing the morphs.

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	asteroidsLeft:		<Object>
	projectiles:		<Object>
	ship:		<Object>


    Implementation Points
"
Class {
	#name : #AsteroidsWorld,
	#superclass : #PanelMorph,
	#traits : 'AsteroidsGameObject',
	#classTraits : 'AsteroidsGameObject classTrait',
	#instVars : [
		'ship',
		'projectiles',
		'asteroidsLeft'
	],
	#classInstVars : [
		'ship',
		'projectiles'
	],
	#category : #Asteroids
}

{ #category : #'as yet unclassified' }
AsteroidsWorld >> detectCollision [
	1 to: submorphs size do: 
		[ :i 	| i+1 to: submorphs size do: 
			[ :j | (submorphs at: i) detectCollision: (submorphs at: j)]].


]

{ #category : #initialization }
AsteroidsWorld >> initialize [
	super initialize.
	self extent: 640@480.
	self spawnShip.
	self spawnAsteroids.
	self fillStyle: Color blue.
	projectiles := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
AsteroidsWorld >> shipCollidedAsteroid: anAsteroid [ 
	self owner damageDealt.

]

{ #category : #'as yet unclassified' }
AsteroidsWorld >> shipHpLeft [
	^ ship hpLeft
]

{ #category : #'game controls' }
AsteroidsWorld >> shootProjectile [
	|shot x y|
	shot := Projectile new.
	x := (ship center x - (20*((ship heading + 90 ) degreesToRadians )cos)).
	y := (ship center y - (20*((ship heading + 90 ) degreesToRadians )sin)).
	
	self addMorph: shot.
	shot position: x@y.
	shot velY: -5*(((ship heading + 90) degreesToRadians) sin).
	shot velX: -5*(((ship heading + 90) degreesToRadians) cos).
	
	
]

{ #category : #'as yet unclassified' }
AsteroidsWorld >> smallAsteroidRemoved [
	asteroidsLeft := asteroidsLeft - 1.
	(asteroidsLeft < 1) ifTrue: [ self owner gameWon]
]

{ #category : #'instance creation' }
AsteroidsWorld >> spawnAsteroids [
	|asteroid|
	asteroid := BigAsteroid new.
	self addMorph: asteroid.
	asteroid position: 420@60.
	
	asteroid := BigAsteroid new.
	self addMorph: asteroid.
	asteroid position: 650@60.

	asteroid := BigAsteroid new.
	self addMorph: asteroid.
	asteroid position: 60@60.
	asteroidsLeft := 12
]

{ #category : #'instance creation' }
AsteroidsWorld >> spawnShip [
	ship := Ship new.
	self addMorph: ship.
	ship position: 420@250.
	^ship
	
]

{ #category : #'stepping and presenter' }
AsteroidsWorld >> step [
	self detectCollision.
	
]

{ #category : #stepping }
AsteroidsWorld >> stepTime [
	^50
]

{ #category : #'stepping and presenter' }
AsteroidsWorld >> stopStepping [ 
	super stopStepping.
	self submorphs do: [:submorph | submorph stopStepping].
]

{ #category : #'game controls' }
AsteroidsWorld >> thrustShip [
	ship thrust.
	self shootProjectile.
]

{ #category : #'game controls' }
AsteroidsWorld >> turnShipLeft [
	ship rotateLeft.
]

{ #category : #'game controls' }
AsteroidsWorld >> turnShipRight [
	ship rotateRight.
]
