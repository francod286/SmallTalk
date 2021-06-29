| cine nom s1 s2 s3 emp1 emp2 emp3 p1 p2 p3 t OcuEmpleado empTicketera empVagos pSelect pConSala genAccion genInfantil genComedia x d listaPeliculas cantLocalidades idPelicula usuario resultado valorNumerico|

nom := 'Cinopolis'.
"Creo Cine"
cine := Cine crearCinenombre: nom.

"Creo Empleados"
emp1 := Empleado crearEmpleadonombre: 'Franco' apellido: 'Duarte' dni: '12347891' ocupacion: 'seguridad'.
emp2 := Empleado crearEmpleadonombre: 'Nahuel' apellido: 'Martinez' dni: '11231231' ocupacion: 'vendedor'.
emp3 := Empleado crearEmpleadonombre: 'Melany' apellido: 'Ojeda' dni: '14444444' ocupacion: 'camarografo'.
emp4 := Empleado crearEmpleadonombre: 'Leon' apellido: 'Duarte' dni: '23232323' ocupacion: 'camarografo'.
emp5 := Empleado crearEmpleadonombre: 'Leo' apellido: 'Geise' dni: '33333333' ocupacion: 'camarografo'.

"creo la sala"
s1 := Sala crearSalanombre: 'V1' capacidad: 30.
s2 := Sala crearSalanombre: 'V2' capacidad: 30.
s3 := Sala crearSalanombre: 'V3' capacidad: 30.
s4 := Sala crearSalanombre: 'V1' capacidad: 30.
s5 := Sala crearSalanombre: 'V2' capacidad: 30.
s6 := Sala crearSalanombre: 'V3' capacidad: 30.
"creo peliculas"
p1 := Pelicula crearPeliculanombre: 'Duro de matar'                          duracion: 130 id: 1000   genero: 'accion'        fecha_Inicio:'12-12-2021' fecha_Fin:'20-01-2022'.   "precio standar igual para todos"
p2 := Pelicula crearPeliculanombre: 'Barbie Las hijas del Duque'       duracion: 90   id: 1001   genero: 'infantil'        fecha_Inicio:'12-12-2021' fecha_Fin:'20-01-2022'.
p3 := Pelicula crearPeliculanombre: 'Guerra de papas 2'                    duracion: 110 id: 1002   genero: 'comedia'     fecha_Inicio:'12-12-2021' fecha_Fin:'20-01-2022'.
p4 := Pelicula crearPeliculanombre: 'Duro de matar 2'                       duracion: 120 id: 1003   genero: 'accion'        fecha_Inicio:'12-12-2021' fecha_Fin:'20-01-2022'.
p5 := Pelicula crearPeliculanombre: 'Barbie y la princesa de España' duracion: 75   id: 1004   genero: 'infantil'       fecha_Inicio:'12-12-2021' fecha_Fin:'20-01-2022'.
p6 := Pelicula crearPeliculanombre: 'Guerra de papas 1'                    duracion: 100 id: 1005   genero: 'comedia'     fecha_Inicio:'12-12-2021' fecha_Fin:'20-01-2022'.

"Agrego empleados a la listaEmpledo de CINE"
cine addEmpleado: emp1.
cine addEmpleado: emp2.
cine addEmpleado: emp3.
cine addEmpleado: emp4 .
cine addEmpleado: emp5 .

"Asigno camarografo a la sala"
												"Utilizo detect  --> busco en la coleccion un valor que sea verdadero segun la condicion"
	"OcuEmpleado es el empleado que esta libre (false) y lo asigno a una sala. Lo que provoca que el atributo bool o variable de instancia cambie a true cuando se le asigna a una sala"
"Como ejemplo combio a true al primer camarografo que es 'Melany'(emp3) y deberia aparecer leon"
emp3 setBool: true.
OcuEmpleado  :=  (cine buscarOcupacionOcupacion: 'camarografo') setBool: true. 
"OcuEmpleado inspect."

		"Asigno OcuEmpleado a la sala"
s1 setEmpleado: OcuEmpleado.




"agrego peliculas a la lista de peliculas de Cine"

cine addPelicula: p1.
cine addPelicula: p2.
cine addPelicula: p3.
cine addPelicula: p4 .
cine addPelicula: p5.
cine addPelicula: p6.

"s1 inspect."

"agrego sala al cine"
cine addSala: s1.
cine addSala: s2.
cine addSala: s3.
cine addSala: s4.
cine addSala: s5.
cine addSala: s6.

"asigno una sala a la pelicula"
p1 setSala: s1.
p2 setSala: s2.
p3 setSala: s3.
p4 setSala: s4.
p5 setSala: s5.
p6 setSala: s6.

"-----------------------------------------Aca termina la creacion y asignacion---------------------------------------------------"

"---------------------------------------------------metodos --------------------------------------------------------------------"
"reject col2:= alumnos reject:[:alu| alu verNota=8].   -->  Retorna en otra colección los alumnos con nota distinto a 8"
empVagos := cine mostrarTrabajadoresLibres. "inspect."

"select col1:= alumnos select:[:alu| alu verNota=8]. -->   Retorna en otra colección los alumnos con nota igual a 8"
pSelect := (cine filtrarPorDuracionMenorQue: 110). "inspect ."

"Listar todas los nombres de las peliculas ---------collect col3:= alumnos collect:[:alu| alu verNombre].  --> Retorna en otra colección los nombres de los alumnos"
cine listarTodosLosNombreDePeliculas. "inspect."

"--------------------------------Diccionario----------------------------------"

genAccion:=  (cine filtrarPeliculaPorGenero: 'accion').
genComedia:=  (cine filtrarPeliculaPorGenero: 'comedia').
genInfantil    := (cine filtrarPeliculaPorGenero: 'infantil'). 

d := Dictionary new
	at:  'accion' put: genAccion;
	at: 'comedia' put: genComedia;
	at: 'infantil' put: genInfantil;
yourself.


Transcript show: 'BIENVENIDO A ', cine getNombre printString;
show: '
1) Comprar Asientos
2) Listar Peliculas
3) Total recaudado
9) Salir
'.
menu:= IntegerPrompter prompt: 'Ingrese una opcion: '.
[menu ~= 9] whileTrue:[
	(menu=1)ifTrue:
	[
		Transcript clear.

		cantLocalidades := IntegerPrompter prompt: 'Cuantos asientos desea:  '.
		Transcript clear.
		Transcript show: 		
		'
1) Comedia
2) Accion
3) Infantil
		'.
		valorNumerico := IntegerPrompter prompt: 'Ingrese un genero para listar peliculas: '.
		Transcript clear.
		(valorNumerico = 1)ifTrue: [listaPeliculas:='comedia'].
		(valorNumerico = 2)ifTrue: [listaPeliculas:='accion'].
		(valorNumerico = 3)ifTrue: [listaPeliculas:='infantil'].
		

		
		x := d at:listaPeliculas ifAbsent:[^'no selecciono una opcion correcta'].
		"x inspect.	Retorna del diccionario todas las peliculas con key accion, comedia o infantil"

		"Recorro la lista"
		cine informacionPeliculas: x.	"iterar sobre los elementos de la matriz"

		idPelicula := IntegerPrompter prompt: 'Ingrese un ID:  '.
		usuario := cine buscarPeliculaId: idPelicula. "Encuentro la pelicula que pidio el usuario para descontar los asientos"
	"	usuario inspect."
		"resultado := ( ( (usuario getSala)getCapacidad) - cantLocalidades). inspect. "										" Prueba unitaria funcional donde descuento asiento de la sala"


		(( ( (usuario getSala)getCapacidad) - cantLocalidades)   <   0) 
		ifTrue: [Transcript show: 'No se puede comprar asientos' ]
		ifFalse: [ (usuario getSala) setCapacidad: ( ( (usuario getSala)getCapacidad) - cantLocalidades).
		cine setventaAcomulada:(usuario getPrecio*cantLocalidades ).
		Transcript clear.].	"ok"
		
				   
	].

	(menu=2)ifTrue:
	[
	Transcript clear.
	cine informacionPeliculas: cine todasLasPeliculas .
	Prompter prompt: 'Enter para continuar'.
	Transcript clear.
	].

	(menu=3)ifTrue:
	[
	Transcript clear.
	Transcript show: 'Acomulado hasta el momento: $', cine getventaAcomulada printString.
	Prompter prompt: 'Enter para continuar'.
	Transcript clear.
	].


Transcript show: 'BIENVENIDO A ', cine getNombre printString;
show: '
1) Comprar Asientos
2) Listar Peliculas
3) Total recaudado
9) Salir
'.
menu := IntegerPrompter prompt: 'Ingrese una opcion:  '.


]. 








"---------------------------------------------------------------------------------------"

"cine inspect."
