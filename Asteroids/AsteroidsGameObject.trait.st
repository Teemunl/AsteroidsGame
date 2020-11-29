"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

I am a trait class that has traits of the other objects such as collisions and corner handling.

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Trait {
	#name : #AsteroidsGameObject,
	#category : #Asteroids
}

{ #category : #accessing }
AsteroidsGameObject >> cornerHandler [ 
	self bottom < self owner top 
			ifTrue: [self top: self  owner bottom].
			
	self top > self owner bottom 
			ifTrue: [self bottom: self  owner top].
	
	self right < self owner left
			ifTrue: [ self left: self owner right].
		
	self left > self owner right
			ifTrue: [ self right: self owner left ].
			
]

{ #category : #'as yet unclassified' }
AsteroidsGameObject >> detectCollision: anAsteroidsGameObject [
	self subclassResponsibility

]

{ #category : #'as yet unclassified' }
AsteroidsGameObject >> handleAsteroidCollision: anAsteroid [
]

{ #category : #'as yet unclassified' }
AsteroidsGameObject >> handleProjectileCollision: aProjectile [
]

{ #category : #'as yet unclassified' }
AsteroidsGameObject >> handleShipCollision: aShip [
]
