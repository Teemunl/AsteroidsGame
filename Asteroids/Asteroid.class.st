"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

I represent the Asteroid class

I move around in the game world and handle collisions.

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	velX:		<Object>
	velY:		<Object>


    Implementation Points
"
Class {
	#name : #Asteroid,
	#superclass : #CircleMorph,
	#traits : 'AsteroidsGameObject',
	#classTraits : 'AsteroidsGameObject classTrait',
	#instVars : [
		'velX',
		'velY'
	],
	#classInstVars : [
		'wrapOver'
	],
	#category : #Asteroids
}

{ #category : #'as yet unclassified' }
Asteroid >> detectCollision: aMorph [ 
	(self bounds intersects: aMorph bounds)
		ifTrue: [ aMorph handleAsteroidCollision: self ].
]

{ #category : #'as yet unclassified' }
Asteroid >> handleProjectileCollision: aProjectile [  
	self removeAsteroid: aProjectile.
]

{ #category : #'as yet unclassified' }
Asteroid >> handleShipCollision: aShip [
	self owner shipCollidedAsteroid: self.

]

{ #category : #removing }
Asteroid >> removeAsteroid: aProjectile [
	| collisionAngle | 
	"Spawns smaller asteroids and destroys self."
	collisionAngle := (self center bearingToPoint: aProjectile center) radiansToDegrees.
	self spawnSmallerAsteroid: collisionAngle+45.
	self spawnSmallerAsteroid: collisionAngle-45.
	owner removeMorph: self.
	self delete.

	
]

{ #category : #'collision event' }
Asteroid >> spawnSmallerAsteroid: 
	subclassResponsibility [.
]

{ #category : #'stepping and presenter' }
Asteroid >> step [
	super.
	self top: (self top + velY).
	self left:(self left - velX).
	self cornerHandler .
]

{ #category : #'stepping and presenter' }
Asteroid >> stepTime [ 
	^40
]

{ #category : #accessing }
Asteroid >> velX [
	^ velX
]

{ #category : #accessing }
Asteroid >> velX: anNumber [
	velX := anNumber
]

{ #category : #accessing }
Asteroid >> velY [
	^ velY
]

{ #category : #accessing }
Asteroid >> velY: anNumber [
	velY := anNumber
]
