*crypto3.9compatibility
asInteger
	"Answer the integer value of my current contents."

	^ (hi bitShift: 16) + low
