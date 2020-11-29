"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

I represent a small asteroid subclass of the Asteroid 

I know what to do when colliding with an object. For example when colliding whit a projectile
I am destroyed.

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	destroyed:		<Object>


    Implementation Points
"
Class {
	#name : #SmallAsteroid,
	#superclass : #Asteroid,
	#instVars : [
		'destroyed'
	],
	#category : #Asteroids
}

{ #category : #initialization }
SmallAsteroid >> initialize [ 
	super initialize.
	self color: Color red.
	self borderColor: Color red.
	self borderWidth: 2.
	self extent: (self extent).
	velX := (-5 to: 5) atRandom.
	(velX = 0) ifTrue: (velX := 5). 
	velY := (-5 to: 5) atRandom.
	(velY = 0) ifTrue: (velY := -5).
	destroyed := false.
	
]

{ #category : #'collision event' }
SmallAsteroid >> removeAsteroid: aProjectile [
	destroyed := true.
]

{ #category : #stepping }
SmallAsteroid >> step [ 
 super step.
 destroyed
	ifFalse:[^ self].
	self owner smallAsteroidRemoved. 
	self delete.
 
]
