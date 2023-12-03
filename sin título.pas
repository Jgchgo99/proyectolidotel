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
    GrupoPersonasRecord= Record
     NacionCliente: char;
     CedulaCliente: integer;
     NroReservacion: integer;
     TipoVinculo: string[15];
     NombCliente: string [40];
     ApellidoCliente: string [40];
     DiaNacCliente:integer;
     MesNacCliente: integer;
     AnoNacCliente: integer;
     EdadCliente: integer;
     TlfCliente: string [11];
     EmailCliente: string [40];
     SexoCliente: char;
     DirCliente: string [40];
   end;
 type
   ReservacionHabitacionesRecord= Record
     NacionCliente: char;
     CedulaCliente: integer;
     NroReservacion: integer;
     TipoHabitacion: string[15];
     CantHabitacion: integer;
     PrecioHabitacion: real;
     CanDiasReservacion: integer;
     DiaReservacion: integer;
     MesReservacion: integer;
     AnoReservacion: integer;
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


   RegGrupoPersonas: GrupoPersonasRecord;
   GrupoPersonas_Int: file of GrupoPersonasRecord;     {declaracion nombre archivo interno programa}
   GrupoPersonas_Ext: String;                           {declaracion nombre archivo Externo programa}


   RegReservacionHabitaciones:  ReservacionHabitacionesRecord;
   ReservacionHabitaciones_Int: file of  ReservacionHabitacionesRecord;     {declaracion nombre archivo interno programa}
   ReservacionHabitaciones_Ext: String;                           {declaracion nombre archivo Externo programa}

   RegReservacionTotalPagar:  ReservacionTotalPagarRecord;
   ReservacionTotalPagar_Int: file of   ReservacionTotalPagarRecord;     {declaracion nombre archivo interno programa}
   ReservacionTotalPagar_Ext: String;                           {declaracion nombre archivo Externo programa}

   PosPuntero,PosCursor : longint;
   NacionCliente, SexoCliente: char;
   CedulaCliente, DiaNacCliente,  MesNacCliente, AnoNacCliente, EdadCliente: integer;
   NombCliente, ApellidoCliente, PaisCliente, EmailCliente, DirCliente: string;
   DiaAfiliacion, MesAfiliacion, AnoAfiliacion: integer;
   TlfCliente: string;
   NroReservacion, CanDiasReservacion, DiaReservacion, MesReservacion,  AnoReservacion: integer;
   NroAdutos, NroHijos, CantHabitacion:integer;
   TipoVinculo, TipoHabitacion: string;
   TotalPagar, PrecioHabitacion: real;


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

{Inicializar Variables Reservacion de Total a Pagar }
 Procedure InzVarReservacionTotalPagar;
    begin
      NacionCliente:=' ';
      CedulaCliente:=0;
      NroReservacion:=0;
      TotalPagar:=0;
   end;
{Inicializar Variables  Reservacion de Habitaciones}
 Procedure InzVarReservacionHabitaciones;
   begin
     NacionCliente:=' ';
     CedulaCliente:=0;
     NroReservacion:=0;
     TipoHabitacion:='';
     CantHabitacion:=0;
     PrecioHabitacion:=0;
     CanDiasReservacion:=0;
     DiaReservacion:=0;
     MesReservacion:=0;
     AnoReservacion:=0;
   end;
{Inicializar Variables Grupo de Personas}
 Procedure InzVarGrupoPersonas;
   begin
      NacionCliente:=' ';
      CedulaCliente:=0;
      NombCliente:='';
      NroReservacion:=0;
      TipoVinculo:='';
      ApellidoCliente:='';
      DiaNacCliente:=0;
      MesNacCliente:=0;
      AnoNacCliente:=0;
      EdadCliente:=0;
      TlfCliente:='';
      EmailCliente:='';
      SexoCliente:=' ';
      DirCliente:='';
   end;
{Inicializar Variables Reservacion Grupo Familiar}
 Procedure InzVarReservacionGrupoFamiliar;
   begin
     NacionCliente:=' ';
     CedulaCliente:=0;
     NroReservacion:=0;
     CanDiasReservacion:=0;
     DiaReservacion:=0;
     MesReservacion:=0;
     AnoReservacion:=0;
     NroAdutos:=0;
     NroHijos:=0;
   end;
{Inicializar Variables Reservacion Acompanante}
 Procedure InzVarReservacionAcompanante;
   begin
     NacionCliente:=' ';
     CedulaCliente:=0;
     NroReservacion:=0;
     CanDiasReservacion:=0;
     DiaReservacion:=0;
     MesReservacion:=0;
     AnoReservacion:=0;
   end;
 {Inicializar Variables Reservacion Individual}
 Procedure InzVarReservacionIndividual;
   begin
     NacionCliente:=' ';
     CedulaCliente:=0;
     NroReservacion:=0;
     CanDiasReservacion:=0;
     DiaReservacion:=0;
     MesReservacion:=0;
     AnoReservacion:=0;
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
        writeln(' DATOS DEL CLIENTE');
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

 {Archivo Reservacion Grupo Familiar}
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
   GrupoPersonas_Ext:='GrupoPersonas.Dat';
   Assign(GrupoPersonas_Int,GrupoPersonas_Ext);
   {Verifico si el archivo no existe para crearlo}
   if fileexists(GrupoPersonas_Ext)=False then
    Begin
      {Crear el Archivo}
      Rewrite(GrupoPersonas_Int);
      {Cierro Archivo}
      Close(GrupoPersonas_Int);
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
        writeln(' CONSULTAR CLIENTE');
        writeln;
        writeln;
  {Validar Nacionalidad}
    repeat
      TituloLidotel;
      writeln(' CONSULTAR CLIENTE');
      writeln;
      write(' Nacionalidad (V,E): ');
      NacionCliente:=Upcase(Readkey);
      until (NacionCliente='V') or (NacionCliente='E');
      writeln();
    {Validar Cedula}
      repeat
      TituloLidotel;
      writeln(' CONSULTAR CLIENTE');
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
      writeln(' CONSULTAR CLIENTE');
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
      writeln(' INCLUIR CLIENTE');
      writeln;
      write(' Nacionalidad (V,E)....: ');
      NacionCliente:=Upcase(Readkey);
     until (NacionCliente='V') or (NacionCliente='E');
      writeln();
  {Validar Cedula}
     repeat
      TituloLidotel;
      writeln(' INCLUIR CLIENTE');
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
        writeln(' INCLUIR CLIENTE');
        writeln;
        writeln(' Nacionalidad (V,E): ', NacionCliente);
        writeln(' Cedula............: ', CedulaCliente);
        write  (' Nombre............: ');
        readln(NombCliente);
      until (NombCliente<>'');
   {Validar Apellido}
      repeat
        TituloLidotel;
        writeln(' INCLUIR CLIENTE');
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
        writeln(' INCLUIR CLIENTE');
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
        writeln(' INCLUIR CLIENTE');
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
        writeln(' INCLUIR CLIENTE');
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
        writeln(' INCLUIR CLIENTE');
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
        writeln(' INCLUIR CLIENTE');
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
        writeln(' INCLUIR CLIENTE');
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
        writeln(' INCLUIR CLIENTE');
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
        writeln(' INCLUIR CLIENTE');
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
        writeln(' INCLUIR CLIENTE');
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
        writeln(' INCLUIR CLIENTE');
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
        writeln(' INCLUIR CLIENTE');
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
        writeln(' INCLUIR CLIENTE');
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
      writeln(' INCLUIR CLIENTE');
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
      writeln  (' Ano de Afilicacion: ', AnoAfiliacion);
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
      writeln(' MODIFICAR CLIENTE');
      writeln;
      write (' Nacionalidad (V,E): ');
      NacionCliente:=Upcase(Readkey);
      until (NacionCliente='V') or (NacionCliente='E');
      writeln();
    {Validar Cedula}
      repeat
      TituloLidotel;
      writeln(' MODIFICAR CLIENTE');
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
        writeln(' MODIFICAR CLIENTE');
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
      writeln(' ELIMINAR CLIENTE');
      writeln;
      write(' Nacionalidad (V,E): ');
      NacionCliente:=Upcase(Readkey);
      until (NacionCliente='V') or (NacionCliente='E');
      writeln();
    {Validar Cedula}
      repeat
      TituloLidotel;
      writeln(' ELIMINAR CLIENTE');
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
      writeln(' ELIMINAR CLIENTE');
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

 Procedure ReservacionIndividual;
   var
     dato: string;
     begin
        randomize;
        NroReservacion:=random(9999999);
        dato:='';
        TituloLidotel;
        writeln(' Reservacion Individual');
        writeln;
        writeln;
  {Validar Nacionalidad}
      repeat
      TituloLidotel;
      writeln(' Reservacion Individual');
      writeln;
      write(' Nacionalidad (V,E): ');
      NacionCliente:=Upcase(Readkey);
      until (NacionCliente='V') or (NacionCliente='E');
      writeln();
    {Validar Cedula}
      repeat
      TituloLidotel;
      writeln(' Reservacion Individual');
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
      writeln(' Reservacion Individual');
      CargarDatosCliente;
      write  (' Nombre............: ', NombCliente);
      Repeat
       write (' Dia de Reservacion.: ', DiaReservacion);
       readln(dato);
       val(dato,DiaReservacion); {convertir dato string  a numerico}
      until (DiaReservacion>=1) and (DiaReservacion<=31);
      Repeat
        write  (' Mes de Reservacion.: ', MesReservacion);
        readln(dato);
        val(dato, MesReservacion); {convertir dato string  a numerico}
      until ( MesReservacion>=1) and ( MesReservacion<=12);
      Repeat
        write  (' Ano de Reservacion: ', AnoReservacion);
        readln(dato);
        val(dato,AnoReservacion); {convertir dato string  a numerico}
      until (AnoReservacion>1900);
      Repeat
        write  (' Numero de Reservacion: ', CanDiasReservacion );
        readln(dato);
        val(dato,CanDiasReservacion); {convertir dato string  a numerico}
      until (CanDiasReservacion>0);

        write  (' Numero de Reservacion: ', NroReservacion);



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


 Procedure ReservacionAcompanante;
   begin
   end;
 Procedure ReservacionGrupoFamiliar;
   begin
   end;

Procedure Reservacion;
  var
    opc2: char;
   begin
    opc2:=' ';
      while opc2<>'9' do
        begin
         TituloLidotel;
         Writeln(' MENU PRINCIPAL');
         writeln();
         repeat
         writeln(' *************************************');
         writeln(' *                                   *');
         writeln(' *   1: Reservacion Individual       *');
         writeln(' *   2: Reservacion Acompanante      *');
         writeln(' *   3: Reservacion Grupo Familiar   *');
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
         Writeln(' MENU DE CLIENTE');
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

Procedure MenuPrincipal;
  var
    opc:char;
       begin
         opc:=' ';

   while opc<>'9' do
     begin
         TituloLidotel;
         Writeln(' MENU PRINCIPAL');
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
              '3': writeln(' Ver Reservacion');
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

