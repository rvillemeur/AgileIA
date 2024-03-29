"
An instance of the perceptron.

"
Class {
	#name : #Neuron,
	#superclass : #Object,
	#instVars : [
		'weights',
		'bias'
	],
	#category : #NeuralNetwork
}

{ #category : #accessing }
Neuron >> bias [
	^ bias
]

{ #category : #accessing }
Neuron >> bias: aNumber [
	bias := aNumber
]

{ #category : #accessing }
Neuron >> feed: inputs [
	| z |
	z := (inputs with: weights collect: [ :x :w | x * w ]) sum + bias.
	^ z > 0
		ifTrue: [ 1 ]
		ifFalse: [ 0 ]
]

{ #category : #accessing }
Neuron >> train: inputs desiredOutputs: desiredOutput [
	| learningRate theError output newWeight |
	output := self feed: inputs.
	learningRate := 0.1.
	theError := desiredOutput - output.
	inputs
		withIndexDo: [ :anInput :index | 
			newWeight := (weights at: index) * (learningRate * theError * anInput).
			weights at: index put: newWeight ].
	bias := bias + (learningRate * theError)
]

{ #category : #accessing }
Neuron >> weights [
^weights
]

{ #category : #accessing }
Neuron >> weights: someWeightsAsNumbers [
 weights := someWeightsAsNumbers 
]
