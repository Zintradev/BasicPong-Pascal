program Tenis;
{$codepage utf8}
uses
   Crt;
const
  Xi=4;Xf=90;
  Yi=4;Yf=30;
  Xired=45;Yired=4;
  Xfred=45;Yfred=30;
var
  tecla,opcion,opcion1:char;
  a,b:string;
  puntos1,puntos2,X1,Y1,X2,Y2,X3,Y3,IncX,IncY,partida,L,velocidad:integer; //Posicion paleta


procedure PintarMenu();
begin
    Clrscr;
    Textbackground(Blue);
    GotoXY(40,10);
    Writeln('**** PONG ****  ');
    GotoXY(40,11);
    Textbackground(Yellow);
    Writeln('                ');
    Textbackground(Blue);
    GotoXY(40,12);
    Writeln('1-Jugar         ');
    GotoXY(40,13);
    Writeln('                ');
    GotoXY(40,14);
    Writeln('2-Instrucciones ');
    GotoXY(40,15);
    Writeln('                ');
    GotoXY(40,16);
    Writeln('3-Historia      ');
    GotoXY(40,17);
    Writeln('                ');
    GotoXY(40,18);
    Writeln('4-Salir         ');
    Textbackground(Black);
    Readkey;
end;
procedure Dificultad();
begin
    Textbackground(Blue);
    GotoXY(40,5);
    Writeln('                                      ');
    Textbackground(Blue);
    GotoXY(40,6);
    Writeln('HA PULSADO JUGAR,BIENVENIDO/A AL JUEGO');
    Textbackground(Blue);
    GotoXY(40,7);
    Writeln('                                      ');
    Textbackground(blue);
    GotoXY(40,10);
    Writeln('Escoja velocidad de la pelota: ');
    GotoXY(40,12);
    Writeln('1-Baja');
    GotoXY(40,14);
    Writeln('2-Media');
    GotoXY(40,16);
    Writeln('3-Alta');
    Textbackground(black);
    opcion1:=Readkey;
      if opcion1='1' then velocidad:=3000;
      if opcion1='2' then velocidad:=1500 ;
      if opcion1='3' then velocidad:=700 ;
      Clrscr;
end;

procedure PintarCampo;
var
  i:integer;
  begin
    // Horizontales
    for i:=Xi to Xf do
        begin
          TextBackground(green);
          TextColor(green);
          GotoXY(i,Yi);Write('Z');
          GotoXY(i,Yf);Write('Z');
        end;
  begin
    // Verticales
    for i:=Yi to Yf do
        begin
          GotoXY(Xi,i);Write('Z');
          GotoXY(Xf,i);Write('Z');
        end;
  begin
   //Red
   for i:=Yired to Yfred do
       begin
          GotoXY(Xired,i);Write('Z');
          GotoXY(Xfred,i);Write('Z');
       end;
  end;
  end;
  end;
function TeclaPulsada():char;

begin
//Devuelve la tecla pulsada 0 '.' si no se ha pulsado tecla
  if Keypressed then TeclaPulsada:=Readkey
  else TeclaPulsada:='.';
end;
procedure Historia();
begin
Clrscr;
Writeln('*************************** HISTORIA *********************************************************');
Writeln('                                                                                              ');
Writeln('                                                                                              ');
Writeln('Pong (o Tele-Pong) fue un videojuego de la primera generación de videoconsolas publicado por Atari,');
Writeln('creado por Nolan Bushnell y lanzado el 29 de noviembre de 1972.');
Writeln('Pong está basado en el deporte de tenis de mesa (o ping pong).');
Writeln('La palabra Pong es una marca registrada por Atari Interactive,');
Writeln('mientras que la palabra genérica «pong» es usada para describir el género de videojuegos «bate y bola».');
Writeln('La popularidad de Pong dio lugar a una demanda de infracción de patentes.');
Writeln('ganada por parte de los fabricantes de Magnavox Odyssey, que poseía un juego similar.');
Writeln;
Writeln('Pong fue el primer videojuego con éxito comercial, y ayudó a establecer la industria de los videojuegos.');
Writeln('Al poco de su lanzamiento, varias empresas empezaron a producir juegos que lo imitaban.');
Writeln('Finalmente, los competidores de Atari lanzaron nuevos tipos de videojuegos');
Writeln('de los cuales se desviaban del formato original de Pong en varios grados,');
Writeln('y esto, a su vez, trajo a Atari a animar su personal a ir más allá del «Pong»');
Writeln('y producir ellos mismos juegos más innovadores. ');
Writeln('PULSE"ENTER" PARA VOLVER AL MENU');
Readln;
end;

procedure Instrucciones();
begin
Clrscr;
    Writeln('*************************** INSTRUCCIONES *********************************************************');
    Writeln('                                                                                              ');
    Writeln('                                                                                              ');
    Writeln('JUGADOR 1: "W" ARRIBA "S" ABAJO');
    Writeln('JUGADOR 2: "I" ARRIBA "K" ABAJO');
    Writeln('SI EL EXTREMO DE LA PALA TOCA LA PELOTA IRA ARRIBA SI ES EL EXTREMO SUPERIOR Y HACIA ABAJO SI ES EL INFERIOR');
    Writeln('EL OBJETIVO ES QUE LA PELOTA GOLPEE EN EL LADO CONTRARIO');
    Writeln('GANA EL PRIMERO EN LLEGAR A 10 PUNTOS');
    Writeln('PULSE"ENTER" PARA VOLVER AL MENU');
    readln;
end;

procedure Juego();
begin
clrscr;
  Dificultad;


  //MARCADOR
  Textbackground(blue);
  GotoXY(40,8);
  Writeln('                                  ');
  GotoXY(40,9);
  Writeln('Escriba el nombre de los jugadores');
  GotoXY(40,10);
   Writeln('                                  ');
  GotoXY(40,12);
  Write('JUGADOR1: ');
  Readln(a);
  Textbackground(blue);
  GotoXY(40,14);
  Write('JUGADOR2: ');
  Readln(b);
  textbackground(black);
  clrscr;
  textbackground(black);
  GotoXY(40,10);
  Writeln('EMPIEZA EL JUEGO');
  delay(500);
  GotoXY(40,12);
  Writeln('3');
  delay(500);
  GotoXY(40,14);
  Writeln('2');
  delay(500);
  GotoXY(40,16);
  Writeln('1');
  delay(500);
  GotoXY(40,18);
  Writeln('YA');
  delay(500);
  Clrscr;


  GotoXY(42,2);
  Textcolor(White);
  Textbackground(blue);
  Writeln('MARCADOR: ');
  GotoXY(30,3);
  Textcolor(White);
  Textbackground(blue);
  Writeln(a,'=',puntos1,'                        ',b,'=',puntos2);


  textbackground(black);

  //CAMPO Y HERRAMIENTAS
  cursoroff;
  //Pintamos el campo
  PintarCampo;
  //Posicion inicial paleta
  textbackground(black);
  X1:=Xi+2;
  Y1:=(Yi+Yf) DIV 2;
  GotoXY(X1,Y1+1); Write('Z');
  GotoXY(X1,Y1); Write('Z');
  GotoXY(X1,Y1-1);Write('Z');
  //Paleta derecha
  X2:=Xi+84;
  Y2:=(Yi+Yf) DIV 2;
  GotoXY(X2,Y2+1); Write('Z');
  GotoXY(X2,Y2); Write('Z');
  GotoXY(X2,Y2-1); Write('Z');
  //Pelota
  X3:=Xi+40;
  Y3:=(Yi+Yf) DIV 2;
  GotoXY(X3,Y3); Write('Z');
  IncX:=1;
  IncY:=1;
  //Puntos
  Partida:=5;
  Puntos1:=0;
  Puntos2:=0;


  //EMPIEZA EL JUEGO
  repeat
    tecla:=Teclapulsada;
    // Mover pelota
    L:=L+1;
     if L=velocidad then
     begin
        Textbackground(black);
        //Borrar pelota
        GotoXY(X3,Y3);
        if (X3=Xired) then
        begin
        Textbackground(green);
        Write('Z');
        Textbackground(black)
        end
        else
        Write(' ');
        //Cambiar posicion pelota
        X3:=X3+IncX;  Y3:=Y3+IncY;
        //Pintar pelota
        GotoXY(X3,Y3);Write('O');
        L:=0;
   end;

        //Rebota Vertical
        if (Y3+IncY=Yi)or(Y3+IncY=Yf) then IncY:=-IncY;

       //Rebota Horizontal
        if X3+IncX=Xi then
        //Puntos
        begin
          //IncX:=+IncX;
          Puntos2:=Puntos2+1;
          GotoXY(30,3);
          Textcolor(White);
          Textbackground(blue);
          Writeln(a,'=',puntos1,'                        ',b,'=',puntos2);
          Textbackground(black);
          //Paramos la pelota
          IncX:=0;
          IncY:=0;
          delay(100);
          //Borramos la pelota
          GotoXY(X3,Y3);
          Write(' ');
         //Saque
          X3:=X1+1;
          Y3:=Y1;
          IncX:=1;
          IncY:=-1;
        end;

        if X3+IncX=Xf then
        //Puntos
        begin
          //IncX:=+IncX;
          Puntos1:=Puntos1+1;
          GotoXY(30,3);
          Textcolor(White);
          Textbackground(blue);
          Writeln(a,'=',puntos1,'                        ',b,'=',puntos2);
          Textbackground(black);
          //Paramos la pelota
          IncX:=0;
          IncY:=0;
          delay(100);
          //Borramos la pelota
          GotoXY(X3,Y3);
          Write(' ');
         //Saque
          X3:=X2-1;
          Y3:=Y2;
          IncX:=-1;
          IncY:=-1;
        end;




        //Rebote en paleta
        if (X3+IncX=X1) and ((Y3+IncY=Y1-1) or (Y3+IncY=Y1) or (Y3+IncY=Y1+1)) then

        begin
          if(Y3+IncY)=Y1-1 then IncY:=-1;
          if(Y3+IncY)=Y1 then IncY:=0;
          if(Y3+IncY)=Y1+1 then IncY:=+1;
          IncX:=-IncX;
        end;

        if (X3+IncX=X2) and ((Y3+IncY=Y2-1) or (Y3+IncY=Y2) or (Y3+IncY=Y2+1)) then
        begin
          if(Y3+IncY)=Y2-1 then IncY:=-1;
          if(Y3+IncY)=Y2 then IncY:=0;
          if(Y3+IncY)=Y2+1 then IncY:=+1;
          IncX:=-IncX;
        end;


  //PALETAS MOVIMIENTO
  tecla:=TeclaPulsada;
    //Paleta izquierda
    Textbackground(black);
    Textcolor(green);
    //arriba
    if tecla='w' then
    if (Y1-2)>Yi then
    begin
    GotoXY(X1,Y1+1); Write(' '); //Borro paleta
    Y1:=Y1-1;
    GotoXY(X1,Y1-1); Write('Z'); // Pinto paleta
    end;
    //abajo
    if tecla='s' then
    if (Y1+2)<Yf then
    begin
    GotoXY(X1,Y1-1); Write(' '); //Borro paleta
    Y1:=Y1+1;
    GotoXY(X1,Y1+1); Write('Z'); // Pinto paleta
     end;

    //Paleta derecha
    //arriba
    if tecla='i' then
    if (Y2-2)>Yi then
    begin
    GotoXY(X2,Y2+1); Write(' '); //Borro paleta
    Y2:=Y2-1;
    GotoXY(X2,Y2-1); Write('Z'); // Pinto paleta
    end;
    //abajo
    if tecla='k' then
    if (Y2+2)<Yf then
    begin
    GotoXY(X2,Y2-1); Write(' '); //Borro paleta
    Y2:=Y2+1;
    GotoXY(X2,Y2+1); Write('Z'); // Pinto paleta
    end;
       until (Puntos1=Partida) or (Puntos2=Partida) or (tecla=Chr(27));
       clrscr;
       if (Puntos2<Partida) and (Puntos1=Partida) then
       begin
       Textbackground(blue);
       GotoXY(10,10);Writeln('Ganador el Jugador: ',a);
         Textbackground(black);
       end;
       if (Puntos1<Partida) and (Puntos2=Partida) then
       begin
       Textbackground(blue);
       GotoXY(20,10);Writeln('Ganador el Jugador: ',b);
       Textbackground(black);
       end;

       if (puntos1<partida) and (puntos2<partida) then
       Writeln;
       delay(5000);
       Clrscr;
       PintarMenu;
end;

begin
    repeat
      PintarMenu;
      opcion:=Readkey;
      case opcion of
      '1':Juego;
      '2':Instrucciones;
      '3':Historia;
      end;
      until opcion='4';
        ClrScr;
      Textbackground(blue);
      Textcolor(white);
      Write('************************************************************************************************************************');Delay(50);
      Write('************************************************************************************************************************');Delay(50);
      Write('************************************************************************************************************************');Delay(50);
      Write('************************************************************************************************************************'); Delay(50);
      Write('************************************************************************************************************************'); Delay(50);
      Write('************************************************************************************************************************'); Delay(50);
      Write('************************************************************************************************************************'); Delay(50);
      Write('************************************************************************************************************************'); Delay(50);
      Write('************************************************************************************************************************'); Delay(50);
      Write('************************************************************************************************************************'); Delay(50);
      Write('************************************************************************************************************************'); Delay(50);
      Write('************************************************************************************************************************'); Delay(50);
      Write('************************************************************************************************************************'); Delay(50);
      Write('************************************************************************************************************************'); Delay(50);
      Write('************************************************************************************************************************'); Delay(50);
      Textbackground(Yellow);
      textbackground(White);
      Textcolor(black);
      Write('************************************************* GRACIAS POR JUGAR ****************************************************');  Delay(50);
      Textbackground(blue);
      Textcolor(white);
      Write('************************************************************************************************************************'); Delay(50);
      Write('************************************************************************************************************************');Delay(50);
      Write('************************************************************************************************************************'); Delay(50);
      Write('************************************************************************************************************************'); Delay(50);
      Write('************************************************************************************************************************'); Delay(50);
      Write('************************************************************************************************************************');  Delay(50);
      Write('************************************************************************************************************************');  Delay(50);
      Write('************************************************************************************************************************'); Delay(50);
      Write('************************************************************************************************************************'); Delay(50);
      Write('************************************************************************************************************************'); Delay(50);
      Write('************************************************************************************************************************');   Delay(50);
      Write('************************************************************************************************************************');Delay(50);
      Write('************************************************************************************************************************');  Delay(50);

      Delay(500);
      Readln;
end.

