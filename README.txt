Part-1
Pentru prima functie, imi imaginez ca labirintul este o matrice inferior 
diagonala si o bordez cu 0. Pentru a afla probabilitatile numar cate elemente 
nenule, care respecta directiile labirintului,  are fiecare numar. De exemplu,
nu pot sa merg la pozitia aferenta liniei mele -q, coloana +1.

Pentru partea a doua am parcurs matricea si am scos valurile nenule in vectorul
values. Am pus in colind indicii fiecarei valori nenule gasite, iar in rowptr
al catelea element nenul se gaseste primul pe fiecare coloana.

Pentru partea a treia am implementat factorizarea Jacobi, urmarind formulele 
deja consacrate.

Pentru partea a patra, am initializat x si x vechi(la mine y) si am oprit 
algoritmul Jacobi_sparse atunci cand norma celor doi vectori era mai mica
decat toleranta data.

Feedback: Probabl cel mai simplu de inteles si implementat task, insa
a durat ceva sa imi dau seama dupa exemplul vostru de la matrix_to_csr 
ca rowptr nu trebuie sa contina de fapt, primul element nenul de pe fiecare
linie, ci numarul acestuia.

Part-2
Pentru prima functie, am calculat initial media aritmetica a punctelor in 
functie de clusterul aferent lor. Apoi am inceput sa recalculez centroizii
in functie de punctul cel mai apropiat de ei si sa repet asta pana cand 
pozitia lor nu se mai schimba.

Pentru a doua functie am facut suma distantelor minime de la puncte la centroizi

Feedback: Putin greu de inteles la inceput, ar fi fost mai bine sa avem un 
exemplu care sa ne arata efectiv ce se intampla la fiecare pas.

Part-3
Pentru prima functie am calculat intervalele in care se incadreaza fiecare
pixel. Am aflat cati pixeli sunt in fiecare interval facand diferenta dintre
lungimile a doua intervale vecine.

Pentru a doua functie am folosit aceeasi gandire ca pentru prima, insa am
implementat si functi rgb2hsv.

Pentru functiile Householder si SST am implementat algoritmi pentru aflarea 
matricilor Q si R si rezolvarea unui sistem superior triunghiular.

Pentru functia learn, am folosit functiile Householder si SST pentru a 
determina w.

Functiile preprocess si evaluate sunt asemanatoare, intrucat a trebuit sa 
parcurg folderele cu toate pozele cu si fara pisici si  sa contruiesc X si y.
La evaluate am calculat si procentajul pozelor corect identificate.

Feedback: Cu siguranta cel mai greu de implementat task din aceasta tema. 
Problema cu care m-am confruntat a fost timpul de rezolvare, insa am  invatat sa 
vectorizez pentru a rezolva aceasta problema.
