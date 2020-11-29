"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

I represent a medium asteroid subclass of the Asteroid 

I know what to do when colliding with an object. For example when colliding whit a projectile
I spawn 2 smaller asteroids

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #MediumAsteroid,
	#superclass : #Asteroid,
	#category : #Asteroids
}

{ #category : #initialization }
MediumAsteroid >> initialize [ 
	super initialize.
	self color: Color yellow.
	self borderColor: Color black.
	self borderWidth: 2.
	self extent: (self extent*2).
	velX := (-3 to: 3) atRandom.
	(velX = 0) ifTrue: (velX := 4). 
	velY := (-3 to: 3) atRandom.
	(velY = 0) ifTrue: (velY := -4).

	
]

{ #category : #'collision event' }
MediumAsteroid >> spawnSmallerAsteroid: aNumber [
	| newAsteroid splitAngle |
	newAsteroid := SmallAsteroid new.
	newAsteroid position: (self position).
	splitAngle := (velX / ((velY*velY) + (velX*velX) raisedTo: 0.5)) arcCos radiansToDegrees + 						aNumber.
	newAsteroid velX: (splitAngle cos) * 5.
	newAsteroid velY: (splitAngle sin) * 5.
	self owner addMorph: newAsteroid.
	^newAsteroid

]
