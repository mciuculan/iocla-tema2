Tema 2 - IOCLA - 2020

La problema 1, otp, parcurg cuvantul cu un loop. Iau litera la
care ma aflu si o pun intr-un alt registru pe 8 biti. Fac operatia
de xor si rezultatul il pun in ciphertext la pozitia la care ma
aflu.

La problema 2, caesar, iterez ca in problema anterioara prin cuvant.
Dau push la key pentru a putea modifica registrul fara a pierde
valoarea. Urmeaza cazurile:
1. cheia este 0 deci nu trebuie modificat nimic, sar peste
toate operatiile si pun in ciphertext plaintext.
2. caracterul nu este litera, asa ca nu modific nimic, ca la cazul
anterior.
3. verific daca este litera mare sau litera mica. Aici fac jump
la labelurile numite sugestiv lower_case si upper_case. In ele
adun cate 1 pana cand ajung la key. Daca depaseste z, respectiv Z,
ma intorc la a, respectiv A. Am ales aceasta varianta pentru ca
pentru ca daca aveam o cheie prea mare putea sa iasa din ascii si,
chiar daca o scadeam pentru a ma intoarce la caracterul initial,
tot ramanea un caracter non-ascii in el.
Ulterior, ma intorc la back unde adaug la sirul final la pozitia
curenta.

Problema 3 merge pe acelasi principiu ca si problema 2. Parcurg
stringul si verific caracterul la care ajung daca este litera sau nu.
Daca nu este litera, printez exact ce am primit. Altfel, parcurg cu
ecx sirul din cheie. Cand ajung la lungimea cheii, resetez ecx pe 0.
Salvez in KEY caracterul la care ma aflu din cheie. Scad din ea 'A'
pentru a afla cat trebuie adaugat. Apoi iau cazurile litera mica si
mare. Imi iau un BACKUP pentru a ma putea intoarce la caracter in
cazul in care modific si imi iese din ASCII. La literele mici scad
32 pentru a le face mari pentru a evita iesirea din setul de caractere
ASCII. Dupa ce adaug cheia si scad 26 (in cazul in care depaseste
literele), revin si la litera mica. Incrementez ecx doar daca a fost
litera caracterul la care am ajuns.

La problema 4, strstr, am pus cele 2 lungimi in variabile separate
pentru a-mi goli registri. ca la primele 2 probleme, parcurg sirul
si compar fiecare litera din haystack cu prima litera din needle.
Also, salvez de fiecare data in index, valoarea de unde am pornit
pentru a ma putea intoarce sa caut de la index + 1 in cazul in care
nu se potriveste unul dintre urmatoarele caractere. Cand gasesc o
litera care se potriveste cu prima din needle dau un jump la un alt
label unde compar caracter cu caracter. Daca nu se potriveste,
modific ecx cu valoarea din INDEX si ma intorc la parcurgerea sirului.
Daca se ajunge la lungimea sirului cautat, atunci este gasit si se
returneaza valoarea din INDEX. Daca se termina loop ul fara a se
gasi acel sir, atunci se returneaza lungimea sirului + 1.


Problema 5, bin to hex, nefunctionala
