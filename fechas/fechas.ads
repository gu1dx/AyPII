package fechas is
   subtype tDia is integer range 1..31;
   subtype tMes is integer range 1..12;
   subtype tAnio is integer range 1..9999;

   type tFecha is record
      dia: tDia;
      mes: tMes;
      anio: tAnio;
   end record;

   -- Que hace: Valida la consistencia de una fecha dada.
   -- Precondicion: f=F
   -- Poscondicion: esFechaCorrecta = True y la fecha es consistente, falso sino.
   function esFechaCorrecta(fecha: in tfecha) return boolean;


   -- Que hace: Devuelve la cantidad de dia par aun mes y una año dado.
   -- Precondicion: m=M y anio = A
   -- Poscondicion: diasMes = N y N dias del mes M en el año A.
   function diasMes(mes, anio: in integer) return integer;

   -- Que hace: Devuelve el nombre de un mes.
   -- Precondicion: mes=M
   -- Poscondicion: nombreMes=S y S es el nombre del mes M.
   function nombreMes (mes: in integer) return string;

   -- Que hace: Determina si un año es bisiesto o no.
   -- Precondicion: anio = A
   -- Poscondicion: esBisiesto = True y A es bisiesto, Falso sino.
   function esBisiesto(anio: in integer) return boolean;

   -- Que hace: Devuelve el texto correspondiente a una fecha.
   -- Precondicion: fecha=F
   -- Poscondicion: fechaTexto=Str y Str es F en formato texto.
   function fechaTexto(fecha: in tfecha) return string;


end fechas;
