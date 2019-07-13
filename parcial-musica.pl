disco(floydRosa, elLadoBrillanteDeLaLuna, 1000000, 1973).
disco(tablasDeCanada, autopistaTransargentina, 500, 2006).
disco(rodrigoMalo, elCaballo, 5000000, 1999).
disco(rodrigoMalo, loPeorDelAmor, 50000000, 1996).
disco(rodrigoMalo, loMejorDe, 50000000, 2018).
disco(losOportunistasDelConurbano, ginobili, 5, 2018).
disco(losOportunistasDelConurbano, messiMessiMessi, 5, 2018).
disco(losOportunistasDelConurbano, marthaArgerich, 15, 2019).

manager(floydRosa, normal(15)).
manager(tablasDeCanada, buenaOnda(cachito, canada)).
manager(rodrigoMalo, estafador).


porcentaje(canada, 5).
porcentaje(mexico,1 5).


clasico(Artista) :-
  disco(Artista, loMejorDe, _, _).
clasico(Artista) :-
  disco(Artista, _, Ventas, _),
  Ventas > 100000.

ventasTotales(Artista, Ventas) :-
    disco(Artista, _, _, _),
    findall(Ventas, disco(Artista, _, Ventas, _), ListaDeVentas),
    sum_list(ListaDeVentas, Ventas).

ventasBrutas(Artista, Bruto) :-
  ventasTotales(Artista, Total),
  Bruto is Total/10.

ventasNetas(Artista, Neto) :-
  manager(Artista, TipoDeManager),
  ventasBrutas(Artista, Bruto),
  restarPlataDelManager(TipoDeManager, Bruto, Neto).

restarPlataDelManager(buenaOnda(_,Pais), Bruto, Neto) :-
    porcentaje(Pais, Porcentaje),
    Neto is Bruto*(100-Porcentaje).
    
restarPlataDelManager(estafador, _, 0).
restarPlataDelManager(normal(Porcentaje, Fijo), Bruto, Neto) :-
  Neto is Bruto - Fijo - (Porcentaje/100)*Bruto.

numberUan(Anio, Artista) :-
  artistaAutogestionado(Artista),
  disco(Artista, Disco, Cantidad, Anio),
  not(disco(Artista, OtroDisco, OtraCantidad, Anio),   artistaAutoGestionado(Artista), Cantidad < OtraCantidad).

artistaAutogestionado(Artista) :-
  disco(Artista, _, _, _),
  not(manager(Artista, _)).
