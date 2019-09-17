extends Spatial

#var malla = null

func _ready():
	var NodosHijos = get_children()#toma todos los hijos
	var kinematico_padre#guardo el kinematico
	
	for i in NodosHijos:
		var children = i.get_children()
		kinematico_padre = i #tomo el nodo que va a ser el padre
		
		for i in children:
			var children1 = i.get_children()			
			
			for i in children1:
				var children2 = i.get_children()
				
				for i in children2:				
					var cuerpoEstatico = i.get_parent() #guarda el nodo de tipo staticBody
					i.get_parent().remove_child(i)#deja de ser hijo del nodo staticbody
					cuerpoEstatico.queue_free() #elimina al nodo sobrante de tipo staticBody
					kinematico_padre.add_child(i)#hace que el padre sea el rigidBody


		
			
		
