with text_io,  ada.Strings.Unbounded, text_io.Unbounded_IO;
use text_io,  ada.Strings.Unbounded, text_io.Unbounded_IO;

package body fechas is

   -- Que hace: Valida la consistencia de una fecha dada.
   -- Precondicion: f=F
   -- Poscondicion: fechaCorrecta = True y la fecha es consistente, falso sino.
   function esFechaCorrecta(fecha: in tfecha) return boolean is
   begin
      return fecha.dia in 1.. diasMes(fecha.mes, fecha.anio);
   end esFechaCorrecta;

   -- Que hace: Devuelve la cantidad de dia par aun mes y una año dado.
   -- Precondicion: m=M y anio = A y 1<=M<=12
   -- Poscondicion: diasMes = N y N dias del mes M en el año A.
   function diasMes(mes,anio: in integer) return integer is
      diasMeses: array (integer range 1..12)of integer := (31,28,31,30,31, 30,31,31,30,31,30,31);
   begin
      if (mes = 2) and then (esBisiesto(anio)) then
         return 29;
      end if;
      return diasMeses(mes);
   end diasMes;

   -- Que hace: Determina si un año es bisiesto o no.
   -- Precondicion: anio = A
   -- Poscondicion: esBisiesto = True y A es bisiesto, Falso sino.
   function esBisiesto(anio: in integer) return boolean is
   begin
      if (anio mod 4 = 0)and(anio mod 100 /= 0) then
         return true;
      else
         return (anio mod 400 = 0)and(anio /= 3600);
      end if;
   end esBisiesto;

   -- Que hace: Devuelve el nombre de un mes.
   -- Precondicion: mes=M, 1 <=M<=12
   -- Poscondicion: nombreMes=S y S es el nombre del mes M.
   function nombreMes (mes: in integer) return string is
      nombreMeses: array (integer range 1..12)of Unbounded_String
        := (To_Unbounded_String("enero"),
            To_Unbounded_String("febrero"),
            To_Unbounded_String("marzo"),
            To_Unbounded_String("abril"),
            To_Unbounded_String("mayo"),
            To_Unbounded_String("junio"),
            To_Unbounded_String("julio"),
            To_Unbounded_String("agosto"),
            To_Unbounded_String("septiembre"),
            To_Unbounded_String("octubre"),
            To_Unbounded_String("noviembre"),
            To_Unbounded_String("diciembre"));
   begin
      return To_String(nombreMeses(mes));
   end nombreMes;

   -- Que hace: Devuelve el texto correspondiente a una fecha.
   -- Precondicion: fecha=F
   -- Poscondicion: fechaTexto=Str y Str es F en formato texto.
   function fechatexto(fecha: in tfecha) return string is
      dia, mes, anio, rta : Unbounded_String;
   begin
        dia := To_Unbounded_String(Integer'Image(fecha.dia));
        mes := To_Unbounded_String(nombreMes(fecha.mes));
        anio := To_Unbounded_String(Integer'Image(fecha.anio));

        rta:= dia & " de " & mes & " de" & anio;

   return To_String(rta);

   end fechatexto;

end fechas;
