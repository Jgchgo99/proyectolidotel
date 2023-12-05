program Hotel_Lidotel;
uses sysutils, crt;

{Definir Estructura de Campos del Formato de Registro Archivo ClienteLidotel}
type
   ClienteLidotelRecord = Record
      NacionCliente: char;
      CedulaCliente: integer;
      NombCliente: string [40];
      ApellidoCliente: string [40];
      DiaNacCliente:integer;
      MesNacCliente: integer;
      AnoNacCliente: integer;
      PaisCliente: string [40];
      EdadCliente: integer;
      TlfCliente: string [11];
      EmailCliente: string [40];
      SexoCliente: char;
      DirCliente: string [40];
      DiaAfiliacion: integer;
      MesAfiliacion: integer;
      AnoAfiliacion: integer;
   end;
   type
     ReservacionIndividualRecord= Record
     NacionCliente: char;
     CedulaCliente: integer;
     NroReservacion: integer;
     CanDiasReservacion: integer;
     DiaReservacion: integer;
     MesReservacion: integer;
     AnoReservacion: integer;
   end;
   type
    ReservacionAcompananteRecord= Record
     NacionCliente: char;
     CedulaCliente: integer;
     NroReservacion: integer;
     CanDiasReservacion: integer;
     DiaReservacion: integer;
     MesReservacion: integer;
     AnoReservacion: integer;
   end;
   type
    ReservacionGrupoFamiliarRecord= Record
     NacionCliente: char;
     CedulaCliente: integer;
     NroReservacion: integer;
     CanDiasReservacion: integer;
     DiaReservacion: integer;
     MesReservacion: integer;
     AnoReservacion: integer;
     NroAdutos:integer;
     NroHijos:integer;
   end;
  type
    ReservacionGrupoPersonasRecord= Record
     NacionCliente: char;
     CedulaCliente: integer;
     NroReservacion: integer;
     TipoVinculo: integer;
     NacionPersona: char;
     CedulaPersona: integer;
     NombPersona: string [40];
     ApellidoPersona: string [40];
     EdadPersona: integer;
     TlfPersona: string [11];
     SexoPersona: char;
     TipoHabitacion: integer;
   end;
 type
   ReservacionHabitacionesRecord= Record
     NacionCliente: char;
     CedulaCliente: integer;
     NroReservacion: integer;
     TipoHabitacion: integer;
     CantHabitacion: integer;
     PrecioHabitacion: real;
     TotalPagarHab: real;
   end;
 type
  ReservacionTotalPagarRecord= Record
     NacionCliente: char;
     CedulaCliente: integer;
     NroReservacion: integer;
     TotalPagar: real;
   end;

var
   RegClienteLidotel: ClienteLidotelRecord;
   ClienteLidotel_Int: file of ClienteLidotelRecord;     {declaracion nombre archivo interno programa}
   ClienteLidotel_Int_Tmp: file of ClienteLidotelRecord; {declaracion nombre archivo interno programa, Temporal Eliminar Registro Cliente}
   ClienteLidotel_Ext: String;                           {declaracion nombre archivo Externo programa}
   ClienteLidotel_Ext_Tmp: String;                       {declaracion nombre archivo Externo programa, Temporal Eliminar Registro Cliente}

   RegReservacionIndividual: ReservacionIndividualRecord;
   ReservacionIndividual_Int: file of ReservacionIndividualRecord;     {declaracion nombre archivo interno programa}
   ReservacionIndividual_Ext: String;                           {declaracion nombre archivo Externo programa}

   RegReservacionAcompanante: ReservacionAcompananteRecord;
   ReservacionAcompanante_Int: file of ReservacionAcompananteRecord;     {declaracion nombre archivo interno programa}
   ReservacionAcompanante_Ext: String;                           {declaracion nombre archivo Externo programa}

   RegReservacionGrupoFamiliar: ReservacionGrupoFamiliarRecord;
   ReservacionGrupoFamiliar_Int: file of ReservacionGrupoFamiliarRecord;     {declaracion nombre archivo interno programa}
   ReservacionGrupoFamiliar_Ext: String;                           {declaracion nombre archivo Externo programa}


   RegReservacionGrupoPersonas: ReservacionGrupoPersonasRecord;
   ReservacionGrupoPersonas_Int: file of ReservacionGrupoPersonasRecord;     {declaracion nombre archivo interno programa}
   ReservacionGrupoPersonas_Ext: String;                           {declaracion nombre archivo Externo programa}


   RegReservacionHabitaciones:  ReservacionHabitacionesRecord;
   ReservacionHabitaciones_Int: file of  ReservacionHabitacionesRecord;     {declaracion nombre archivo interno programa}
   ReservacionHabitaciones_Ext: String;                           {declaracion nombre archivo Externo programa}


   ReservacionTotalPagar_Int: file of   ReservacionTotalPagarRecord;     {declaracion nombre archivo interno programa}
   ReservacionTotalPagar_Ext: String;                           {declaracion nombre archivo Externo programa}

   PosPuntero,PosCursor : longint;
   NacionCliente, SexoCliente, SexoPersona, NacionPersona: char;
   CedulaCliente, DiaNacCliente,  MesNacCliente, AnoNacCliente, EdadCliente, TipoHabitacion,CantHabitacion: integer;
   NombCliente, ApellidoCliente, PaisCliente, EmailCliente, DirCliente: string;
   DiaAfiliacion, MesAfiliacion, AnoAfiliacion: integer;
   TlfCliente: string;
   NroReservacion, CanDiasReservacion, DiaReservacion, MesReservacion,  AnoReservacion,  EdadPersona: integer;
   NroAdultos, NroHijos, TipoVinculo,  CedulaPersona:integer;

   TotalPagarHab: real;
   NombPersona,  ApellidoPersona,  TlfPersona: string;
   PosRegReservacionIndividual,PosRegReservacionAcompanante,PosRegReservacionGrupoFamiliar: Integer ;
   CanRegReservacionIndividual,CanRegReservacionAcompanante,CanRegReservacionGrupoFamiliar: Integer ;
   CanReg,RegAct  :string;

 Procedure TituloLidotel;
  Begin
   textbackground(blue);
   clrscr;
   textcolor(red);
         writeln();
         writeln('                              B I E N V E N I D O S    A L    H O T E L    L I D O T E L  ');
         writeln();
         writeln();
   textcolor(black);
  end;


{Inicializar Variables}
Procedure InzVarCliente;
  begin
      NacionCliente:=' ';
      CedulaCliente:=0;
      NombCliente:='';
      ApellidoCliente:='';
      DiaNacCliente:=0;
      MesNacCliente:=0;
      AnoNacCliente:=0;
      PaisCliente:='';
      EdadCliente:=0;
      TlfCliente:='';
      EmailCliente:='';
      SexoCliente:=' ';
      DirCliente:='';
      DiaAfiliacion:=0;
      MesAfiliacion:=0;
      AnoAfiliacion:=0;
  end;
{Inicializar Variables}
Procedure CargarDatosCliente;
  Begin
      NacionCliente  :=RegClienteLidotel.NacionCliente;
      CedulaCliente  :=RegClienteLidotel.CedulaCliente;
      NombCliente    :=RegClienteLidotel.NombCliente;
      ApellidoCliente:=RegClienteLidotel.ApellidoCliente;
      DiaNacCliente  :=RegClienteLidotel.DiaNacCliente;
      MesNacCliente  :=RegClienteLidotel.MesNacCliente;
      AnoNacCliente  :=RegClienteLidotel.AnoNacCliente;
      PaisCliente    :=RegClienteLidotel.PaisCliente;
      EdadCliente    :=RegClienteLidotel.EdadCliente;
      TlfCliente     :=RegClienteLidotel.TlfCliente;
      EmailCliente   :=RegClienteLidotel.EmailCliente;
      SexoCliente    :=RegClienteLidotel.SexoCliente;
      DirCliente     :=RegClienteLidotel.DirCliente;
      DiaAfiliacion  :=RegClienteLidotel.DiaAfiliacion;
      MesAfiliacion  :=RegClienteLidotel.MesAfiliacion;
      AnoAfiliacion  :=RegClienteLidotel.AnoAfiliacion;
  end;

 Procedure VerDatosCliente;
   begin
        TituloLidotel;
        writeln(' DATOS DEL CLIENTE:');
        writeln;
        writeln('     Nacionalidad (V,E): ', NacionCliente);
        writeln('     Cedula............: ', CedulaCliente);
        writeln('  1. Nombre............: ', NombCliente);
        writeln('  2. Apellido..........: ', ApellidoCliente);
        writeln('  3. Dia de Nacimiento.: ', DiaNacCliente);
        writeln('  4. Mes de Nacimiento.: ', MesNacCliente);
        writeln('  5. Ano de Nacimiento.: ', AnoNacCliente);
        writeln('  6. Pais..............: ', PaisCliente);
        writeln('  7. Edad..............: ', EdadCliente);
        writeln('  8. Telefono..........: ', TlfCliente);
        writeln('  9. Email.............: ', EmailCliente);
        writeln(' 10. Sexo(M o F).......: ', SexoCliente);
        writeln(' 11. Direccion.........: ', DirCliente);
        writeln(' 12. Dia de Afiliacion.: ', DiaAfiliacion);
        writeln(' 13. Mes de Afiliacion.: ', MesAfiliacion);
        writeln(' 14. Ano de Afilicacion: ', AnoAfiliacion );
   end;


Procedure PrepararAmbiente;
 Begin

 {Archivo Cliente Lidotel }
   ClienteLidotel_Ext:='ClienteLidotel.Dat';
   Assign(ClienteLidotel_Int,ClienteLidotel_Ext);
   {Verifico si el archivo no existe para crearlo}
   if fileexists(ClienteLidotel_Ext)=False then
    Begin
      {Crear el Archivo}
      Rewrite(ClienteLidotel_Int);
      {Cierro Archivo}
      Close(ClienteLidotel_Int);
    end;

 {Archivo Reservacion Individual }
   ReservacionIndividual_Ext:='ReservacionIndividual.Dat';
   Assign(ReservacionIndividual_Int,ReservacionIndividual_Ext);
   {Verifico si el archivo no existe para crearlo}
   if fileexists(ReservacionIndividual_Ext)=False then
    Begin
      {Crear el Archivo}
      Rewrite(ReservacionIndividual_Int);
      {Cierro Archivo}
      Close(ReservacionIndividual_Int);
    end;

 {Archivo Reservacion Acompanante}
   ReservacionAcompanante_Ext:='ReservacionAcompanante.Dat';
   Assign(ReservacionAcompanante_Int,ReservacionAcompanante_Ext);
   {Verifico si el archivo no existe para crearlo}
   if fileexists(ReservacionAcompanante_Ext)=False then
    Begin
      {Crear el Archivo}
      Rewrite(ReservacionAcompanante_Int);
      {Cierro Archivo}
      Close(ReservacionAcompanante_Int);
    end;

 {Archivo Reservacion Grupo/Familiar}
   ReservacionGrupoFamiliar_Ext:='ReservacionGrupoFamiliar.Dat';
   Assign(ReservacionGrupoFamiliar_Int,ReservacionGrupoFamiliar_Ext);
   {Verifico si el archivo no existe para crearlo}
   if fileexists(ReservacionGrupoFamiliar_Ext)=False then
    Begin
      {Crear el Archivo}
      Rewrite(ReservacionGrupoFamiliar_Int);
      {Cierro Archivo}
      Close(ReservacionGrupoFamiliar_Int);
    end;

 {Archivo Grupo de Personas}
   ReservacionGrupoPersonas_Ext:='ReservacionGrupoPersonas.Dat';
   Assign(ReservacionGrupoPersonas_Int,ReservacionGrupoPersonas_Ext);
   {Verifico si el archivo no existe para crearlo}
   if fileexists(ReservacionGrupoPersonas_Ext)=False then
    Begin
      {Crear el Archivo}
      Rewrite(ReservacionGrupoPersonas_Int);
      {Cierro Archivo}
      Close(ReservacionGrupoPersonas_Int);
    end;

 {Archivo Reservacion de Habitaciones}
   ReservacionHabitaciones_Ext:='ReservacionHabitaciones.Dat';
   Assign(ReservacionHabitaciones_Int,ReservacionHabitaciones_Ext);
   {Verifico si el archivo no existe para crearlo}
   if fileexists(ReservacionHabitaciones_Ext)=False then
    Begin
      {Crear el Archivo}
      Rewrite(ReservacionHabitaciones_Int);
      {Cierro Archivo}
      Close(ReservacionHabitaciones_Int);
    end;

 {Archivo Reservacion de Total a Pagar}
   ReservacionTotalPagar_Ext:='ReservacionTotalPagar.Dat';
   Assign(ReservacionTotalPagar_Int,ReservacionTotalPagar_Ext);
   {Verifico si el archivo no existe para crearlo}
   if fileexists(ReservacionTotalPagar_Ext)=False then
    Begin
      {Crear el Archivo}
      Rewrite(ReservacionTotalPagar_Int);
      {Cierro Archivo}
      Close(ReservacionTotalPagar_Int);
    end;

End;


function BuscarCliente(Nacionalidad: Char;Cedula : Longint) : Longint;
Var
Existe: boolean;

begin
  Existe:= false;
  {Archivo Cliente Lidotel }
  {Asigno el Archivo a Leer}
  Assign(ClienteLidotel_Int,ClienteLidotel_Ext);
  {Abrir el Archivo }
  Reset(ClienteLidotel_Int);
  while (eof(ClienteLidotel_Int)=False) And (Existe=False)
    do begin
      Read(ClienteLidotel_Int,RegClienteLidotel);
      if  (RegClienteLidotel.NacionCliente=Nacionalidad) and (RegClienteLidotel.CedulaCliente=Cedula) then Existe:= True;
  end;
  if Existe=true
     then PosPuntero:= filePos(ClienteLidotel_Int) -1  {posicion -1, porque los registros arrancan desde cero en el archivo, y la funcion filepos desde 1}
     else PosPuntero:= -1;                             {No existe registro forzo -1, para saber que no hay coincidencia}

BuscarCliente:=PosPuntero;
{cierro archivo}
Close(ClienteLidotel_Int);
end;


Procedure ConsultarCliente;
  var
  dato: string;
    begin
      dato:='';
        TituloLidotel;
        writeln(' CONSULTAR CLIENTE:');
        writeln;
        writeln;
  {Validar Nacionalidad}
    repeat
      TituloLidotel;
      writeln(' CONSULTAR CLIENTE:');
      writeln;
      write(' Nacionalidad (V,E): ');
      NacionCliente:=Upcase(Readkey);
      until (NacionCliente='V') or (NacionCliente='E');
      writeln();
    {Validar Cedula}
      repeat
      TituloLidotel;
      writeln(' CONSULTAR CLIENTE:');
      writeln;
      writeln(' Nacionalidad (V,E): ', NacionCliente);
      write(' Cedula: ');
      readln(dato);
      val(dato,CedulaCliente);
      until (CedulaCliente<>0);

     {Validar que la cedula exista para consultar}
      PosCursor:=BuscarCliente(NacionCliente,CedulaCliente);
    If (PosCursor) >= 0 then  {Existe Registro }
     Begin
      TituloLidotel;
      writeln(' CONSULTAR CLIENTE:');
      CargarDatosCliente;
      VerDatosCliente;
      writeln();
      writeln();
      writeln(' Pulse Una Tecla Para Salir');
      readkey();
     end
     Else
     Begin
       writeln;writeln;
       writeln('                      Cliente no Existe...Pulse una tecla para continuar' );
       readkey();
     End;
   end;


Procedure IncluirCliente;
  var
  opc:char;
  dato: string;
  Datonum: real;
  begin
   InzVarCliente;
   dato:=''; opc:=' ';
   Datonum:=0;
  {Validar Nacionalidad}
     repeat
      TituloLidotel;
      writeln(' INCLUIR CLIENTE:');
      writeln;
      write(' Nacionalidad (V,E)....: ');
      NacionCliente:=Upcase(Readkey);
     until (NacionCliente='V') or (NacionCliente='E');
      writeln();
  {Validar Cedula}
     repeat
      TituloLidotel;
      writeln(' INCLUIR CLIENTE:');
      writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
         write  (' Cedula...........: ');
      readln(dato);
      val(dato,CedulaCliente);  {convertir dato string  a numerico}
     until (CedulaCliente<>0);
   {Validar no existe el cliente}
     PosCursor:=BuscarCliente(NacionCliente,CedulaCliente);
    If (PosCursor) < 0 then  {Existe Registro }
     Begin
   {Validar Nombre}
      repeat
        TituloLidotel;
        writeln(' INCLUIR CLIENTE:');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        write  (' Nombre............: ');
        readln(NombCliente);
      until (NombCliente<>'');
   {Validar Apellido}
      repeat
        TituloLidotel;
        writeln(' INCLUIR CLIENTE:');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        writeln(' Nombre............: ', NombCliente);
        write(' Apellido..........: ');
        readln(ApellidoCliente);
      until (ApellidoCliente<>'');
  {Validar  Dia de Nacimiento }
      repeat
        TituloLidotel;
        writeln(' INCLUIR CLIENTE:');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        writeln(' Nombre............: ', NombCliente);
        writeln(' Apellido..........: ', ApellidoCliente);
        write  (' Dia de Nacimiento.: ');
        readln(dato);
        val(dato,DiaNacCliente); {convertir dato string  a numerico}
      until (DiaNacCliente>=1) and (DiaNacCliente<=31) ;
  {Validar Mes de Nacimiento}
      repeat
        TituloLidotel;
        writeln(' INCLUIR CLIENTE:');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        writeln(' Nombre............: ', NombCliente);
        writeln(' Apellido..........: ', ApellidoCliente);
        writeln(' Dia de Nacimiento.: ', DiaNacCliente);
        write  (' Mes de Nacimiento.: ');
        readln(dato);
        val(dato,MesNacCliente); {convertir dato string  a numerico}
      until (MesNacCliente>=1) and (MesNacCliente<=12);
  {Validar Ano de Nacimiento}
      repeat
        TituloLidotel;
        writeln(' INCLUIR CLIENTE:');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        writeln(' Nombre............: ', NombCliente);
        writeln(' Apellido..........: ', ApellidoCliente);
        writeln(' Dia de Nacimiento.: ', DiaNacCliente);
        writeln(' Mes de Nacimiento.: ', MesNacCliente);
        write(' Ano de Nacimiento.: ');
        readln(dato);
        val(dato,AnoNacCliente); {convertir dato string  a numerico}
      until (AnoNacCliente>1900);
  {Validar Pais}
      repeat
        TituloLidotel;
        writeln(' INCLUIR CLIENTE:');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        writeln(' Nombre............: ', NombCliente);
        writeln(' Apellido..........: ', ApellidoCliente);
        writeln(' Dia de Nacimiento.: ', DiaNacCliente);
        writeln(' Mes de Nacimiento.: ', MesNacCliente);
        writeln(' Ano de Nacimiento.: ', AnoNacCliente);
        write(' Pais..............: ');
        readln(PaisCliente);
      until (PaisCliente<>'');
  {Validar Edad}
      repeat
        TituloLidotel;
        writeln(' INCLUIR CLIENTE:');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        writeln(' Nombre............: ', NombCliente);
        writeln(' Apellido..........: ', ApellidoCliente);
        writeln(' Dia de Nacimiento.: ', DiaNacCliente);
        writeln(' Mes de Nacimiento.: ', MesNacCliente);
        writeln(' Ano de Nacimiento.: ', AnoNacCliente);
        writeln(' Pais..............: ', PaisCliente);
        write  (' Edad..............: ');
        readln(dato);
        val(dato,EdadCliente); {convertir dato string  a numerico}
      until (EdadCliente>0);
  {Validar Telefono Celular}
      repeat
        TituloLidotel;
        writeln(' INCLUIR CLIENTE:');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        writeln(' Nombre............: ', NombCliente);
        writeln(' Apellido..........: ', ApellidoCliente);
        writeln(' Dia de Nacimiento.: ', DiaNacCliente);
        writeln(' Mes de Nacimiento.: ', MesNacCliente);
        writeln(' Ano de Nacimiento.: ', AnoNacCliente);
        writeln(' Pais..............: ', PaisCliente);
        writeln(' Edad..............: ', EdadCliente);
        write  (' Telefono..........: ');
        readln(TlfCliente);
        val(TlfCliente,Datonum); {convertir dato string  a numerico}
      until (Datonum>0);
  {Validar Email}
      repeat
        TituloLidotel;
        writeln(' INCLUIR CLIENTE:');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        writeln(' Nombre............: ', NombCliente);
        writeln(' Apellido..........: ', ApellidoCliente);
        writeln(' Dia de Nacimiento.: ', DiaNacCliente);
        writeln(' Mes de Nacimiento.: ', MesNacCliente);
        writeln(' Ano de Nacimiento.: ', AnoNacCliente);
        writeln(' Pais..............: ', PaisCliente);
        writeln(' Edad..............: ', EdadCliente);
        writeln(' Telefono..........: ', TlfCliente);
        write  (' Email.............: ');
        readln(EmailCliente);
      until (EmailCliente<>'');
  {Validar Sexo}
      repeat
        TituloLidotel;
        writeln(' INCLUIR CLIENTE:');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        writeln(' Nombre............: ', NombCliente);
        writeln(' Apellido..........: ', ApellidoCliente);
        writeln(' Dia de Nacimiento.: ', DiaNacCliente);
        writeln(' Mes de Nacimiento.: ', MesNacCliente);
        writeln(' Ano de Nacimiento.: ', AnoNacCliente);
        writeln(' Pais..............: ', PaisCliente);
        writeln(' Edad..............: ', EdadCliente);
        writeln(' Telefono..........: ', TlfCliente);
        writeln(' Email.............: ', EmailCliente);
        write  (' Sexo(M o F).......: ');
        SexoCliente:=Upcase(Readkey);
     until (SexoCliente='M') or (SexoCliente='F');
  {Validar Direccion}
      repeat
        TituloLidotel;
        writeln(' INCLUIR CLIENTE:');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        writeln(' Nombre............: ', NombCliente);
        writeln(' Apellido..........: ', ApellidoCliente);
        writeln(' Dia de Nacimiento.: ', DiaNacCliente);
        writeln(' Mes de Nacimiento.: ', MesNacCliente);
        writeln(' Ano de Nacimiento.: ', AnoNacCliente);
        writeln(' Pais..............: ', PaisCliente);
        writeln(' Edad..............: ', EdadCliente);
        writeln(' Telefono..........: ', TlfCliente);
        writeln(' Email.............: ', EmailCliente);
        writeln(' Sexo(M o F).......: ', SexoCliente);
        write  (' Direccion.........: ');
        readln(DirCliente);
     until (DirCliente<>'');
  {Validar Dia de Afiliacion}
      repeat
        TituloLidotel;
        writeln(' INCLUIR CLIENTE:');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        writeln(' Nombre............: ', NombCliente);
        writeln(' Apellido..........: ', ApellidoCliente);
        writeln(' Dia de Nacimiento.: ', DiaNacCliente);
        writeln(' Mes de Nacimiento.: ', MesNacCliente);
        writeln(' Ano de Nacimiento.: ', AnoNacCliente);
        writeln(' Pais..............: ', PaisCliente);
        writeln(' Edad..............: ', EdadCliente);
        writeln(' Telefono..........: ', TlfCliente);
        writeln(' Email.............: ', EmailCliente);
        writeln(' Sexo(M o F).......: ', SexoCliente);
        writeln(' Direccion.........: ', DirCliente);
        write  (' Dia de Afiliacion.: ');
        readln(dato);
        val(dato,DiaAfiliacion); {convertir dato string  a numerico}
     until (DiaAfiliacion>=1) and (DiaAfiliacion<=31);
  {Validar Mes de Afiliacion}
      repeat
        TituloLidotel;
        writeln(' INCLUIR CLIENTE:');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        writeln(' Nombre............: ', NombCliente);
        writeln(' Apellido..........: ', ApellidoCliente);
        writeln(' Dia de Nacimiento.: ', DiaNacCliente);
        writeln(' Mes de Nacimiento.: ', MesNacCliente);
        writeln(' Ano de Nacimiento.: ', AnoNacCliente);
        writeln(' Pais..............: ', PaisCliente);
        writeln(' Edad..............: ', EdadCliente);
        writeln(' Telefono..........: ', TlfCliente);
        writeln(' Email.............: ', EmailCliente);
        writeln(' Sexo(M o F).......: ', SexoCliente);
        writeln(' Direccion.........: ', DirCliente);
        writeln(' Dia de Afiliacion.: ', DiaAfiliacion);
        write  (' Mes de Afiliacion.: ');
        readln(dato);
        val(dato,MesAfiliacion); {convertir dato string  a numerico}
     until (MesAfiliacion>=1) and (MesAfiliacion<=12);
  {Validar Ano de Afiliacion}
      repeat
        TituloLidotel;
        writeln(' INCLUIR CLIENTE:');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        writeln(' Nombre............: ', NombCliente);
        writeln(' Apellido..........: ', ApellidoCliente);
        writeln(' Dia de Nacimiento.: ', DiaNacCliente);
        writeln(' Mes de Nacimiento.: ', MesNacCliente);
        writeln(' Ano de Nacimiento.: ', AnoNacCliente);
        writeln(' Pais..............: ', PaisCliente);
        writeln(' Edad..............: ', EdadCliente);
        writeln(' Telefono..........: ', TlfCliente);
        writeln(' Email.............: ', EmailCliente);
        writeln(' Sexo(M o F).......: ', SexoCliente);
        writeln(' Direccion.........: ', DirCliente);
        writeln(' Dia de Afiliacion.: ', DiaAfiliacion);
        writeln(' Mes de Afiliacion.: ', MesAfiliacion);
        write  (' Ano de Afilicacion: ');
        readln(dato);
        val(dato,AnoAfiliacion); {convertir dato string  a numerico}
     until (AnoAfiliacion>1900);
      Repeat
      TituloLidotel;
      writeln(' INCLUIR CLIENTE:');
      writeln;
      writeln(' Nacionalidad (V,E): ', NacionCliente);
      writeln(' Cedula............: ', CedulaCliente);
      writeln(' Nombre............: ', NombCliente);
      writeln(' Apellido..........: ', ApellidoCliente);
      writeln(' Dia de Nacimiento.: ', DiaNacCliente);
      writeln(' Mes de Nacimiento.: ', MesNacCliente);
      writeln(' Ano de Nacimiento.: ', AnoNacCliente);
      writeln(' Pais..............: ', PaisCliente);
      writeln(' Edad..............: ', EdadCliente);
      writeln(' Telefono..........: ', TlfCliente);
      writeln(' Email.............: ', EmailCliente);
      writeln(' Sexo(M o F).......: ', SexoCliente);
      writeln(' Direccion.........: ', DirCliente);
      writeln(' Dia de Afiliacion.: ', DiaAfiliacion);
      writeln(' Mes de Afiliacion.: ', MesAfiliacion);
      write  (' Ano de Afilicacion: ', AnoAfiliacion);
      writeln;writeln;
      write('                       Desea guardar los datos(S=si o N=no): ');
      opc:=Upcase(readkey);
      until (opc='S') or (opc='N');
      if (opc='S') then
       begin
           Reset(ClienteLidotel_Int);
           {Posiciono Puntero al final del Archivo, para agregar registro}
           seek(ClienteLidotel_Int,filesize(ClienteLidotel_Int));
           RegClienteLidotel.NacionCliente:= NacionCliente;
           RegClienteLidotel.CedulaCliente:= CedulaCliente;
           RegClienteLidotel.NombCliente:= NombCliente;
           RegClienteLidotel.ApellidoCliente:= ApellidoCliente;
           RegClienteLidotel.DiaNacCliente:= DiaNacCliente;
           RegClienteLidotel.MesNacCliente:= MesNacCliente;
           RegClienteLidotel.AnoNacCliente:= AnoNacCliente;
           RegClienteLidotel.EdadCliente:= EdadCliente;
           RegClienteLidotel.PaisCliente:= PaisCliente;
           RegClienteLidotel.TlfCliente:= TlfCliente;
           RegClienteLidotel.EmailCliente:= EmailCliente;
           RegClienteLidotel.SexoCliente:= SexoCliente;
           RegClienteLidotel.DirCliente:= DirCliente;
           RegClienteLidotel.DiaAfiliacion:= DiaAfiliacion;
           RegClienteLidotel.MesAfiliacion:= MesAfiliacion;
           RegClienteLidotel.AnoAfiliacion:= AnoAfiliacion;
          {escribo formato de registro en el archivo}
           Write(ClienteLidotel_Int,RegClienteLidotel);
          {cierro archivo}
          Close(ClienteLidotel_Int);
          writeln;writeln;
          write('                       Datos Guardado Satisfactoriamete...');
          delay(2000);
       end;
     end
         Else
     Begin
       writeln;writeln;
       writeln('                      Cliente Existe...Pulse una tecla para continuar' );
       readkey();
     end;
  end;

Procedure ModificarCliente;
  var
    dato: string;
    opc: string;
    opc1: char;
    datonum,opcnum: integer;
  begin
  dato:=''; opc:='';
  {Validar Nacionalidad}
    repeat
      TituloLidotel;
      writeln(' MODIFICAR CLIENTE:');
      writeln;
      write (' Nacionalidad (V,E): ');
      NacionCliente:=Upcase(Readkey);
      until (NacionCliente='V') or (NacionCliente='E');
      writeln();
    {Validar Cedula}
      repeat
      TituloLidotel;
      writeln(' MODIFICAR CLIENTE:');
      writeln;
      writeln(' Nacionalidad (V,E): ', NacionCliente);
      write  (' Cedula...........: ');
      readln(dato);
      val(dato,CedulaCliente);
      until (CedulaCliente<>0);
  {Validar que la cedula exista para modificar}
      PosCursor:=BuscarCliente(NacionCliente,CedulaCliente);
    If (PosCursor) >= 0 then  {Existe Registro }
     Begin
     CargarDatosCliente;
     while opc<>'99' do
      Begin
       Repeat
        TituloLidotel;
        writeln(' MODIFICAR CLIENTE:');
        writeln;
        VerDatosCliente;
        writeln(' 99. Salir y Guardar...: ');
        writeln;   writeln;
        write(' Seleccione el Campo a Modificar: ');
        readln(opc);
       val(opc,opcnum);
       until opcnum in [1,2,3,4,5,6,7,8,9,10,11,12,13,14,99];
       {campo a modificar}
       Case Opcnum of
        01:   {modificar campo nombre}
           Begin;
             repeat
               write  (' Nombre............: ');
               readln(NombCliente);
             until (NombCliente<>'');
           end;
        02:   {modificar campo apellido}
           Begin;
             repeat
               write(' Apellido..........: ');
               readln(ApellidoCliente);
             until (ApellidoCliente<>'');
           end;
        03:   {modificar campo dia de nacimiento}
           Begin;
             repeat
               write  (' Dia de Nacimiento.: ');
               readln(dato);
               val(dato,DiaNacCliente); {convertir dato string  a numerico}
             until (DiaNacCliente>=1) and (DiaNacCliente<=31) ;
           end;
        04:   {modificar campo mes de nacimiento}
           Begin;
             repeat
               write  (' Mes de Nacimiento.: ');
               readln(dato);
               val(dato,MesNacCliente); {convertir dato string  a numerico}
             until (MesNacCliente>=1) and (MesNacCliente<=12);
           end;
       05:   {modificar campo ano de nacimiento}
           Begin;
             repeat
               write(' Ano de Nacimiento.: ');
               readln(dato);
               val(dato,AnoNacCliente); {convertir dato string  a numerico}
             until (AnoNacCliente>1900);
           end;
       06:   {modificar campo pais}
           Begin;
             repeat
               write(' Pais..............: ');
               readln(PaisCliente);
             until (PaisCliente<>'');
           end;
       07:   {modificar campo edad}
           Begin;
             repeat
               write  (' Edad..............: ');
               readln(dato);
               val(dato,EdadCliente); {convertir dato string  a numerico}
             until (EdadCliente>0);
           end;
       08:   {modificar  campo telefono celular}
           Begin;
             repeat
               write  (' Telefono..........: ');
               readln(TlfCliente);
               val(TlfCliente,Datonum); {convertir dato string  a numerico}
             until (Datonum>0);
           end;
       09:   {modificar  campo email}
           Begin;
             repeat
               write  (' Email.............: ');
               readln(EmailCliente);
             until (EmailCliente<>'');
           end;
      10:   {modificar  campo sexo}
           Begin;
             repeat
               write  (' Sexo(M o F).......: ');
               SexoCliente:=Upcase(Readkey);
             until (SexoCliente='M') or (SexoCliente='F');
           end;
      11:   {modificar  campo direccion}
           Begin;
             repeat
               write  (' Direccion.........: ');
               readln(DirCliente);
             until (DirCliente<>'');
           end;
      12:   {modificar  dia de afiliacion}
           Begin;
             repeat
               write  (' Dia de Afiliacion.: ');
               readln(dato);
               val(dato,DiaAfiliacion); {convertir dato string  a numerico}
             until (DiaAfiliacion>=1) and (DiaAfiliacion<=31);
           end;
      13:   {modificar  mes de afiliacion}
           Begin;
             repeat
               write  (' Mes de Afiliacion.: ');
               readln(dato);
               val(dato,MesAfiliacion); {convertir dato string  a numerico}
             until (MesAfiliacion>=1) and (MesAfiliacion<=12);
           end;
      14:   {modificar  ano de afiliacion}
           Begin;
             repeat
               write  (' Ano de Afilicacion: ');
               readln(dato);
               val(dato,AnoAfiliacion); {convertir dato string  a numerico}
             until (AnoAfiliacion>1900);
           end;
      99:
           Begin;
            Repeat
             writeln;writeln;
             write('                       Desea guardar los datos(S=si o N=no): ');
             opc1:=Upcase(readkey);
            until (opc1='S') or (opc1='N');
            end;
         end;
       end;

      if (opc1='S') then
       begin
           Reset(ClienteLidotel_Int);
           {Posiciono Puntero en el Registro a Modificar}
           seek(ClienteLidotel_Int,PosCursor);
           RegClienteLidotel.NacionCliente:= NacionCliente;
           RegClienteLidotel.CedulaCliente:= CedulaCliente;
           RegClienteLidotel.NombCliente:= NombCliente;
           RegClienteLidotel.ApellidoCliente:= ApellidoCliente;
           RegClienteLidotel.DiaNacCliente:= DiaNacCliente;
           RegClienteLidotel.MesNacCliente:= MesNacCliente;
           RegClienteLidotel.AnoNacCliente:= AnoNacCliente;
           RegClienteLidotel.EdadCliente:= EdadCliente;
           RegClienteLidotel.PaisCliente:= PaisCliente;
           RegClienteLidotel.TlfCliente:= TlfCliente;
           RegClienteLidotel.EmailCliente:= EmailCliente;
           RegClienteLidotel.SexoCliente:= SexoCliente;
           RegClienteLidotel.DirCliente:= DirCliente;
           RegClienteLidotel.DiaAfiliacion:= DiaAfiliacion;
           RegClienteLidotel.MesAfiliacion:= MesAfiliacion;
           RegClienteLidotel.AnoAfiliacion:= AnoAfiliacion;
          {escribo formato de registro en el archivo}
           Write(ClienteLidotel_Int,RegClienteLidotel);
          {cierro archivo}
          Close(ClienteLidotel_Int);
          writeln;writeln;
          write('                       Datos Actualizado Satisfactoriamete...');
          delay(2000);
       end;

     end
     Else
     Begin
       writeln;writeln;
       writeln('                      Cliente no Existe...Pulse una tecla para continuar' );
       readkey();
     End;
  end;


Procedure EliminarCliente;
  var
    opc:char;
    dato: string;
    PosCursor:LongInt;

  begin
    dato:=''; opc:=' ';
    PosCursor:=0;

  {Validar Nacionalidad}
    repeat
      TituloLidotel;
      writeln(' ELIMINAR CLIENTE:');
      writeln;
      write(' Nacionalidad (V,E): ');
      NacionCliente:=Upcase(Readkey);
      until (NacionCliente='V') or (NacionCliente='E');
      writeln();
    {Validar Cedula}
      repeat
      TituloLidotel;
      writeln(' ELIMINAR CLIENTE:');
      writeln;
      writeln(' Nacionalidad (V,E): ', NacionCliente);
      write  (' Cedula............: ');
      readln(dato);
      val(dato,CedulaCliente);
      until (CedulaCliente<>0);
     {Validar que la cedula exista para Eliminar}
      PosCursor:=BuscarCliente(NacionCliente,CedulaCliente);
    If (PosCursor) >= 0 then  {Existe Registro}
     Begin
      CargarDatosCliente;
      Repeat
      TituloLidotel;
      writeln(' ELIMINAR CLIENTE:');
      writeln;
      VerDatosCliente;
      writeln;writeln;
      write(' Desea Eliminar los datos(S=si o N=no): ');
      opc:=upcase(readkey);
      until (opc='S') or (opc='N');
      if (opc='S') then
       begin
        ClienteLidotel_Ext_Tmp:='ClienteLidotelTmp.Dat';
        Assign(ClienteLidotel_Int_Tmp,ClienteLidotel_Ext_Tmp);
        {Verifico si el archivo no existe para crearlo}
        {Crear el Archivo}
        Rewrite(ClienteLidotel_Int_Tmp);
        {Lectura del Archivo Actual, para enviar registros al Temporal, Exectuando el Cliente Eliminado}
         {Archivo Cliente Lidotel }
         {Asigno el Archivo a Leer}
         Assign(ClienteLidotel_Int,ClienteLidotel_Ext);
         {Abrir el Archivo }
         Reset(ClienteLidotel_Int);
         while (eof(ClienteLidotel_Int)=False)
           do begin
             Read(ClienteLidotel_Int,RegClienteLidotel);
             if (RegClienteLidotel.NacionCliente<>NacionCliente) And (RegClienteLidotel.CedulaCliente<>CedulaCliente) then
              Begin
               {Posiciono Puntero al final del Archivo Temporal, para agregar registro}
               seek(ClienteLidotel_Int_Tmp,filesize(ClienteLidotel_Int_Tmp));
               {grabo los registros del archivo Original al Temporal Exepto el que se esta Eliminando}
               Write(ClienteLidotel_Int_Tmp,RegClienteLidotel) ;
              end;
         end;
        {Cierro Archivo Temporal}
        Close(ClienteLidotel_Int_Tmp);
        {Cierro Archivo Original}
        Close(ClienteLidotel_Int);
        {Borro Archivo Original de Clientes}
        erase(ClienteLidotel_Int);
        {Renombro Archivo Temporal a Archivo Original de Clientes}
        rename(ClienteLidotel_Int_Tmp,ClienteLidotel_Ext);
        writeln;writeln;
        write('                       Datos Eliminado Satisfactoriamete...');
        delay(2000);
       end
     Else
     Begin
       writeln;writeln;
       writeln('                      Cliente no Existe...Pulse una tecla para continuar' );
       readkey();
     End;
     end;
   end;

Function PrecTipoHabitacion(TipoHabitacion: integer): real;
   begin
    case TipoHabitacion of
    1: PrecTipoHabitacion:= 60;
    2: PrecTipoHabitacion:= 120;
    3: PrecTipoHabitacion:= 200;
    4: PrecTipoHabitacion:= 300;
    end;
   end;

Function DescTipoHabitacion(TipoHabitacion: integer): string;
   begin
    case TipoHabitacion of
    1: DescTipoHabitacion:= 'SENCILLA';
    2: DescTipoHabitacion:= 'DOBLE';
    3: DescTipoHabitacion:= 'FAMILY ROOM';
    4: DescTipoHabitacion:= 'SUITE';
    end;
   end;

Procedure TipoHabitaciones;
   begin
    Writeln('');
    Writeln(' TIPOS DE HABITACIONES');
    Writeln('');
    Writeln(' 1. SENCILLA       60$ por noche');
    Writeln(' 2. DOBLE         120$ por noche');
    Writeln(' 3. FAMILY ROOM   200$ por noche');
    Writeln(' 4. SUITE         300$ por noche');
    Writeln(' 9. Descripcion de Habitaciones');
    Writeln('');
   end;

Procedure DescHabitaciones;
   begin
    writeln();
    TituloLidotel;
    Writeln('1. SENCILLA â€“ 60$ por noche');
    writeln('    Amplia y confortable habitaciÃ³n decorada con un estilo vanguardista, cama');
    writeln('    Lidotel Royal King con sÃ¡banas de algodÃ³n egipcio, soporte para iPod con reloj');
    writeln('    despertador, TV 32â€ HD Plasma con cable, baÃ±o con ducha, cafetera elÃ©ctrica, nevera');
    writeln('    ejecutiva, caja electrÃ³nica de seguridad y secador de cabello.');
    writeln();
    Writeln('2. DOBLE â€“ 120$ por noche');
    writeln('    Amplia y confortable habitaciÃ³n decorada con un estilo vanguardista, Dos Camas');
    writeln('    Lidotel Full con sÃ¡banas de algodÃ³n egipcio, soporte para iPod con reloj despertador,');
    writeln('    TV 32â€ HD Plasma con cable, baÃ±o con ducha, cafetera elÃ©ctrica, nevera ejecutiva,');
    writeln('    caja electrÃ³nica de seguridad secador de cabello.');
    writeln();
    Writeln('3. FAMILY ROOM â€“ 200$ por noche');
    writeln('   CÃ¡lida y confortable habitaciÃ³n decorada con un estilo vanguardista, 100% libre');
    writeln('   de humo, cama Lidotel Royal King, con reloj despertador, TV 32â€ HD Plasma con');
    writeln('   cable, baÃ±o con ducha, cafetera elÃ©ctrica, nevera ejecutiva, caja electrÃ³nica de');
    writeln('   seguridad y secador de cabello, armario adicional amplio, una habitaciÃ³n separada');
    writeln('   con 2 camas full, baÃ±o con ducha.');
    writeln();
    Writeln('4. SUITE â€“ 300$ por noche');
    writeln('   CÃ¡lida y confortable habitaciÃ³n decorada con un estilo vanguardista, 100% libre');
    writeln('   de humo, Cama Lidotel Royal King, con reloj despertador, TV 32â€ HD Plasma con');
    writeln('   cable, 2 baÃ±os con ducha, cafetera elÃ©ctrica, nevera ejecutiva, caja electrÃ³nica de');
    writeln('   seguridad y secador de cabello, armario adicional amplio y Ã¡rea separada con 2 sofÃ¡cama individuales');
    writeln();
    writeln('                        Pulse Una Tecla Para Continuar');
    readkey();
    writeln();
    TituloLidotel;
    Writeln(' INCLUYEN ');
    writeln();
    writeln('   Desayuno Buffet en el Restaurant Le Nouveau, acceso inalÃ¡mbrico a Internet');
    writeln('  (WIFI), Business Center, uso de nuestra exclusiva piscina, acceso a nuestro');
    writeln('  gimnasio, sillas y toldos en la playa, kit de vanidades y niÃ±os de 0 a 2 aÃ±os sin');
    writeln('  recargos.');
    writeln();
    writeln();
    writeln('                        Pulse Una Tecla Para Continuar');
    readkey();
   end;



 Function DescTipoVinculo(TipoVinculo: integer):String;
   begin
     case TipoVinculo Of
      1: DescTipoVinculo:= 'Esposo(a)';
      2: DescTipoVinculo:= 'Amigo(a)';
      3: DescTipoVinculo:= 'Hermano(a)';
      4: DescTipoVinculo:= 'Abuelo(a)';
      5: DescTipoVinculo:= 'Tio(a)';
      6: DescTipoVinculo:= 'Madre';
      7: DescTipoVinculo:= 'Padre';
      8: DescTipoVinculo:= 'Hijo(a)';
      9: DescTipoVinculo:= 'Primo(a)';
     end;
   end;

 Procedure MenuTipoVinculo;
   Begin
    Writeln('');
    Writeln(' TIPO DE VINCULO');
    Writeln('');
    Writeln(' 1. Esposo(a)');
    Writeln(' 2. Amigo(a)');
    Writeln(' 3. Hermano(a)');
    Writeln(' 4. Abuelo(a)');
    Writeln(' 5. Tio(a)');
    Writeln(' 6. Madre');
    Writeln(' 7. Padre');
    Writeln(' 8. Hijo(a)');
    Writeln(' 9. Primo(a)');
    Writeln('');
   end;


  Procedure GrupoPersona(MostrarMenu: boolean; NumPersona: Integer;GrupoFamilia:Boolean);
   var
     dato: string;
     datonum: real;
     begin
        dato:='';
        Datonum:=0;
     Repeat
      TituloLidotel;
      writeln(' Reservacion Acompanante:');
      writeln;
      writeln(' Nacionalidad (V,E): ', NacionCliente);
      writeln(' Cedula............: ', CedulaCliente);
      writeln(' Nombre Cliente....: ', NombCliente);
      writeln(' Tipo de Habitacion: ', DescTipoHabitacion(TipoHabitacion));
      writeln(' Numero Reservacion: ', NroReservacion);
      if GrupoFamilia=True then
       Begin
         writeln(' Cantidad de Hijos.: ',NroHijos);
         writeln(' Cantidad de Adulto: ',NroAdultos);
       End;
      writeln();
      Writeln(' DATOS DE LA PERSONA: ',NumPersona);

      if (MostrarMenu=True) then
       begin
        MenuTipoVinculo;
        write  (' Tipo de vinculo: ');
        dato:=readkey();
       end;

      if (MostrarMenu=False) then
       Begin
          dato:='8';
       end;

      val(dato,TipoVinculo); {convertir dato string  a numerico}
      until (TipoVinculo>=1) and (TipoVinculo<=9);
      repeat
      TituloLidotel;
      writeln(' Reservacion Acompanante:');
      writeln;
      writeln(' Nacionalidad (V,E): ', NacionCliente);
      writeln(' Cedula............: ', CedulaCliente);
      writeln(' Nombre Cliente....: ', NombCliente);
      writeln(' Tipo de Habitacion: ', DescTipoHabitacion(TipoHabitacion));
      writeln(' Numero Reservacion: ', NroReservacion);
      writeln();
      Writeln(' DATOS DE LA PERSONA: ',NumPersona);
      writeln();
      writeln(' Tipo de Vinculo...: ', DescTipoVinculo(TipoVinculo));
      write  (' Nacionalidad (V,E): ');
      NacionPersona:=Upcase(Readkey);
      until (NacionPersona='V') or (NacionPersona='E');
      writeln();
    {Validar Cedula}
      repeat
      TituloLidotel;
      writeln(' Reservacion Acompanante:');
      writeln;
      writeln(' Nacionalidad (V,E): ', NacionCliente);
      writeln(' Cedula............: ', CedulaCliente);
      writeln(' Nombre Cliente....: ', NombCliente);
      writeln(' Tipo de Habitacion: ', DescTipoHabitacion(TipoHabitacion));
      writeln(' Numero Reservacion: ', NroReservacion);
      writeln();
      Writeln(' DATOS DE LA PERSONA: ',NumPersona);
      writeln();
      writeln(' Tipo de Vinculo...: ', DescTipoVinculo(TipoVinculo));
      writeln(' Nacionalidad (V,E): ', NacionPersona);
      write  (' Cedula............: ');
      readln(dato);
      val(dato,CedulaPersona);
      until (CedulaPersona<>0);
      Repeat
        TituloLidotel;
        writeln(' Reservacion Acompanante:');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        writeln(' Nombre Cliente....: ', NombCliente);
        writeln(' Tipo de Habitacion: ', DescTipoHabitacion(TipoHabitacion));
        writeln(' Numero Reservacion: ', NroReservacion);
        writeln();
        Writeln(' DATOS DE LA PERSONA: ',NumPersona);
        writeln();
        writeln(' Tipo de Vinculo...: ', DescTipoVinculo(TipoVinculo));
        writeln(' Nacionalidad (V,E): ', NacionPersona);
        writeln(' Cedula............: ', CedulaPersona);
        write  (' Nombre............: ');
        readln(NombPersona);
      until (NombPersona<>'');
      Repeat
       TituloLidotel;
        writeln(' Reservacion Acompanante:');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        writeln(' Nombre Cliente....: ', NombCliente);
        writeln(' Tipo de Habitacion: ', DescTipoHabitacion(TipoHabitacion));
        writeln(' Numero Reservacion: ', NroReservacion);
        writeln();
        Writeln(' DATOS DE LA PERSONA: ',NumPersona);
        writeln();
        writeln(' Tipo de Vinculo...: ', DescTipoVinculo(TipoVinculo));
        writeln(' Nacionalidad (V,E): ', NacionPersona);
        writeln(' Cedula............: ', CedulaPersona);
        writeln(' Nombre............: ', NombPersona);
        write  (' Apellido..........: ');
        readln(ApellidoPersona);
      until (ApellidoPersona<>'');
      Repeat
       TituloLidotel;
        writeln(' Reservacion Acompanante:');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        writeln(' Nombre Cliente....: ', NombCliente);
        writeln(' Tipo de Habitacion: ', DescTipoHabitacion(TipoHabitacion));
        writeln(' Numero Reservacion: ', NroReservacion);
        writeln();
        Writeln(' DATOS DE LA PERSONA: ',NumPersona);
        writeln();
        writeln(' Tipo de Vinculo...: ', DescTipoVinculo(TipoVinculo));
        writeln(' Nacionalidad (V,E): ', NacionPersona);
        writeln(' Cedula............: ', CedulaPersona);
        writeln(' Nombre............: ', NombPersona);
        writeln(' Apellido..........: ', ApellidoPersona );
        write  (' Edad..............: ');
        readln(dato);
        val(dato,EdadPersona); {convertir dato string  a numerico}
      until (EdadPersona>=0);
      Repeat
       TituloLidotel;
        writeln(' Reservacion Acompanante:');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        writeln(' Nombre Cliente....: ', NombCliente);
        writeln(' Tipo de Habitacion: ', DescTipoHabitacion(TipoHabitacion));
        writeln(' Numero Reservacion: ', NroReservacion);
        writeln();
        Writeln(' DATOS DE LA PERSONA: ',NumPersona);
        writeln();
        writeln(' Tipo de Vinculo...: ', DescTipoVinculo(TipoVinculo));
        writeln(' Nacionalidad (V,E): ', NacionPersona);
        writeln(' Cedula............: ', CedulaPersona);
        writeln(' Nombre............: ', NombPersona);
        writeln(' Apellido..........: ', ApellidoPersona );
        writeln(' Edad..............: ', EdadPersona);
        write  (' Telefono..........: ');
        readln(TlfPersona);
        val(TlfPersona,Datonum); {convertir dato string  a numerico}
      until (Datonum>0);
      Repeat
       TituloLidotel;
        writeln(' Reservacion Acompanante:');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        writeln(' Nombre Cliente....: ', NombCliente);
        writeln(' Tipo de Habitacion: ', DescTipoHabitacion(TipoHabitacion));
        writeln(' Numero Reservacion: ', NroReservacion);
        writeln();
        Writeln(' DATOS DE LA PERSONA: ',NumPersona);
        writeln();
        writeln(' Tipo de Vinculo...: ', DescTipoVinculo(TipoVinculo));
        writeln(' Nacionalidad (V,E): ', NacionPersona);
        writeln(' Cedula............: ', CedulaPersona);
        writeln(' Nombre............: ', NombPersona);
        writeln(' Apellido..........: ', ApellidoPersona );
        writeln(' Edad..............: ', EdadPersona);
        writeln(' Telefono..........: ', TlfPersona);
        write  (' Sexo(M o F).......: ');
        SexoPersona:=Upcase(Readkey);
     until (SexoPersona='M') or (SexoPersona='F');
      TituloLidotel;
        writeln(' Reservacion Acompanante:');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        writeln(' Nombre Cliente....: ', NombCliente);
        writeln(' Tipo de Habitacion: ', DescTipoHabitacion(TipoHabitacion));
        writeln(' Numero Reservacion: ', NroReservacion);
        writeln();
        Writeln(' DATOS DE LA PERSONA: ',NumPersona);
        writeln();
        writeln(' Tipo de Vinculo...: ', DescTipoVinculo(TipoVinculo));
        writeln(' Nacionalidad (V,E): ', NacionPersona);
        writeln(' Cedula............: ', CedulaPersona);
        writeln(' Nombre............: ', NombPersona);
        writeln(' Apellido..........: ', ApellidoPersona );
        writeln(' Edad..............: ', EdadPersona);
        writeln(' Telefono..........: ', TlfPersona);
        write  (' Sexo(M o F).......: ', SexoPersona );
 end;
Procedure GrabarGrupoPersonas;
    begin

         Reset(ReservacionGrupoPersonas_Int);
          {Posiciono Puntero al final del Archivo, para agregar registro}
          seek(ReservacionGrupoPersonas_Int,filesize(ReservacionGrupoPersonas_Int));
          RegReservacionGrupoPersonas.NacionCliente:= NacionCliente;
          RegReservacionGrupoPersonas.CedulaCliente:= CedulaCliente;
          RegReservacionGrupoPersonas.NroReservacion:= NroReservacion;
          RegReservacionGrupoPersonas.TipoVinculo:= TipoVinculo;
          RegReservacionGrupoPersonas.NacionPersona:= NacionPersona;
          RegReservacionGrupoPersonas.CedulaPersona:= CedulaPersona;
          RegReservacionGrupoPersonas.NombPersona:= NombPersona;
          RegReservacionGrupoPersonas.ApellidoPersona:= ApellidoPersona;
          RegReservacionGrupoPersonas.EdadPersona:= EdadPersona;
          RegReservacionGrupoPersonas.TlfPersona:= TlfPersona;
          RegReservacionGrupoPersonas.SexoPersona:= SexoPersona;
         {escribo formato de registro en el archivo}
          Write(ReservacionGrupoPersonas_Int,RegReservacionGrupoPersonas);
         {cierro archivo}
         Close(ReservacionGrupoPersonas_Int);

    end;
Procedure GrabarGrupoFamiliar;
    begin
         Reset(ReservacionGrupoFamiliar_Int);
          {Posiciono Puntero al final del Archivo, para agregar registro}
          seek(ReservacionGrupoFamiliar_Int,filesize(ReservacionGrupoFamiliar_Int));
          RegReservacionGrupoFamiliar.NacionCliente:= NacionCliente;
          RegReservacionGrupoFamiliar.CedulaCliente:= CedulaCliente;
          RegReservacionGrupoFamiliar.DiaReservacion:= DiaReservacion;
          RegReservacionGrupoFamiliar.MesReservacion:= MesReservacion;
          RegReservacionGrupoFamiliar.AnoReservacion:= AnoReservacion;
          RegReservacionGrupoFamiliar.NroReservacion:= NroReservacion;
          RegReservacionGrupoFamiliar.CanDiasReservacion:= CanDiasReservacion;
         {escribo formato de registro en el archivo}
          Write(ReservacionGrupoFamiliar_Int,RegReservacionGrupoFamiliar);
         {cierro archivo}
         Close(ReservacionGrupoFamiliar_Int);

         Reset(ReservacionHabitaciones_Int);
          {Posiciono Puntero al final del Archivo, para agregar registro}
          seek(ReservacionHabitaciones_Int,filesize(ReservacionHabitaciones_Int));
          RegReservacionHabitaciones.NacionCliente:= NacionCliente;
          RegReservacionHabitaciones.CedulaCliente:= CedulaCliente;
          RegReservacionHabitaciones.NroReservacion:= NroReservacion;
          RegReservacionHabitaciones.TipoHabitacion:= TipoHabitacion;
          RegReservacionHabitaciones.CantHabitacion:= CantHabitacion;
          RegReservacionHabitaciones.PrecioHabitacion:= PrecTipoHabitacion(TipoHabitacion);
          RegReservacionHabitaciones.TotalPagarHab:= TotalPagarHab;
         {escribo formato de registro en el archivo}
          Write(ReservacionHabitaciones_Int,RegReservacionHabitaciones);
         {cierro archivo}
         Close(ReservacionHabitaciones_Int);
    end;
  Procedure ReservacionIndividual;
   var
     dato: string;
     opc: char;
     begin
        opc:=' ';
        randomize;
        NroReservacion:=random(9999999);
        dato:='';
        TituloLidotel;
        writeln(' Reservacion Individual:');
        writeln;
        writeln;
   {Validar Nacionalidad}
      repeat
      TituloLidotel;
      writeln(' Reservacion Individual:');
      writeln;
      write  (' Nacionalidad (V,E): ');
      NacionCliente:=Upcase(Readkey);
      until (NacionCliente='V') or (NacionCliente='E');
      writeln();
    {Validar Cedula}
      repeat
      TituloLidotel;
      writeln(' Reservacion Individual:');
      writeln;
      writeln(' Nacionalidad (V,E): ', NacionCliente);
      write  (' Cedula............: ');
      readln(dato);
      val(dato,CedulaCliente);
      until (CedulaCliente<>0);
     {Validar que la cedula exista para consultar}
      PosCursor:=BuscarCliente(NacionCliente,CedulaCliente);
    If (PosCursor) >= 0 then  {Existe Registro }
     Begin
      TituloLidotel;
      writeln(' Reservacion Individual:');
      CargarDatosCliente;
        Repeat
       TituloLidotel;
       writeln(' Reservacion Individual:');
       writeln;
       writeln(' Nacionalidad (V,E): ', NacionCliente);
       writeln(' Cedula............: ', CedulaCliente);
       writeln(' Nombre............: ', NombCliente);
       TipoHabitaciones;
       write  (' Tipo de Habitacion: ');
       dato:=Readkey;
       val(dato,TipoHabitacion); {convertir dato string  a numerico}
       if  (TipoHabitacion=9) then DescHabitaciones;
      until (TipoHabitacion>=1) and (DiaReservacion<=4);
      Repeat
       TituloLidotel;
       writeln(' Reservacion Individual:');
       writeln;
       writeln(' Nacionalidad (V,E): ', NacionCliente);
       writeln(' Cedula............: ', CedulaCliente);
       writeln(' Nombre............: ', NombCliente);
       writeln(' Tipo de Habitacion: ', DescTipoHabitacion(TipoHabitacion));
       writeln(' Numero Reservacion: ', NroReservacion);
       write  (' Dia de Reservacion: ');
       readln(dato);
       val(dato,DiaReservacion); {convertir dato string  a numerico}
      until (DiaReservacion>=1) and (DiaReservacion<=31);
      Repeat
        TituloLidotel;
        writeln(' Reservacion Individual');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        writeln(' Nombre............: ', NombCliente);
        writeln(' Tipo de Habitacion: ', DescTipoHabitacion(TipoHabitacion));
        writeln(' Numero Reservacion: ', NroReservacion);
        writeln(' Dia de Reservacion: ', DiaReservacion);
        write  (' Mes de Reservacion: ');
        readln(dato);
        val(dato, MesReservacion); {convertir dato string  a numerico}
      until ( MesReservacion>=1) and ( MesReservacion<=12);
      Repeat
        TituloLidotel;
        writeln(' Reservacion Individual:');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        writeln(' Nombre............: ', NombCliente);
        writeln(' Tipo de Habitacion: ', DescTipoHabitacion(TipoHabitacion));
        writeln(' Numero Reservacion: ', NroReservacion);
        writeln(' Dia de Reservacion: ', DiaReservacion);
        writeln(' Mes de Reservacion: ', MesReservacion );
        write  (' Ano de Reservacion: ');
        readln(dato);
        val(dato,AnoReservacion); {convertir dato string  a numerico}
      until (AnoReservacion>1900);
      Repeat
        TituloLidotel;
        writeln(' Reservacion Individual:');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        writeln(' Nombre............: ', NombCliente);
        writeln(' Tipo de Habitacion: ', DescTipoHabitacion(TipoHabitacion));
        writeln(' Numero Reservacion: ', NroReservacion);
        writeln(' Dia de Reservacion: ', DiaReservacion);
        writeln(' Mes de Reservacion: ', MesReservacion );
        writeln(' Ano de Reservacion: ', AnoReservacion);
        write  (' Dias Reservacion..: ');
        readln(dato);
        val(dato,CanDiasReservacion); {convertir dato string  a numerico}
      until (CanDiasReservacion>0);
      Repeat
      TituloLidotel;
        writeln(' Reservacion Individual:');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        writeln(' Nombre............: ', NombCliente);
        writeln(' Tipo de Habitacion: ', DescTipoHabitacion(TipoHabitacion));
        writeln(' Numero Reservacion: ', NroReservacion);
        writeln(' Dia de Reservacion: ', DiaReservacion);
        writeln(' Mes de Reservacion: ', MesReservacion );
        writeln(' Ano de Reservacion: ', AnoReservacion);
        writeln(' Dias Reservacion..: ', CanDiasReservacion );
        writeln;writeln;
        TotalPagarHab:=CanDiasReservacion*PrecTipoHabitacion(TipoHabitacion);
        writeln(' Total a Pagar: ', TotalPagarHab:10:2);
        writeln;
        write('                       Desea guardar los datos(S=si o N=no): ');
      opc:=Upcase(readkey);
      until (opc='S') or (opc='N');
      if (opc='S') then
       begin
           Reset(ReservacionIndividual_Int);
           {Posiciono Puntero al final del Archivo, para agregar registro}
           seek(ReservacionIndividual_Int,filesize(ReservacionIndividual_Int));
           RegReservacionIndividual.NacionCliente:= NacionCliente;
           RegReservacionIndividual.CedulaCliente:= CedulaCliente;
           RegReservacionIndividual.DiaReservacion:= DiaReservacion;
           RegReservacionIndividual.MesReservacion:= MesReservacion;
           RegReservacionIndividual.AnoReservacion:= AnoReservacion;
           RegReservacionIndividual.NroReservacion:= NroReservacion;
           RegReservacionIndividual.CanDiasReservacion:= CanDiasReservacion;
          {escribo formato de registro en el archivo}
           Write(ReservacionIndividual_Int,RegReservacionIndividual);
          {cierro archivo}
          Close(ReservacionIndividual_Int);

          Reset(ReservacionHabitaciones_Int);
           {Posiciono Puntero al final del Archivo, para agregar registro}
           seek(ReservacionHabitaciones_Int,filesize(ReservacionHabitaciones_Int));
           RegReservacionHabitaciones.NacionCliente:= NacionCliente;
           RegReservacionHabitaciones.CedulaCliente:= CedulaCliente;
           RegReservacionHabitaciones.TipoHabitacion:= TipoHabitacion;
           RegReservacionHabitaciones.NroReservacion:= NroReservacion;
           RegReservacionHabitaciones.CantHabitacion:= 1;
            RegReservacionHabitaciones.PrecioHabitacion:= PrecTipoHabitacion(TipoHabitacion);
           RegReservacionHabitaciones.TotalPagarHab:= TotalPagarHab;
          {escribo formato de registro en el archivo}
           Write(ReservacionHabitaciones_Int,RegReservacionHabitaciones);
          {cierro archivo}
          Close(ReservacionHabitaciones_Int);
          writeln;writeln;
          write('                       Datos Guardado Satisfactoriamete...');
          delay(2000);
       end;
     end
     Else
     Begin
       Repeat
       writeln;writeln;
       write(' Cliente No Existe, Desea Crearlo(S=si o N=no): ');
       opc:=upcase(readkey);
       until (opc='S') or (opc='N');
      if (opc='S') then
       begin
        IncluirCliente;
     End;
   end;
end;
 Procedure ReservacionAcompanante;
   var
     dato: string;
     opc: char;
     begin
        opc:=' ';
        randomize;
        NroReservacion:=random(9999999);
        dato:='';
        TituloLidotel;
        writeln(' Reservacion Acompanante:');
        writeln;
        writeln;
    {Validar Nacionalidad}
      repeat
      TituloLidotel;
      writeln(' Reservacion Acompanante:');
      writeln;
      write  (' Nacionalidad (V,E): ');
      NacionCliente:=Upcase(Readkey);
      until (NacionCliente='V') or (NacionCliente='E');
      writeln();
    {Validar Cedula}
      repeat
      TituloLidotel;
      writeln(' Reservacion Acompanante:');
      writeln;
      writeln(' Nacionalidad (V,E): ', NacionCliente);
      write  (' Cedula............: ');
      readln(dato);
      val(dato,CedulaCliente);
      until (CedulaCliente<>0);
     {Validar que la cedula exista para consultar}
      PosCursor:=BuscarCliente(NacionCliente,CedulaCliente);
    If (PosCursor) >= 0 then  {Existe Registro }
     Begin
      TituloLidotel;
      writeln(' Reservacion Acompanante:');
      CargarDatosCliente;
        Repeat
       TituloLidotel;
       writeln(' Reservacion Acompanante:');
       writeln;
       writeln(' Nacionalidad (V,E): ', NacionCliente);
       writeln(' Cedula............: ', CedulaCliente);
       writeln(' Nombre............: ', NombCliente);
       TipoHabitaciones;
       write  (' Tipo de Habitacion: ');
       dato:=Readkey;
       val(dato,TipoHabitacion); {convertir dato string  a numerico}
       if  (TipoHabitacion=9) then DescHabitaciones;
      until (TipoHabitacion>=1) and (DiaReservacion<=4);
      Repeat
       TituloLidotel;
       writeln(' Reservacion Acompanante:');
       writeln;
       writeln(' Nacionalidad (V,E): ', NacionCliente);
       writeln(' Cedula............: ', CedulaCliente);
       writeln(' Nombre............: ', NombCliente);
       writeln(' Tipo de Habitacion: ', DescTipoHabitacion(TipoHabitacion));
       writeln(' Numero Reservacion: ', NroReservacion);
       write  (' Dia de Reservacion: ');
       readln(dato);
       val(dato,DiaReservacion); {convertir dato string  a numerico}
      until (DiaReservacion>=1) and (DiaReservacion<=31);
      Repeat
        TituloLidotel;
        writeln(' Reservacion Acompanante:');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        writeln(' Nombre............: ', NombCliente);
        writeln(' Tipo de Habitacion: ', DescTipoHabitacion(TipoHabitacion));
        writeln(' Numero Reservacion: ', NroReservacion);
        writeln(' Dia de Reservacion: ', DiaReservacion);
        write  (' Mes de Reservacion: ');
        readln(dato);
        val(dato, MesReservacion); {convertir dato string  a numerico}
      until ( MesReservacion>=1) and ( MesReservacion<=12);
      Repeat
        TituloLidotel;
        writeln(' Reservacion Acompanante:');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        writeln(' Nombre............: ', NombCliente);
        writeln(' Tipo de Habitacion: ', DescTipoHabitacion(TipoHabitacion));
        writeln(' Numero Reservacion: ', NroReservacion);
        writeln(' Dia de Reservacion: ', DiaReservacion);
        writeln(' Mes de Reservacion: ', MesReservacion );
        write  (' Ano de Reservacion: ');
        readln(dato);
        val(dato,AnoReservacion); {convertir dato string  a numerico}
      until (AnoReservacion>1900);
      Repeat
        TituloLidotel;
        writeln(' Reservacion Acompanante:');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        writeln(' Nombre............: ', NombCliente);
        writeln(' Tipo de Habitacion: ', DescTipoHabitacion(TipoHabitacion));
        writeln(' Numero Reservacion: ', NroReservacion);
        writeln(' Dia de Reservacion: ', DiaReservacion);
        writeln(' Mes de Reservacion: ', MesReservacion );
        writeln(' Ano de Reservacion: ', AnoReservacion);
        write  (' Dias Reservacion..: ');
        readln(dato);
        val(dato,CanDiasReservacion); {convertir dato string  a numerico}
      until (CanDiasReservacion>0);
      Repeat
      TituloLidotel;
        writeln(' Reservacion Acompanante:');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        writeln(' Nombre............: ', NombCliente);
        writeln(' Tipo de Habitacion: ', DescTipoHabitacion(TipoHabitacion));
        writeln(' Numero Reservacion: ', NroReservacion);
        writeln(' Dia de Reservacion: ', DiaReservacion);
        writeln(' Mes de Reservacion: ', MesReservacion );
        writeln(' Ano de Reservacion: ', AnoReservacion);
        writeln(' Dias Reservacion..: ', CanDiasReservacion );
        writeln;writeln;
        GrupoPersona(True,1,False);
        TotalPagarHab:=CanDiasReservacion*PrecTipoHabitacion(TipoHabitacion);
        writeln(); writeln();
        writeln(' Total a Pagar: ', TotalPagarHab:10:2);
        writeln;
        write('                       Desea guardar los datos(S=si o N=no): ');
      opc:=Upcase(readkey);
      until (opc='S') or (opc='N');
      if (opc='S') then
       begin
           Reset(ReservacionAcompanante_Int);
           {Posiciono Puntero al final del Archivo, para agregar registro}
           seek(ReservacionAcompanante_Int,filesize(ReservacionAcompanante_Int));
           RegReservacionAcompanante.NacionCliente:= NacionCliente;
           RegReservacionAcompanante.CedulaCliente:= CedulaCliente;
           RegReservacionAcompanante.DiaReservacion:= DiaReservacion;
           RegReservacionAcompanante.MesReservacion:= MesReservacion;
           RegReservacionAcompanante.AnoReservacion:= AnoReservacion;
           RegReservacionAcompanante.NroReservacion:= NroReservacion;
           RegReservacionAcompanante.CanDiasReservacion:= CanDiasReservacion;
          {escribo formato de registro en el archivo}
           Write(ReservacionAcompanante_Int,RegReservacionAcompanante);
          {cierro archivo}
          Close(ReservacionAcompanante_Int);

          Reset(ReservacionHabitaciones_Int);
           {Posiciono Puntero al final del Archivo, para agregar registro}
           seek(ReservacionHabitaciones_Int,filesize(ReservacionHabitaciones_Int));
           RegReservacionHabitaciones.NacionCliente:= NacionCliente;
           RegReservacionHabitaciones.CedulaCliente:= CedulaCliente;
           RegReservacionHabitaciones.NroReservacion:= NroReservacion;
           RegReservacionHabitaciones.TipoHabitacion:= TipoHabitacion;
           RegReservacionHabitaciones.CantHabitacion:= 1;
           RegReservacionHabitaciones.PrecioHabitacion:= PrecTipoHabitacion(TipoHabitacion);
           RegReservacionHabitaciones.TotalPagarHab:= TotalPagarHab;
          {escribo formato de registro en el archivo}
           Write(ReservacionHabitaciones_Int,RegReservacionHabitaciones);
          {cierro archivo}
          Close(ReservacionHabitaciones_Int);

          Reset(ReservacionGrupoPersonas_Int);
           {Posiciono Puntero al final del Archivo, para agregar registro}
           seek(ReservacionGrupoPersonas_Int,filesize(ReservacionGrupoPersonas_Int));
           RegReservacionGrupoPersonas.NacionCliente:= NacionCliente;
           RegReservacionGrupoPersonas.CedulaCliente:= CedulaCliente;
           RegReservacionGrupoPersonas.NroReservacion:= NroReservacion;
           RegReservacionGrupoPersonas.TipoVinculo:= TipoVinculo;
           RegReservacionGrupoPersonas.NacionPersona:= NacionPersona;
           RegReservacionGrupoPersonas.CedulaPersona:= CedulaPersona;
           RegReservacionGrupoPersonas.NombPersona:= NombPersona;
           RegReservacionGrupoPersonas.ApellidoPersona:= ApellidoPersona;
           RegReservacionGrupoPersonas.EdadPersona:= EdadPersona;
           RegReservacionGrupoPersonas.TlfPersona:= TlfPersona;
           RegReservacionGrupoPersonas.SexoPersona:= SexoPersona;
          {escribo formato de registro en el archivo}
           Write(ReservacionGrupoPersonas_Int,RegReservacionGrupoPersonas);
          {cierro archivo}
          Close(ReservacionGrupoPersonas_Int);
          writeln;writeln;
          write('                       Datos Guardado Satisfactoriamete...');
          delay(2000);
       end;
     end
     Else
     Begin
       Repeat
       writeln;writeln;
       write(' Cliente No Existe, Desea Crearlo(S=si o N=no): ');
       opc:=upcase(readkey);
       until (opc='S') or (opc='N');
      if (opc='S') then
       begin
        IncluirCliente;
     End;
   end;
end;
 Procedure ReservacionGrupoFamiliar;
   var
     dato: string;
     opc: char;
     x: integer;
     begin
        x:=0;
        opc:=' ';
        randomize;
        NroReservacion:=random(9999999);
        dato:='';
        TituloLidotel;
        writeln(' Reservacion Grupo/Familiar:');
        writeln;
        writeln;
    {Validar Nacionalidad}
      repeat
      TituloLidotel;
      writeln(' Reservacion  Grupo/Familiar:');
      writeln;
      write  (' Nacionalidad (V,E): ');
      NacionCliente:=Upcase(Readkey);
      until (NacionCliente='V') or (NacionCliente='E');
      writeln();
    {Validar Cedula}
      repeat
      TituloLidotel;
      writeln(' Reservacion  Grupo/Familiar:');
      writeln;
      writeln(' Nacionalidad (V,E): ', NacionCliente);
      write  (' Cedula............: ');
      readln(dato);
      val(dato,CedulaCliente);
      until (CedulaCliente<>0);
     {Validar que la cedula exista para consultar}
      PosCursor:=BuscarCliente(NacionCliente,CedulaCliente);
    If (PosCursor) >= 0 then  {Existe Registro }
     Begin
      TituloLidotel;
      writeln(' Reservacion  Grupo/Familiar:');
      CargarDatosCliente;
        Repeat
       TituloLidotel;
       writeln(' Reservacion  Grupo/Familiar:');
       writeln;
       writeln(' Nacionalidad (V,E): ', NacionCliente);
       writeln(' Cedula............: ', CedulaCliente);
       writeln(' Nombre............: ', NombCliente);
       TipoHabitaciones;
       write  (' Tipo de Habitacion: ');
       dato:=Readkey;
       val(dato,TipoHabitacion); {convertir dato string  a numerico}
       if  (TipoHabitacion=9) then DescHabitaciones;
      until (TipoHabitacion>=1) and (DiaReservacion<=4);
        Repeat
       TituloLidotel;
       writeln(' Reservacion  Grupo/Familiar:');
       writeln;
       writeln(' Nacionalidad (V,E): ', NacionCliente);
       writeln(' Cedula............: ', CedulaCliente);
       writeln(' Nombre............: ', NombCliente);
       writeln(' Numero Reservacion: ', NroReservacion);
       writeln(' Tipo de Habitacion: ', DescTipoHabitacion(TipoHabitacion));
       write  (' Cant.  Habitacion.: ');
       readln(dato);
       val(dato,CantHabitacion); {convertir dato string  a numerico}
      until (CantHabitacion>=0) ;
      Repeat
       TituloLidotel;
       writeln(' Reservacion  Grupo/Familiar:');
       writeln;
       writeln(' Nacionalidad (V,E): ', NacionCliente);
       writeln(' Cedula............: ', CedulaCliente);
       writeln(' Nombre............: ', NombCliente);
       writeln(' Numero Reservacion: ', NroReservacion);
       writeln(' Tipo de Habitacion: ', DescTipoHabitacion(TipoHabitacion));
       writeln(' Cant.  Habitacion.: ',CantHabitacion);
       write  (' Dia de Reservacion: ');
       readln(dato);
       val(dato,DiaReservacion); {convertir dato string  a numerico}
      until (DiaReservacion>=1) and (DiaReservacion<=31);
      Repeat
        TituloLidotel;
        writeln(' Reservacion  Grupo/Familiar:');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        writeln(' Nombre............: ', NombCliente);
        writeln(' Numero Reservacion: ', NroReservacion);
        writeln(' Tipo de Habitacion: ', DescTipoHabitacion(TipoHabitacion));
        writeln(' Cant.  Habitacion.: ',CantHabitacion);
        writeln(' Dia de Reservacion: ', DiaReservacion);
        write  (' Mes de Reservacion: ');
        readln(dato);
        val(dato, MesReservacion); {convertir dato string  a numerico}
      until ( MesReservacion>=1) and ( MesReservacion<=12);
      Repeat
        TituloLidotel;
        writeln(' Reservacion  Grupo/Familiar:');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        writeln(' Nombre............: ', NombCliente);
        writeln(' Numero Reservacion: ', NroReservacion);
        writeln(' Tipo de Habitacion: ', DescTipoHabitacion(TipoHabitacion));
        writeln(' Cant.  Habitacion.: ',CantHabitacion);
        writeln(' Dia de Reservacion: ', DiaReservacion);
        writeln(' Mes de Reservacion: ', MesReservacion );
        write  (' Ano de Reservacion: ');
        readln(dato);
        val(dato,AnoReservacion); {convertir dato string  a numerico}
      until (AnoReservacion>1900);
      Repeat
        TituloLidotel;
        writeln(' Reservacion  Grupo/Familiar:');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        writeln(' Nombre............: ', NombCliente);
        writeln(' Numero Reservacion: ', NroReservacion);
        writeln(' Tipo de Habitacion: ', DescTipoHabitacion(TipoHabitacion));
        writeln(' Cant.  Habitacion.: ',CantHabitacion);
        writeln(' Dia de Reservacion: ', DiaReservacion);
        writeln(' Mes de Reservacion: ', MesReservacion );
        writeln(' Ano de Reservacion: ', AnoReservacion);
        write  (' Dias Reservacion..: ');
        readln(dato);
        val(dato,CanDiasReservacion); {convertir dato string  a numerico}
      until (CanDiasReservacion>0);
        Repeat
        TituloLidotel;
        writeln(' Reservacion  Grupo/Familiar:');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        writeln(' Nombre............: ', NombCliente);
        writeln(' Numero Reservacion: ', NroReservacion);
        writeln(' Tipo de Habitacion: ', DescTipoHabitacion(TipoHabitacion));
        writeln(' Cant.  Habitacion.: ',CantHabitacion);
        writeln(' Dia de Reservacion: ', DiaReservacion);
        writeln(' Mes de Reservacion: ', MesReservacion );
        writeln(' Ano de Reservacion: ', AnoReservacion);
        writeln(' Dias Reservacion..: ', CanDiasReservacion);
        write  (' Cantidad de Hijos.: ');
        readln(dato);
        val(dato,NroHijos); {convertir dato string  a numerico}
      until (NroHijos>=0);
      if (NroHijos>0) then
        begin
         for x:= 1 to NroHijos do
           begin
            GrupoPersona(False,x,True);
            Repeat
            TotalPagarHab:=CanDiasReservacion*PrecTipoHabitacion(TipoHabitacion);
            writeln(); writeln();
            writeln(' Total a Pagar: ', TotalPagarHab:10:2);
            writeln;
            write('                       Desea guardar los datos(S=si o N=no): ');
            opc:=Upcase(readkey);
          until (opc='S') or (opc='N');
          if (opc='S') then
           begin
            GrabarGrupoPersonas;
            writeln;writeln;
            write('                       Datos Guardado Satisfactoriamete...');
            delay(2000);
           end;
          end;

       Repeat
        TituloLidotel;
        writeln(' Reservacion  Grupo/Familiar:');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        writeln(' Nombre............: ', NombCliente);
        writeln(' Numero Reservacion: ', NroReservacion);
        writeln(' Tipo de Habitacion: ', DescTipoHabitacion(TipoHabitacion));
        writeln(' Cant.  Habitacion.: ',CantHabitacion);
        writeln(' Dia de Reservacion: ', DiaReservacion);
        writeln(' Mes de Reservacion: ', MesReservacion );
        writeln(' Ano de Reservacion: ', AnoReservacion);
        writeln(' Dias Reservacion..: ', CanDiasReservacion);
        writeln(' Cantidad de Hijos.: ',NroHijos);
        write  (' Cantidad de Adulto: ');
        readln(dato);
        val(dato,NroAdultos); {convertir dato string  a numerico}
       until (NroAdultos>=0);
      end;

      if (NroAdultos>0) then
       begin
         for x:= 1 to NroAdultos do
           begin
            GrupoPersona(True,x,True);
            Repeat
            TotalPagarHab:=CanDiasReservacion*(CantHabitacion*PrecTipoHabitacion(TipoHabitacion));
            writeln(); writeln();
            writeln(' Total a Pagar: ', TotalPagarHab:12:2);
            writeln;
            write('                       Desea guardar los datos(S=si o N=no): ');
            opc:=Upcase(readkey);
          until (opc='S') or (opc='N');
          if (opc='S') then
           begin
            GrabarGrupoPersonas;
            writeln;
            writeln;writeln;
            write('                       Datos Guardado Satisfactoriamete...');
            delay(2000);
           end;
          end;
       end;
        GrabarGrupoFamiliar;
     end
     Else
     Begin
       Repeat
       writeln;writeln;
       write(' Cliente No Existe, Desea Crearlo(S=si o N=no): ');
       opc:=upcase(readkey);
       until (opc='S') or (opc='N');
      if (opc='S') then
       begin
        IncluirCliente;
       End;
     end;

end;
Procedure VerReservacionIndividual;
Var
Ced,Nro,Dia,Mes,Ano: String;


Begin
 TituloLidotel;

 Writeln('Consulta de Reservaciones Individual');

 Writeln();
 Writeln('____________________________________________________________________________________________________________');
 {Recuperar datos del cliente}
 PosCursor:=BuscarCliente(RegReservacionIndividual.NacionCliente,RegReservacionIndividual.CedulaCliente);
 Str(RegReservacionIndividual.CedulaCliente,Ced);
 Str(RegReservacionIndividual.NroReservacion,Nro);
 Str(RegReservacionIndividual.DiaReservacion,Dia);
 Str(RegReservacionIndividual.MesReservacion,Mes);
 Str(RegReservacionIndividual.AnoReservacion,Ano);



 Textcolor(white); write(' Cliente...: '); Textcolor(black); write(RegReservacionIndividual.NacionCliente +'-'+Ced+' '+RegClienteLidotel.NombCliente) ;
 Textcolor(white); write('  Nro Reservacion: '); Textcolor(black); write(Nro);  Textcolor(white);write('  Fecha Reservacion: ') ; Textcolor(black); writeln(Dia+'/'+Mes+'/'+Ano);

 Textcolor(white); write(' Habitacion.: '); Textcolor(black); write(DescTipoHabitacion(RegReservacionHabitaciones.TipoHabitacion));
 Textcolor(white); write('  Cantidad: '); Textcolor(black);write(RegReservacionHabitaciones.CantHabitacion);
 Textcolor(white);   write('  Dias Reservacion: '); Textcolor(black);write(RegReservacionIndividual.CanDiasReservacion);
 Textcolor(white); write('  Precio: '); Textcolor(black);write(RegReservacionHabitaciones.PrecioHabitacion:12:2); Textcolor(white);   write('  Total a Pagar: '); Textcolor(black);writeln(RegReservacionHabitaciones.TotalPagarHab:12:2);

end;
procedure ConsultaIndividual;
Var
CanReg,RegAct:string ;
Opc : Char;
Begin

{Asigno el Archivo a Leer}
Assign(ReservacionIndividual_Int,ReservacionIndividual_Ext);
Assign(ReservacionHabitaciones_Int,ReservacionHabitaciones_Ext);
{Abrir el Archivo }
Reset(ReservacionIndividual_Int);
Reset(ReservacionHabitaciones_Int);
CanRegReservacionIndividual:=Filesize(ReservacionIndividual_Int);

 opc:=' ';
 If  CanRegReservacionIndividual > 0 then
  Begin
   PosRegReservacionIndividual:=0; {posicion primer registro del archivo}
   While Opc <> 'S' do
    Begin
    Str(CanRegReservacionIndividual,CanReg);
    Str(PosRegReservacionIndividual+1,RegAct);
    seek(ReservacionIndividual_Int,PosRegReservacionIndividual);
    Read(ReservacionIndividual_Int,RegReservacionIndividual);
    {Final del archivo, lo controlo por el total del registro leido, para mostrar el ultimo tambien, el eof me rompia la condicion}
    If (PosRegReservacionIndividual<=CanRegReservacionIndividual-1) Then
     Begin
     {Posisionar Archivo de ReservacionHabitaciones, para lectura de registros de habitaciones de la reservacion actual }
     seek(ReservacionHabitaciones_Int,0);
     while (eof(ReservacionHabitaciones_Int)=False)
     do begin
      Read(ReservacionHabitaciones_Int,RegReservacionHabitaciones);
      If (RegReservacionIndividual.NacionCliente=RegReservacionHabitaciones.NacionCliente  ) and
         (RegReservacionIndividual.CedulaCliente=RegReservacionHabitaciones.CedulaCliente  ) and
         (RegReservacionIndividual.NroReservacion=RegReservacionHabitaciones.NroReservacion)  then
          Begin
           VerReservacionIndividual;
           end;
      end;
     end
     Else
     Begin
       Write('Final del Archivo...');
       Delay(2000);
     end;
    {Seleccion del usuario para avanzar/Retroceder}
   Repeat
   writeln;
     Textcolor(white);
    Writeln(' REGISTRO: ' + RegAct+'/'+CanReg);
     Textcolor(Black);
    Writeln('____________________________________________________________________________________________________________');
    writeln;
    Write('    Seleccione Opcion (P=Proximo,A-Anterior,S=Salir): ');
    Opc:=Upcase(Readkey);
   until (opc='P') or (opc='A') or (opc='S');
   If (opc='P') And (CanRegReservacionIndividual-1<>PosRegReservacionIndividual) then PosRegReservacionIndividual:=PosRegReservacionIndividual+1;
   If (opc='A') And (PosRegReservacionIndividual<>0) then PosRegReservacionIndividual:=PosRegReservacionIndividual-1;

   end;


   end
         Else
     Begin
       Write('No Existe Registros de Reservacion Disponible..') ;
       Delay(2000);
       Opc:='S';  {forzo salida del ciclo while}
     end;



{cierro archivo}
Close(ReservacionIndividual_Int);
Close(ReservacionHabitaciones_Int);

end;
{***}
Procedure VerReservacionGrupoPersonasCli(TipoReservacion: String);
Begin
 TituloLidotel;
 Writeln('Consulta de Reservaciones ' +TipoReservacion);
 Writeln();

 Writeln('____________________________________________________________________________________________________________');

 end;

Procedure VerReservacionGrupoPersonasHab;
Var
Ced,Nro,Dia,Mes,Ano,CedPer,CanDias: String;

Begin
 {Recuperar datos del cliente}
 PosCursor:=BuscarCliente(RegReservacionIndividual.NacionCliente,RegReservacionIndividual.CedulaCliente);
 Str(RegClienteLidotel.CedulaCliente,Ced);
 Str(NroReservacion,Nro);
 Str(DiaReservacion,Dia);
 Str(MesReservacion,Mes);
 Str(AnoReservacion,Ano);
 Str(RegReservacionGrupoPersonas.CedulaPersona,CedPer);
 Str(CanDiasReservacion,CanDias);


  Textcolor(white); write(' Cliente...: '); Textcolor(black); write(RegClienteLidotel.NacionCliente +'-'+Ced+' '+RegClienteLidotel.NombCliente) ;
 Textcolor(white); write('  Nro Reservacion: '); Textcolor(black); write(Nro);  Textcolor(white);write('  Fecha Reservacion: ') ; Textcolor(black); writeln(Dia+'/'+Mes+'/'+Ano);
 Textcolor(white); write(' Habitacion.: '); Textcolor(black); write(DescTipoHabitacion(RegReservacionHabitaciones.TipoHabitacion));
 Textcolor(white); write('  Cantidad: '); Textcolor(black);write(RegReservacionHabitaciones.CantHabitacion);
 Textcolor(white);   write('  Dias Reservacion: '); Textcolor(black);write(CanDias);
 Textcolor(white);write('  Precio: '); Textcolor(black);write(RegReservacionHabitaciones.PrecioHabitacion:12:2);
 Textcolor(white);   write('  Total a Pagar: '); Textcolor(black);writeln(RegReservacionHabitaciones.TotalPagarHab:12:2);
 writeln()
end;
Procedure VerReservacionGrupoPersonasPer;
Var
Ced,Nro,Dia,Mes,Ano,CedPer: String;

Begin

 {Recuperar datos del cliente}
 PosCursor:=BuscarCliente(RegReservacionIndividual.NacionCliente,RegReservacionIndividual.CedulaCliente);
 Str(RegClienteLidotel.CedulaCliente,Ced);
 Str(NroReservacion,Nro);
 Str(DiaReservacion,Dia);
 Str(MesReservacion,Mes);
 Str(AnoReservacion,Ano);
 Str(RegReservacionGrupoPersonas.CedulaPersona,CedPer);

 Textcolor(white); write(' Vinculo.....: '); Textcolor(black);write(DescTipoVinculo(RegReservacionGrupoPersonas.TipoVinculo));
 Textcolor(white); write(' Cedula: '); Textcolor(black); write(RegReservacionGrupoPersonas.NacionPersona +'-'+CedPer+' '+RegReservacionGrupoPersonas.NombPersona) ;
 Textcolor(white); write(' Sexo: '); Textcolor(black); writeln(RegReservacionGrupoPersonas.SexoPersona);
end;
procedure ConsultaAcompanante;
Var
Opc: char;
Begin
{Asigno el Archivo a Leer}
Assign(ReservacionAcompanante_Int,ReservacionAcompanante_Ext);
Assign(ReservacionHabitaciones_Int,ReservacionHabitaciones_Ext);
Assign(ReservacionGrupoPersonas_Int,ReservacionGrupoPersonas_Ext);
{Abrir el Archivo }
Reset(ReservacionAcompanante_Int);
Reset(ReservacionHabitaciones_Int);
Reset(ReservacionGrupoPersonas_Int);
CanRegReservacionAcompanante:=Filesize(ReservacionAcompanante_Int);
Opc:=' ';
 If  CanRegReservacionAcompanante > 0 then
  Begin
   PosRegReservacionAcompanante:=0; {posicion primer registro del archivo}
   While Opc <> 'S' do
    Begin

    seek(ReservacionAcompanante_Int,PosRegReservacionAcompanante);
    Read(ReservacionAcompanante_Int,RegReservacionAcompanante);
    {Final del archivo, lo controlo por el total del registro leido, para mostrar el ultimo tambien, el eof me rompia la condicion}
    If (PosRegReservacionAcompanante<=CanRegReservacionAcompanante-1) Then
     Begin
     VerReservacionGrupoPersonasCli('Acompanante');
     {Posisionar Archivo de ReservacionHabitaciones, para lectura de registros de habitaciones de la reservacion actual }
     seek(ReservacionHabitaciones_Int,0);
     while (eof(ReservacionHabitaciones_Int)=False)
     do begin
      Read(ReservacionHabitaciones_Int,RegReservacionHabitaciones);
      If (RegReservacionAcompanante.NacionCliente=RegReservacionHabitaciones.NacionCliente  ) and
         (RegReservacionAcompanante.CedulaCliente=RegReservacionHabitaciones.CedulaCliente  ) and
         (RegReservacionAcompanante.NroReservacion=RegReservacionHabitaciones.NroReservacion)  then
          Begin
          NroReservacion:=RegReservacionAcompanante.NroReservacion;
          DiaReservacion:=RegReservacionAcompanante.DiaReservacion;
          MesReservacion:=RegReservacionAcompanante.MesReservacion;
          AnoReservacion:=RegReservacionAcompanante.AnoReservacion;
          CanDiasReservacion:=RegReservacionAcompanante.CanDiasReservacion;
          VerReservacionGrupoPersonasHab;
          {cargar datos del Acompante}
             {Posisionar Archivo de ReservacionGrupoPersonas, para lectura de registros de habitaciones de la reservacion actual }
              seek(ReservacionGrupoPersonas_Int,0);
              while (eof(ReservacionGrupoPersonas_Int)=False)
              do begin
              Read(ReservacionGrupoPersonas_Int,RegReservacionGrupoPersonas);
              If (RegReservacionAcompanante.NacionCliente=RegReservacionGrupoPersonas.NacionCliente  ) and
                 (RegReservacionAcompanante.CedulaCliente=RegReservacionGrupoPersonas.CedulaCliente  ) and
                 (RegReservacionAcompanante.NroReservacion=RegReservacionGrupoPersonas.NroReservacion)  then
               Begin
                    Str(CanRegReservacionAcompanante,CanReg);
                    Str(PosRegReservacionAcompanante+1,RegAct);

                   VerReservacionGrupoPersonasPer;
                end;
              end;
           end;
      end;
     end
     Else
     Begin
       Write('Final del Archivo...');
       Delay(2000);
     end;
    {Seleccion del usuario para avanzar/Retroceder}
    Writeln();
    Textcolor(white);
    Writeln(' REGISTRO: ' + RegAct+'/'+CanReg);
    Textcolor(Black);
   Repeat
    Writeln('____________________________________________________________________________________________________________');
    writeln;
    Write('    Seleccione Opcion (P=Proximo,A-Anterior,S=Salir): ');
    Opc:=Upcase(Readkey);
   until (opc='P') or (opc='A') or (opc='S');
   If (opc='P') And (CanRegReservacionAcompanante-1<>PosRegReservacionAcompanante) then PosRegReservacionAcompanante:=PosRegReservacionAcompanante+1;
   If (opc='A') And (PosRegReservacionAcompanante<>0) then PosRegReservacionAcompanante:=PosRegReservacionAcompanante-1;

   end;


   end
         Else
     Begin
       Write('No Existe Registros de Reservacion Disponible..') ;
       Delay(2000);
       Opc:='S';  {forzo salida del ciclo while}
     end;



{cierro archivo}
Close(ReservacionAcompanante_Int);
Close(ReservacionHabitaciones_Int);
Close(ReservacionGrupoPersonas_Int);

end;



{***}
procedure ConsultaGrupoFamilia;
Var
 Opc: char;
Begin
{Asigno el Archivo a Leer}
Assign(ReservacionGrupoFamiliar_Int,ReservacionGrupoFamiliar_Ext);
Assign(ReservacionHabitaciones_Int,ReservacionHabitaciones_Ext);
Assign(ReservacionGrupoPersonas_Int,ReservacionGrupoPersonas_Ext);
{Abrir el Archivo }
Reset(ReservacionGrupoFamiliar_Int);
Reset(ReservacionHabitaciones_Int);
Reset(ReservacionGrupoPersonas_Int);
CanRegReservacionGrupoFamiliar:=Filesize(ReservacionGrupoFamiliar_Int);
Opc:=' ';
 If  CanRegReservacionGrupoFamiliar > 0 then
  Begin
   VerReservacionGrupoPersonasCli('Acompanante');
   PosRegReservacionGrupoFamiliar:=0; {posicion primer registro del archivo}
   While Opc <> 'S' do
    Begin

    seek(ReservacionGrupoFamiliar_Int,PosRegReservacionGrupoFamiliar);
    Read(ReservacionGrupoFamiliar_Int,RegReservacionGrupoFamiliar);
    {Final del archivo, lo controlo por el total del registro leido, para mostrar el ultimo tambien, el eof me rompia la condicion}
    If (PosRegReservacionGrupoFamiliar<=CanRegReservacionGrupoFamiliar-1) Then
     Begin
      VerReservacionGrupoPersonasCli('Acompanante');

     {Posisionar Archivo de ReservacionHabitaciones, para lectura de registros de habitaciones de la reservacion actual }
     seek(ReservacionHabitaciones_Int,0);
     while (eof(ReservacionHabitaciones_Int)=False)

     do begin
      Read(ReservacionHabitaciones_Int,RegReservacionHabitaciones);
      If (RegReservacionGrupoFamiliar.NacionCliente=RegReservacionHabitaciones.NacionCliente  ) and
         (RegReservacionGrupoFamiliar.CedulaCliente=RegReservacionHabitaciones.CedulaCliente  ) and
         (RegReservacionGrupoFamiliar.NroReservacion=RegReservacionHabitaciones.NroReservacion)  then
          Begin
          NroReservacion:=RegReservacionGrupoFamiliar.NroReservacion;
          DiaReservacion:=RegReservacionGrupoFamiliar.DiaReservacion;
          MesReservacion:=RegReservacionGrupoFamiliar.MesReservacion;
          AnoReservacion:=RegReservacionGrupoFamiliar.AnoReservacion;
          CanDiasReservacion:=RegReservacionGrupoFamiliar.CanDiasReservacion;
            VerReservacionGrupoPersonasHab;
          end;
      end;
 
          {cargar datos del Acompante}
             {Posisionar Archivo de ReservacionGrupoPersonas, para lectura de registros de habitaciones de la reservacion actual }
              seek(ReservacionGrupoPersonas_Int,0);
              while (eof(ReservacionGrupoPersonas_Int)=False)
              do begin
              Read(ReservacionGrupoPersonas_Int,RegReservacionGrupoPersonas);
              If (RegReservacionGrupoFamiliar.NacionCliente=RegReservacionGrupoPersonas.NacionCliente  ) and
                 (RegReservacionGrupoFamiliar.CedulaCliente=RegReservacionGrupoPersonas.CedulaCliente  ) and
                 (RegReservacionGrupoFamiliar.NroReservacion=RegReservacionGrupoPersonas.NroReservacion)  then
               Begin
                    Str(CanRegReservacionGrupoFamiliar,CanReg);
                    Str(PosRegReservacionGrupoFamiliar+1,RegAct);
                    NroReservacion:=RegReservacionGrupoFamiliar.NroReservacion;
                    DiaReservacion:=RegReservacionGrupoFamiliar.DiaReservacion;
                    MesReservacion:=RegReservacionGrupoFamiliar.MesReservacion;
                    AnoReservacion:=RegReservacionGrupoFamiliar.AnoReservacion;
                    VerReservacionGrupoPersonasPer;
                end;
              end;


     end
     Else
     Begin
       Write('Final del Archivo...');
       Delay(2000);
     end;
    Writeln();
    Textcolor(white);
     Writeln(' REGISTRO: ' + RegAct+'/'+CanReg);
    Textcolor(Black);
    {Seleccion del usuario para avanzar/Retroceder}
   Repeat
    Writeln('____________________________________________________________________________________________________________');
    writeln;
    Write('    Seleccione Opcion (P=Proximo,A-Anterior,S=Salir): ');
    Opc:=Upcase(Readkey);
   until (opc='P') or (opc='A') or (opc='S');
   If (opc='P') And (CanRegReservacionGrupoFamiliar-1<>PosRegReservacionGrupoFamiliar) then PosRegReservacionGrupoFamiliar:=PosRegReservacionGrupoFamiliar+1;
   If (opc='A') And (PosRegReservacionGrupoFamiliar<>0) then PosRegReservacionGrupoFamiliar:=PosRegReservacionGrupoFamiliar-1;

   end;


   end
         Else
     Begin
       Write('No Existe Registros de Reservacion Disponible..') ;
       Delay(2000);
       Opc:='S';  {forzo salida del ciclo while}
     end;



{cierro archivo}
Close(ReservacionGrupoFamiliar_Int);
Close(ReservacionHabitaciones_Int);
Close(ReservacionGrupoPersonas_Int);

end;


{***}



Procedure Reservacion;
  var
    opc2: char;
   begin
    opc2:=' ';
      while opc2<>'9' do
        begin
         TituloLidotel;
         Writeln(' MENU PRINCIPAL:');
         writeln();
         repeat
         writeln(' *************************************');
         writeln(' *                                   *');
         writeln(' *   1: Reservacion Individual       *');
         writeln(' *   2: Reservacion Acompanante      *');
         writeln(' *   3: Reservacion Grupo/Familiar   *');
         writeln(' *   9: Salir                        *');
         writeln(' *                                   *');
         writeln(' *************************************');
         writeln();
         write(' Seleccione Opcion: ');
         opc2:=Readkey;
         clrscr();
         until Opc2 In['1','2','3','9'];
         writeln();
           case opc2 of
              '1': ReservacionIndividual;
              '2': ReservacionAcompanante;
              '3': ReservacionGrupoFamiliar;
              '9': Begin
                   end;
         end;
      end;
  end;

Procedure MenuCliente;
  var
    opc:char;
       begin
         opc:=' ';
         writeln();
         writeln('-----------------------------------------------------------------------------------------------------------------------');
         writeln('*                                                                                                                     *');
         writeln('*                              B I E N V E N I D O S    A L    H O T E L    L I D O T E L                             *');
         writeln('*                                                                                                                     *');
         writeln('-----------------------------------------------------------------------------------------------------------------------');
         writeln();
    while opc<>'9' do
      begin
         repeat
         TituloLidotel;
         Writeln(' MENU DE CLIENTE:');
         writeln();
         writeln(' ****************************');
         writeln(' *                          *');
         writeln(' *  1: Consultar Cliente    *');
         writeln(' *  2: Incluir Cliente      *');
         writeln(' *  3: Modificar Cliente    *');
         writeln(' *  4: Eliminar Cliente     *');
         writeln(' *  9: Salir                *');
         writeln(' *                          *');
         writeln(' ****************************');
         writeln();
         write(' Seleccione Opcion: ');
         opc:=Readkey;
         clrscr();
         until  Opc In['1','2','3','4','9'];
         writeln();
           case opc of
              '1': ConsultarCliente;
              '2': IncluirCliente;
              '3': ModificarCliente;
              '4': EliminarCliente;
              '9': Begin
                     TituloLidotel;
                     Writeln('Gracias por Usar el Sistema de Reservacion del Hotel LIDOTEL');
                   end;
           end;
       end;
   end;
Procedure MenuVerReservacion;
  var
    opc:char;
       begin
         opc:=' ';
         writeln();
         writeln('-----------------------------------------------------------------------------------------------------------------------');
         writeln('*                                                                                                                     *');
         writeln('*                              B I E N V E N I D O S    A L    H O T E L    L I D O T E L                             *');
         writeln('*                                                                                                                     *');
         writeln('-----------------------------------------------------------------------------------------------------------------------');
         writeln();
    while opc<>'9' do
      begin
         repeat
         TituloLidotel;
         Writeln(' MENU VER RESERVACION:');
         writeln();
         writeln(' *******************************************');
         writeln(' *                                         *');
         writeln(' *  1: Consultar Reservacion Individual    *');
         writeln(' *  2: Consultar Reservacion Acompanante   *');
         writeln(' *  3: Consultar Reservacion Grupo/Familia *');
         writeln(' *  9: Salir                               *');
         writeln(' *                                         *');
         writeln(' *******************************************');
         writeln();
         write(' Seleccione Opcion: ');
         opc:=Readkey;
         clrscr();
         until  Opc In['1','2','3','9'];
         writeln();
           case opc of
              '1': ConsultaIndividual;
              '2': ConsultaAcompanante;
              '3': ConsultaGrupoFamilia;
              '9': Begin
                     TituloLidotel;
                     Writeln('Gracias por Usar el Sistema de Reservacion del Hotel LIDOTEL');
                   end;
           end;
       end;
   end;
Procedure MenuPrincipal;
  var
    opc:char;
       begin
         opc:=' ';

   while opc<>'9' do
     begin
         TituloLidotel;
         Writeln(' MENU PRINCIPAL:');
         writeln();
         repeat
         writeln(' ***************************');
         writeln(' *                         *');
         writeln(' *   1: Cliente            *');
         writeln(' *   2: Reservacion        *');
         writeln(' *   3: Ver Reservacion    *');
         writeln(' *   9: Salir              *');
         writeln(' *                         *');
         writeln(' ***************************');
         writeln();
         write(' Seleccione Opcion: ');
         opc:=Readkey;
         clrscr();
         until Opc In['1','2','3','9'];
         writeln();
           case opc of
              '1': MenuCliente;
              '2': Reservacion;
              '3': MenuVerReservacion;
              '9': Begin
                     TituloLidotel;
                     Writeln('Gracias por Usar el Sistema de Reservacion del Hotel LIDOTEL');
                   end;
           end;
    end;
 end;

begin
   {Preparar el Ambiente de Trabajo }
   PrepararAmbiente;
   TituloLidotel;
   MenuPrincipal;
   Readkey();
end.
