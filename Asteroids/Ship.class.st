"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

I represent the ship that the player controls by using arrow keys 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	hpBar:		<Object>
	velX:		<Object>
	velY:		<Object>


    Implementation Points
"
Class {
	#name : #Ship,
	#superclass : #PolygonMorph,
	#traits : 'AsteroidsGameObject',
	#classTraits : 'AsteroidsGameObject classTrait',
	#instVars : [
		'velX',
		'velY',
		'hpBar'
	],
	#classInstVars : [
		'hpBar'
	],
	#category : #Asteroids
}

{ #category : #'as yet unclassified' }
Ship >> detectCollision: aMorph [
	(self bounds intersects: aMorph bounds)
		ifTrue: [ aMorph handleShipCollision: self ]
]

{ #category : #'as yet unclassified' }
Ship >> handleAsteroidCollision: anAsteroid [
	self owner shipCollidedAsteroid: anAsteroid.
]

{ #category : #initialization }
Ship >> initialize [
	super initialize.
	vertices  := { 10@15. 5@0. 15@0. }.
	self extent: (self extent) *1.5.
	color := Color black.
	borderWidth := 1 .
	borderColor := Color white.
	smoothCurve := false.
	closed := true.
	velX := 0.
	velY := 0.
	
]

{ #category : #'game controls' }
Ship >> rotateLeft [
	self rotationDegrees:  (self rotationDegrees -25)
]

{ #category : #'game controls' }
Ship >> rotateRight [
	self rotationDegrees:  (self rotationDegrees + 25)
]

{ #category : #stepping }
Ship >> step [ 
	super step.
	self top: (self top + velY).
	self left: (self left + velX).
	self cornerHandler .

]

{ #category : #stepping }
Ship >> stepTime [ 
	^40
	
]

{ #category : #'game controls' }
Ship >> thrust [ 
	| headingInRadians |
	headingInRadians := (self heading + 90) degreesToRadians.
	velY := velY + (headingInRadians sin).
	velX := velX + (headingInRadians cos).

]

{ #category : #accessing }
Ship >> velX [
	^ velX
]

{ #category : #accessing }
Ship >> velX: anNumber [
	velX := anNumber
]

{ #category : #accessing }
Ship >> velY [
	^ velY
]

{ #category : #accessing }
Ship >> velY: anNumber [
	velY := anNumber
]
