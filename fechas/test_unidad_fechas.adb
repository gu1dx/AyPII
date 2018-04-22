with utiles, fechas, text_io,ada.strings.Unbounded;
use fechas, text_io, utiles,ada.strings.Unbounded;

procedure test_unidad_fechas is
   package entero_io is new text_io.Integer_IO (Integer);
   use entero_io;
   type miEntero is new Integer;
   procedure get(fecha: in out tFecha) is
   begin
      fecha.dia := enteroEnRango("Ingrese el día", 1,31);
      fecha.mes := enteroEnRango("Ingrese el mes", 1,12);
      fecha.anio := enteroEnRango("Ingrese el año", 0,9999);
   end;

   procedure prueba_es_fecha_correcta (errores: in out integer) is
     type tFechas is array (1..6) of tFecha;
     type tResultado is array (1..6) of Boolean;
      fechas: tFechas := ((dia=>1,mes=>2 ,anio=>2011),
                           (dia=>2,mes=>1, anio=>2011),
                           (dia=>31,mes=>2,anio=>2011),
                           (dia=>1,mes=>12,anio=>2011),
                          (dia=>29,mes=>2,anio=>2010),
                           (dia=>29,mes=>2,anio=>2008)
			);
      resultados: tResultado := (true,true,false,true,false,true);
   begin
      for i in fechas'range loop
         if (esFechaCorrecta(fechas(i)) /= resultados(i)) then
            put_line("Es fecha correcta no funciona correctamente para "  & fechaTexto(fechas(i)));
            errores := errores + 1;
             end if;
       end loop;
   end prueba_es_fecha_correcta;

   procedure prueba_es_bisiesto (errores: in out integer) is
     type tAnios is array (1..6) of Integer;
     type tResultado is array (1..6) of Boolean;
      anios: tAnios := (2011,2012,2008,0,400,1999);
      resultados: tResultado := (false,true,true,true,true,false);
begin
      for i in anios'range loop
         if (esBisiesto(anios(i)) /= resultados(i)) then
            put_line("EsBisiesto no funciona correctamente para "  & Integer'image(anios(i)));
            errores := errores + 1;
          end if;
       end loop;
   end prueba_es_bisiesto;

   procedure   prueba_fecha_texto (errores: in out integer) is
     type tFechas is array (1..4) of tFecha;
     type tResultado is array (1..4) of Unbounded_String;
      fechas: tFechas := ((dia=>1,mes=>2,anio=>2011),
                           (dia=>2,mes=>3,anio=>2011),
                           (dia=>12,mes=>4,anio=>2011),
                           (dia=>1,mes=>5,anio=>2000)
			);
      resultados: tResultado := (To_Unbounded_String(" 1 de febrero de 2011"),
                                 To_Unbounded_String(" 2 de marzo de 2011"),
                                 To_Unbounded_String(" 12 de abril de 2011"),
                                 To_Unbounded_String(" 1 de mayo de 2000"));
   begin
      for i in fechas'range loop
         if (fechaTexto(fechas(i)) /= To_String(resultados(i))) then
            put_line("Fecha texto no funciona correctamente para "  & to_string(resultados(i)) & "retornó: " & fechaTexto(fechas(i)));
            errores := errores + 1;
          end if;
       end loop;
   end prueba_fecha_texto;

     procedure   prueba_dias_mes (errores: in out integer) is
     type tFechas is array (1..6) of tFecha;
     type tResultado is array (1..6) of Integer;
      fechas: tFechas := ((dia=>1,mes=>2 ,anio=>2012),
                           (dia=>2,mes=>1, anio=>2011),
                           (dia=>31,mes=>3,anio=>2011),
                           (dia=>1,mes=>12,anio=>2011),
                          (dia=>29,mes=>2,anio=>2010),
                           (dia=>29,mes=>2,anio=>2008)
			);
      resultados: tResultado := (29,31,31,31,28,29);
   begin
      for i in fechas'range loop
         if (diasMes(fechas(i).mes, fechas(i).anio) /= resultados(i)) then
            put_line(Integer'Image(i) & ": DiasMes no funciona correctamente para "  & fechaTexto(fechas(i)) & " retornó: " & integer'image(diasMes(fechas(i).mes, fechas(i).anio)) & " se esperaba: " & Integer'Image(resultados(i)));
            errores := errores + 1;
          end if;
       end loop;
   end prueba_dias_mes;

   errores:integer:=0;
begin

   loop
      put_line("Programa de Prueba fechas y Utiles");
      prueba_es_fecha_correcta (errores);
      prueba_es_Bisiesto (errores);
      prueba_fecha_Texto (errores);
      prueba_dias_mes (errores);
      put_line ("Se han encontrado " & Integer'Image(errores) & " errores en el paquete FECHAS..");
      exit when not confirma("Desea Continuar ? [S/N]");
   end loop;
 end;
