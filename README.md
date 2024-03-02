# Interpolation-Numerical-Methods

Interpolare Bicubica

bicubic_coef - calculeaza matricea A de coeficienti de interpolare bicubica intre cele 4 puncte,
primind la intrare matricile cu derivate precalculate.

bicubic_resize - redimensioneaza imaginea alb-negru I de dimensiune m x n astfel incat aceasta
sa aiba dimensiunea p x q
 -daca imaginea e alb negru, ignoram
 -vom calcula factorii de scalare s_x si s_y ca fiind raportul dintre marimea de dupa scalare si
marimea initiala.
 -definim matricea de transformare T, ii calculam inversa si precalculam derivatele
 -parcurgem imaginea pixel cu pixel, aplicam transformarea inversa si calculam xp si yp pe care
le trecem in sist de coordonate 1,n pt a putea aplica interpolarea si gasim cele 4 puncte ce
inconjoara x, y
 -calculam coef de interpolare A, trecem coordonatele xp, yp in patratul unitate si calculam
valoarea interpolata a pixelului.
-in final transformam matricea rezultata in uint8

bicubic_resize_RGB - realizeaza acelasi lucru pentru o imagine RGB

precalc_d - prelucreaza matricile Ix, Iy, Ixy ce contin derivatele dx, dy, dxy ale imaginii
I pentru fiecare pixel al acesteia.
Pentru aceasta calculam dimensiunea imaginii, double(I), matricea cu derivate fata de x, y si xy.


Interpolare Proximala

proximal_2x2 - Aplica Interpolare Proximala pe imaginea 2 x 2 f cu puncte intermediare echidistante,
avand intre ele distanta data de STEP.
 -definim coordonatele x si y ale punctelor intermediare
 -aflam nr de puncte
 -initializam rezultatul cu o matrice nula
 -parcurgem imaginea pixel cu pixel, aflam cel mai apropiat pixel din imaginea initiala si calculam
pixelul din imaginea finala.

proximal_2x2_RGB - realizeaza acelasi lucru pentru o imagine RGB

proximal_resize - asemenea bicubic_resize, insa initiaizam matricea finala drept o matrice nula, iar
in parcurgerea pixelilor calculam cel mai apropiat pixel si valoarea pixelului din imaginea finala.
In final transformam matricea rezultata in unit8.

proximal_resize_RGB - realizeaza acelasi lucru pentru o imagine RGB

proximal_rotate - Roteste imaginea alb-negru I de dimensiune m x n cu unghiul rotation_angle,
aplicand Interpolare Proximala.
 -convertim imaginea de intrare la alb-negru, daca este cazul
 -calculam cos si sin al unghiului de rotatie
 -initializam matricea finala
 -calculam matricea de transformare T_rot si inversa acesteia
 - pargurem imaginea pixel cu pixel si aplicam transformarea inversa asupra (x,y) si calculam x_p si y_p,
trecem xp,yp in sist de coordonate [1,n] pt a aplica interpolarea (in cazul in care xp,yp se afla in
exteriorul imaginii se pune pixel negru)
 -aflam punctele ce inconjoara xp,yp
 -calculam coef de interpolare si val interpolata a pixelului (x,y)
 -in final transformam matricea rezultata in uint8

proximal_rotate_RGB - realizeaza acelasi lucru pentru o imagine RGB

proximal_coef - calculeaza matr A, vectorul b si coef

