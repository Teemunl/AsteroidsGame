"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

I represent the projectile class and know my lifetime


- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	lifeTime:		<Object>
	velX:		<Object>
	velY:		<Object>


    Implementation Points
"
Class {
	#name : #Projectile,
	#superclass : #CircleMorph,
	#traits : 'AsteroidsGameObject',
	#classTraits : 'AsteroidsGameObject classTrait',
	#instVars : [
		'velX',
		'velY',
		'lifeTime'
	],
	#category : #Asteroids
}

{ #category : #'as yet unclassified' }
Projectile >> detectCollision: aMorph [
	(self bounds intersects: aMorph bounds)
	ifTrue: [ aMorph handleProjectileCollision: self.]
]

{ #category : #initialization }
Projectile >> initialize [ 
	super initialize.
	self color: Color yellow.
	self borderColor: Color yellow.
	self extent: (self extent*0.10).
	lifeTime := 40.

	
]

{ #category : #initialization }
Projectile >> lifeHandler [
	lifeTime := lifeTime -1.
	(lifeTime < 0) ifTrue:[self delete ].
]

{ #category : #accessing }
Projectile >> lifeTime [
	^lifeTime
]

{ #category : #accessing }
Projectile >> lifeTime: aNumber [
	lifeTime := aNumber
	
]

{ #category : #'stepping and presenter' }
Projectile >> step [ 
	super.
	self top: (self top + velY).
	self left: (self left + velX).
	self cornerHandler.
	self lifeHandler.

]

{ #category : #stepping }
Projectile >> stepTime [ 
	^20
]

{ #category : #accessing }
Projectile >> velX [
	^ velX
]

{ #category : #accessing }
Projectile >> velX: anNumber [
	velX := anNumber
]

{ #category : #accessing }
Projectile >> velY [
	^ velY
]

{ #category : #accessing }
Projectile >> velY: anNumber [
	velY := anNumber
]
