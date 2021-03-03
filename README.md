# Poznański Panel Obywatelski
Skrypt użyty do losowania Panelistów i Panelistek w Pierwszym Poznańskim Panelu Obywatelskim

Procedura wyboru składu panelu została zbudowana w oparciu o algorytm symulowanego wyżarzania.

Na początek definiujemy funkcję oceny danego składu. Przypuśćmy, że szukamy panelu w skład którego ma wejść Xm mężczyzn i Xk kobiet oraz Yp osób z wykształceniem podstawowym, YS z wykształceniem średnim oraz YW z wykształceniem wyższym. Dla danego składu panelu P zliczamy ile w jego skład wchodzi kobiet mężczyzn i osób z danym wykształceniem i oznaczamy te liczby odpowiednio przez XM(P), XK(P), YP(P), YS(P), YW(P).
Funkcję oceny danego panelu P definiujemy jako

> F(P)=( Xm(P)-Xm)^2+( Xk(P)-Xk)^2+( Yp(P)-Yp)^2+( Ys(P)-Ys)^2+( Yw(P)-Yw)^2

Idealny skład panelu jest równoważny warunkowi F(P)=0. 

Gdy skład panelu jest zdefiniowane przez większą liczbę parametrów na tej samej zasadzie dodajemy je do funkcji oceny.

Opis algorytmu (wybór N osób do panelu)
1. Ustalamy parametr T nazywany temperaturą.
1. Wybieramy losowo N osób, które tworzą skład panelu P.
1. Liczymy wartość funkcji oceny F(P).
1. Losujemy nowy skład panelu P’ w otoczeniu P zgodnie z prawdopodobieństwem normalnym o średniej w punkcie P i wariancją równą T.
1. Liczymy wartość funkcji oceny F(P’).
1. Obliczamy wartość A=e(F(P)-F(P’))/T. Losujemy liczbę x z przedziału [0,1]. Jeżeli jest ona mniejsza od A, to zastępujemy skład panelu P składem panelu P’.
1. Zmniejszamy temperaturę  T o ΔT.
1. Jeśli temperatura jest większe od zera wracamy do punktu 3, w przeciwnym razie zwracamy skład panelu P.

Dobór parametrów T i ΔT następujemy na zasadzie testów, aby zoptymalizować działanie algorytmu w danej sytuacji.

