extends Spatial

var NodosHijos =  null #creo variable de tipo arreglo
	

#Called when the node enters the scene tree for the first time.
func _ready():
	NodosHijos = get_children()
	
	
	for i in NodosHijos:
		var newCuerpoRigido = RigidBody.new()#crea un nodo RigidBody
		i.create_trimesh_collision()#crea las colsiones y las mallas
		
		var colision = i.get_child(0).get_child(0)
		print(i.get_child(0).name)
		
		#i.remove_child(colision)
		#i.get_parent().add_child(colision)
		#i.queue_free()
		newCuerpoRigido.sleeping = true#el cuerpo rigido esta activo
		i.get_parent().add_child(newCuerpoRigido)#agrega el nodo al padre y se muestra en la escena
		
		i.get_parent().remove_child(i)#remueve del padre a todas las caras
		newCuerpoRigido.add_child(i)#cada parte rota es hijo de su correspondiente kinematic
		
		#var nodoColision = i.get_child(0).get_child(0)
		#nodoColision.move_child(newCuerpoRigido)
		
		#newCuerpoRigido.add_child(i.get_child(0).get_child(0))
		
		#print(nodoColision.name)#aca tengo la colision
		#i.remove_child(i.get_child(0))
		

		
		#print("el padre se llama ",i.get_parent().name)
		#print("posicion de ",i.name,"", i.translation)
		#print("posicion del nodo KINEMATICO " , newCuerpoRigido.translation , "\n")
		
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
